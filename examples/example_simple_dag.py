from datetime import datetime
from airflow import DAG
from airflow.operators.dummy import DummyOperator
from airflow.operators.python import PythonOperator


def print_hello():
    return 'Hello world from a simple Airflow DAG!'


dag = DAG(
    'hello_world',
    description='Hello World DAG',
    schedule_interval='0 12 * * *',
    start_date=datetime(2022, 1, 1),
    catchup=False
)

hello_operator = PythonOperator(
    task_id='hello_task',
    python_callable=print_hello,
    dag=dag
)

hello_operator