import MySQLdb as mdb


class QwSql():
    def __init__(self):
        # self.con = mdb.connect(host='savchex8.beget.tech', user='savchex8_agency',
        #                   password='ADVagency23', database='savchex8_agency')

        self.con = mdb.connect(host='localhost', user='root',
                               password='', database='savchex8_agency')

    def auth(self, login, password):
        cur = self.con.cursor()
        cur.execute(f'select * from employee where login = "{login}" and password = "{password}" and is_manager = 1')
        data = cur.fetchall()
        return data

    def get_contract_data(self):
        try:
            cur = self.con.cursor()
            cur.execute(
                f'select Contract.id, Contract.object_of_contract, payment.title, service_category.name, contract_status.status from Contract '
                f'inner join payment on Contract.payment_type_id = payment.id '
                f'inner join service_category on Contract.category_id = service_category.id '
                f'inner join contract_status on Contract.status_id = contract_status.id '
                f'order by Contract.id')
            data = cur.fetchall()
            return data
        except Exception as e:
            return e

    def get_categories(self):
        cur = self.con.cursor()
        cur.execute(f'select name from service_category')
        data = cur.fetchall()
        return data

    def get_payments(self):
        cur = self.con.cursor()
        cur.execute(f'select title from payment')
        data = cur.fetchall()
        return data

    def get_status(self):
        cur = self.con.cursor()
        cur.execute(f'select status from contract_status')
        data = cur.fetchall()
        return data
