import sys
from PyQt6 import QtWidgets
from PyQt6.QtWidgets import *
from qwsql import QwSql
from RegForm import Ui_Form


class MainW(QtWidgets.QWidget, Ui_Form):
    def __init__(self, parent=None):
        super(MainW, self).__init__(parent)
        self.setupUi(self)
        self.EnterButton.clicked.connect(self.enter)
        self.CloseButton.clicked.connect(sys.exit)

    def enter(self):
        login = self.LoginEdit.text()
        password = self.PasswordEdit.text()
        data = QwSql().auth(login, password)
        if data:
            self.openContractWindow()
        else:
            print("Ошибка аутентификации")

    def openContractWindow(self):
        contract_data = QwSql().get_contract_data()
        categories = QwSql().get_categories()
        payment = QwSql().get_payments()
        status = QwSql().get_status()
        self.contract_window = ContractWindow(contract_data, categories, payment, status)
        self.contract_window.show()


class ContractWindow(QtWidgets.QWidget):
    def __init__(self, data, categories, payment, status):
        super().__init__()
        self.setWindowTitle("Contract Information")
        self.setGeometry(0, 0, 600, 400)

        layout = QtWidgets.QVBoxLayout()
        self.setLayout(layout)

        # Создание ComboBox для выбора столбца сортировки
        self.sort_combo_box = QComboBox()
        self.sort_combo_box.addItems(['id', 'Объект контракта', 'Тип оплаты', 'Категория', 'Статус контракта'])
        layout.addWidget(self.sort_combo_box)

        payment_layout = QtWidgets.QVBoxLayout()
        status_layout = QtWidgets.QVBoxLayout()
        category_layout = QtWidgets.QVBoxLayout()

        # Создание флажков для выбора типа оплаты
        self.payment_type_checkboxes = []
        payment_types = [method[0] for method in payment]
        for payment_type in payment_types:
            checkbox = QCheckBox(payment_type)
            self.payment_type_checkboxes.append(checkbox)
            payment_layout.addWidget(checkbox)

        flags = QtWidgets.QHBoxLayout()
        flags.addLayout(payment_layout, 0)
        layout.addLayout(flags)

        # Создание флажков для выбора статуса оплаты
        self.status_type_checkboxes = []
        status_types = [method[0] for method in status]
        for status_type in status_types:
            checkbox = QCheckBox(status_type)
            self.status_type_checkboxes.append(checkbox)
            status_layout.addWidget(checkbox)

        flags.addLayout(status_layout, 1)

        # Создание флажков для выбора категории
        self.category_type_checkboxes = []
        category_types = [method[0] for method in categories]
        for category_type in category_types:
            checkbox = QCheckBox(category_type)
            self.category_type_checkboxes.append(checkbox)
            category_layout.addWidget(checkbox)

        flags.addLayout(category_layout, 2)

        # Создание кнопки "Применить"
        self.apply_button = QPushButton("Применить")
        self.apply_button.clicked.connect(self.apply_sorting_and_filtering)
        layout.addWidget(self.apply_button)

        self.table = QtWidgets.QTableWidget()
        self.table.horizontalHeader().setSectionResizeMode(QHeaderView.ResizeMode.Stretch)
        self.table.verticalHeader().setSectionResizeMode(QHeaderView.ResizeMode.Stretch)
        self.table.verticalHeader().setVisible(False)
        layout.addWidget(self.table)

        # Установка количества строк и столбцов
        self.table.setRowCount(len(data))
        self.table.setColumnCount(len(data[0]))
        self.table.setHorizontalHeaderLabels(['id', 'Объект контракта', 'Тип оплаты', 'Категория', 'Статус контракта'])

        # Заполнение таблицы данными
        for i, row in enumerate(data):
            for j, cell in enumerate(row):
                self.table.setItem(i, j, QtWidgets.QTableWidgetItem(str(cell)))

        self.setSizePolicy(QtWidgets.QSizePolicy.Policy.Expanding, QtWidgets.QSizePolicy.Policy.Expanding)
        screen_geometry = QApplication.primaryScreen().geometry()
        window_geometry = self.frameGeometry()
        window_geometry.moveCenter(screen_geometry.center())
        self.move(window_geometry.topLeft())

    def apply_sorting_and_filtering(self):
        try:
            # Получение индекса выбранного столбца сортировки
            selected_column = self.sort_combo_box.currentIndex()
            # Сортировка данных в таблице по выбранному столбцу
            self.table.sortItems(selected_column)

            for row in range(self.table.rowCount()):
                self.table.setRowHidden(row, False)

            # Получение выбранных типов оплаты
            selected_payment_types = [checkbox.text() for checkbox in self.payment_type_checkboxes if
                                      checkbox.isChecked()]

            # Получение выбранных статусов контракта
            selected_status_types = [checkbox.text() for checkbox in self.status_type_checkboxes if
                                     checkbox.isChecked()]

            # Получение выбранных категорий
            selected_categories_types = [checkbox.text() for checkbox in self.category_type_checkboxes if
                                         checkbox.isChecked()]

            # Фильтрация данных по выбранным типам оплаты
            if selected_payment_types:
                for row in range(self.table.rowCount()):
                    payment_type = self.table.item(row, 2).text()
                    if payment_type not in selected_payment_types:
                        self.table.setRowHidden(row, True)
                    else:
                        self.table.setRowHidden(row, False)
            # else:
            #     for row in range(self.table.rowCount()):
            #         self.table.setRowHidden(row, False)

            # Фильтрация данных по выбранным статусам контракта
            if selected_status_types:
                for row in range(self.table.rowCount()):
                    status_type = self.table.item(row, 4).text()
                    if status_type not in selected_status_types:
                        self.table.setRowHidden(row, True)
                    else:
                        self.table.setRowHidden(row, False)
            # else:
            #     for row in range(self.table.rowCount()):
            #         self.table.setRowHidden(row, False)

            if selected_categories_types:
                for row in range(self.table.rowCount()):
                    category_type = self.table.item(row, 3).text()
                    if category_type not in selected_categories_types:
                        self.table.setRowHidden(row, True)
                    else:
                        self.table.setRowHidden(row, False)
            # else:
            #     for row in range(self.table.rowCount()):
            #         self.table.setRowHidden(row, False)

        except Exception as e:
            print(e)


if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    window = MainW()
    window.show()
    sys.exit(app.exec())
