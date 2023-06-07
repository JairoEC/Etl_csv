# -*- coding: utf-8 -*-
"""
Created on Tue Jun  6 10:04:15 2023

@author: JAIRO
"""
import os
import pandas as pd
from sqlalchemy import create_engine
from datetime import datetime

path="D:\VSCODE\PYTHON\entrevista"
documento="Resultados.csv"

#TRANSFORMACION DEL CSV A UN DATAFRAME
def transformar_csv(path,documento):
    with open (os.path.join(path,documento),"r")  as doc:
        archivo=doc.readlines()
    
    data={}
    for arc in archivo:
        arc=arc.strip()
        if len(arc)>1:
            if arc.endswith(";"):
                key_col=arc[:-1]
                data[key_col]={}
            else:
                key,value=arc.split(";")
                key=key[:10]
                data[key_col][key]=value
                
    df=pd.DataFrame(data)
    df=df.drop("Fecha").reset_index()
    df.columns=["fecha","alcance_fb","alcance_ig"]
    return df

df=transformar_csv(path,documento)

#df.to_csv(os.path.join(path,"Resultados_etl.csv"),index=False)

#ELEMENTOS NECESARIOS PARA REALIZAR LA CONEXION A LA BASE DE DATOS
server = 'DESKTOP-K19HQ9O'
database = 'ESPINOZA'
username='jairo'
password='ESPINOZA2939'
driver='ODBC Driver 17 for SQL Server'
conn_str = f'mssql+pyodbc://{username}:{password}@{server}/{database}?driver={driver}'
engine=create_engine(conn_str)

## INSERTAR LOS DATOS A LA TABLA RESULTADOS
df[["nombre","fecha_carga"]]=documento,datetime.now()
df.to_sql("Resultados",con=engine,schema='Base',if_exists='append',index=False)

