Proyecto: Dashboard de Visualización con Oracle + Python

Este proyecto permite visualizar gráficas de una base de datos Oracle usando Python, Pandas, Matplotlib y Tkinter. Las gráficas incluyen:

Distribución de empresarias por departamento

Productos con poco stock

Empresarias con mayores montos de ventas

Requisitos previos

Software:

Oracle Database 21c XE (Express Edition) o superior instalado y ejecutándose localmente.

SQL Developer instalado para manejar tus scripts SQL.

Python 3.10+ (con pip y Anaconda recomendado).

Oracle Instant Client (opcional, si decides usar modo "thick" con oracledb).

Paquetes de Python necesarios:

pip install oracledb pandas matplotlib

Archivos incluidos

Prueba.py: Archivo principal que lanza la interfaz gráfica.

test_script.sql (o similar): Script SQL que crea las tablas, inserta datos y estructura todo el esquema.

Paso a paso para ejecutar correctamente el proyecto

1. Ejecutar el archivo SQL en SQL Developer

Abre SQL Developer y conéctate como SYSTEM o tu usuario Oracle. La contraseña es Oracle21XE! 
Luego:

Abre el archivo .sql que contiene todas las CREATE TABLE e INSERT INTO (de preferencia ya corregido).

Ejecuta todo el script para crear las tablas test_asesor, test_empresaria, test_productos, test_pedido, test_pedido_producto.

Asegúrate de que no haya errores de tablas ya existentes. Si es necesario, agrega DROP TABLE ... CASCADE CONSTRAINTS antes de cada CREATE.

2. Modificar las credenciales en Prueba.py

Abre Prueba.py y edita esta línea (o similares):

connection = oracledb.connect(user="TU_USUARIO", password="TU_CONTRASENA", dsn=dsn_tns)

Por ejemplo:

connection = oracledb.connect(user="SYSTEM", password="Oracle21XE!", dsn=dsn_tns)

3. Ejecutar el archivo Python

Desde una terminal con Anaconda o cmd:

python Prueba.py

Aparecerá una ventana con botones para visualizar gráficas.

Posibles errores comunes

ORA-01017: Usuario o contraseña incorrecta. Verifica que puedes ingresar desde SQL Developer con las mismas credenciales.

ORA-00942: Tabla no existe. Verifica que ejecutaste correctamente el script SQL.

oracledb.DatabaseError: Si aparece un error al conectarse, revisa que Oracle esté corriendo y el service_name sea xe o el correspondiente.

Autora principal

Sabrina (documentado en coordinación para el curso de Ingeniería de Datos)

Contribuciones

Puedes clonar el repo y subir tus cambios con Git:

git clone https://github.com/sabrinahr/INGDATOS-GITHUB.git
cd INGDATOS-GITHUB
git checkout -b nueva-rama
# haz cambios y luego:
git add .
git commit -m "feat: cambios en visualizaciones"
git push origin nueva-rama

Licencia

Este proyecto es educativo y para uso libre dentro del marco del curso universitario.

