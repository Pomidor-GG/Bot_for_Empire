import sqlite3


class WWDB():
    def __init__(self):  # метод чтения БД и создания курсора
        self.conn = sqlite3.connect('sql.sqlite')
        self.curs = self.conn.cursor()  # курсор

    def enter_db(self, table_name,
              values):  # метод ввода любых значений в любую таблицу.В аргументы ввести имя таблицы с перечислением столбцов и значения в виде кортежа
        count = len(values)
        self.curs.execute(f"INSERT INTO {table_name} VALUES ({(count - 1) * '?,'} ?)", values)
        self.conn.commit()

    def read_db(self, argue,
             table_name):  # метод вывода любых значений из любой таблицы. В аргументы ввести выборку и имя таблицы
        self.curs.execute(f"select {argue} from {table_name}")
        rows = self.curs.fetchall()  # кусок кода

        return rows

    def delete_db(self, table_name,
               where):  # метод удаления значения с условием.В аргументы ввести название таблицы и условие
        self.curs.execute(f"DELETE FROM {table_name} WHERE {where}")
        self.conn.commit()

    def update_db(self, table_name, coloumn_name, values, where):
        self.curs.execute(f"UPDATE {table_name} SET {coloumn_name} = '{values}' WHERE {where}")
        self.conn.commit()


if __name__ == '__main__':
    obj = WWDB()

    # obj.enter('locations(name,max_lvl)', ('bolotas', 50))  # примеры использования каждого метода
    # print(obj.read_db('*', 'locations'))
    # obj.update('locations', 'name', 'замок', 'id=1')
    # obj.read('*', 'locations')
    obj.delete_db('person', 'id=1243456346534')
