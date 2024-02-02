import PyQt6
import sys

import qwsql
from qwsql import *
import RegForm
from RegForm import *


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
        print(data)


if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    window = MainW()
    window.show()
    sys.exit(app.exec())