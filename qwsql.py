import MySQLdb as mdb

con = mdb.connect(host='savchex8.beget.tech', user='savchex8_agency',
                    password='ADVagency23', database='savchex8_agency')


class QwSql():
    def auth(self, login, password):
        cur = con.cursor()
        query = cur.execute(f'select * from employee where login = "{login}" and password = "{password}"')
        data = cur.fetchall()
        return data