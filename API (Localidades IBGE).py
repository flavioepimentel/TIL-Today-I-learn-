import json, requests
import mysql.connector
from codecs import utf_8_decode, decode
from time import sleep

url = 'https://servicodados.ibge.gov.br/api/v1/localidades/distritos'

resposta = requests.get(url)

if resposta.status_code == 200:
    respostas = resposta.json()

for cidade in respostas:
    print(cidade['nome'], end = ', ')

    for cidadeTupla in cidade.items():
        for cidade in cidadeTupla:
            if (type(cidade) is dict) == True:
                print(cidade['id'], end = ', ')
                
                for microrregiaoTupla in cidade.items():
                    for microrregiao in microrregiaoTupla:
                        if (type(microrregiao) is dict) == True:
                            

                            for mesorregiaoTupla in microrregiao.items():
                                for mesorregiao in mesorregiaoTupla:
                                    if (type(mesorregiao) is dict) == True:
                                        

                                        for UFTupla in mesorregiao.items():
                                            for UF in UFTupla:
                                                
                                                if (type(UF) is dict) == True:
                                                    print(UF['id'], end = ', ')
                                                    print(UF['sigla'], end = ', ')
                                                    print(UF['nome'])
