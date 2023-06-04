import pandas as pd
from sqlalchemy import create_engine
from sqlalchemy.engine.base import Engine
import os


def get_sql_query(engine: Engine, sql_query: str) -> pd.core.frame.DataFrame or None:
    
    try:

        for word in sql_query.lower().split():

            if word in ["delete", "update", "create", "insert"]:
                raise Exception("Can't change current database.") 

            else:
                pass

        reponse: pd.core.frame.DataFrame = pd.read_sql_query(sql_query, con=engine)

        return reponse
    except Exception as ex:
        print(repr(ex))
        return None


if __name__ == '__main__':

    USERNAME = "agentric"  # замените на свой логин

    connection_string = f"postgresql+psycopg2://{USERNAME}:@localhost:5432/{USERNAME}"
    engine = create_engine(connection_string)

    sql_queries: list = []

    for file in [_ for _ in os.listdir() if _.endswith(".sql")]:
        with open(file, 'r') as sql_query_file:
            sql_queries.append(sql_query_file.read())
    
    # print(f"\n---------------------\nFile {file}\n")

    try:
        numero_sql = input(f"Input task number or 'all'(result of all sql_queries in current directory): ")
        
        if numero_sql == "all":
            for query in sql_queries:
                print(f"\n---------Task #{sql_queries.index(query) + 1}---------\n")
                print(query, '\n')
                print(get_sql_query(engine, query))
            
            print('\n')
            
        elif int(numero_sql):
            print('\n', sql_queries[int(numero_sql) - 1], '\n', sep='')
            print(get_sql_query(engine, sql_queries[int(numero_sql) - 1]))

            print('\n')
        
        else:
            raise ValueError('Некорректный формат numero_sql')

    except IndexError:
        print("Заданный номер превышает количество sql файлов в директории...")

    except ValueError:
        print("Данные введены некорректно...")




