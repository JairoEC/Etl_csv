Pasos para ejecutar los scripts:

Los primeros scripts se ejecutarán desde SQL Managemente studio:

	1. Ejecutar el script sql "1_CrearDB.sql" : Este script creará la base de datos y un login el cuál se 		usará para insertar datos

	2. Ejecutar el script sql "2_CrearTable.sql": Este script creará la tabla necesaria además creará el 		user y otorgará los permisos necesarios

	3. Abrir el script de Python "transformar_insertar.py"
		
		3.1 Editar la variable "path" debe de tener la ruta del directorio donde se encuentra el archivo a tranformar
		
		3.2 Editar la variable "documento", debe contener el nombre del archivo csv a transformar

		3.3 Editar la variable "server", debe de contener el nombre del servidor. En este caso se trata de una base de datos local

		3.4 Ejecutar el script de python

	4. Ejecutar el scrip sql "3_CrearSpFn.sql"