# -*- coding: utf-8 -*-

import oracledb
import pandas as pd
import matplotlib.pyplot as plt
from tkinter import Tk, Button, Label

def mostrar_grafica_agrupada():
    dsn_tns = oracledb.makedsn("localhost", 1521, service_name="xe")
    connection = oracledb.connect(user="SYSTEM", password="Oracle21XE!", dsn=dsn_tns)

    sql_query = '''
        SELECT departamento, COUNT(*) AS cantidad_empresarias
        FROM test_empresaria
        GROUP BY departamento
        ORDER BY cantidad_empresarias DESC
    '''
    data = pd.read_sql_query(sql_query, con=connection)
    connection.close()

    plt.figure(figsize=(10, 6))
    data.set_index('DEPARTAMENTO')['CANTIDAD_EMPRESARIAS'].plot(kind='bar', color='skyblue', edgecolor='black')
    plt.title('Distribución de Empresarias por Departamento (Agrupado)', fontsize=16)
    plt.xlabel('Departamento', fontsize=12)
    plt.ylabel('Número de Empresarias', fontsize=12)
    plt.xticks(rotation=45, ha='right')
    plt.grid(axis='y', linestyle='--', alpha=0.7)
    plt.tight_layout()
    plt.show()

def mostrar_productos_poco_stock():
    dsn_tns = oracledb.makedsn("localhost", 1521, service_name="xe")
    connection = oracledb.connect(user="SYSTEM", password="TU_CONTRASEÑA", dsn=dsn_tns)

    sql_query = '''
        SELECT nombre_producto, stock
        FROM test_productos
        WHERE stock < 30
    '''
    data = pd.read_sql_query(sql_query, con=connection)
    connection.close()

    plt.figure(figsize=(10, 6))
    data.set_index('NOMBRE_PRODUCTO')['STOCK'].plot(kind='bar', color='coral', edgecolor='black')
    plt.title('Productos con Poco Stock', fontsize=16)
    plt.xlabel('Producto', fontsize=12)
    plt.ylabel('Cantidad en Stock', fontsize=12)
    plt.xticks(rotation=45, ha='right')
    plt.grid(axis='y', linestyle='--', alpha=0.7)
    plt.tight_layout()
    plt.show()

def mostrar_empresarias_mas_ventas():
    dsn_tns = oracledb.makedsn("localhost", 1521, service_name="xe")
    connection = oracledb.connect(user="SYSTEM", password="TU_CONTRASEÑA", dsn=dsn_tns)

    sql_query = '''
        SELECT E.nombres AS nombre, SUM(P.monto_pago) AS monto
        FROM test_pedido P 
        JOIN test_pedido_producto PP ON P.pedido_id = PP.pedido_id
        JOIN test_empresaria E ON E.empresaria_id = P.empresaria_id
        WHERE P.monto_pago > 500
        GROUP BY E.nombres
        ORDER BY monto DESC
    '''
    data = pd.read_sql_query(sql_query, con=connection)
    connection.close()

    plt.figure(figsize=(10, 6))
    data.set_index('NOMBRE')['MONTO'].plot(kind='bar', color='gold', edgecolor='black')
    plt.title('Empresarias con Más Ventas', fontsize=16)
    plt.xlabel('Empresaria', fontsize=12)
    plt.ylabel('Monto de Ventas', fontsize=12)
    plt.xticks(rotation=45, ha='right')
    plt.grid(axis='y', linestyle='--', alpha=0.7)
    plt.tight_layout()
    plt.show()

# Crear la ventana principal
ventana = Tk()
ventana.title("Inicio")
ventana.geometry("500x500")

# Etiqueta inicial
etiqueta = Label(ventana, text="Bienvenido", font=("Arial", 18))
etiqueta.pack(pady=20)

Button(ventana, text="Gráfico Agrupado Empresarias por Departamento", command=mostrar_grafica_agrupada, font=("Arial", 14), bg="lightblue").pack(pady=10)
Button(ventana, text="Mostrar productos con poco stock", command=mostrar_productos_poco_stock, font=("Arial", 14), bg="lightgreen").pack(pady=10)
Button(ventana, text="Empresarias con más ventas", command=mostrar_empresarias_mas_ventas, font=("Arial", 14), bg="gold").pack(pady=10)

ventana.mainloop()
