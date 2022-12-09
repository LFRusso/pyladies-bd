from flask import Flask, render_template, url_for, request, redirect, flash
from datetime import datetime
import psycopg2
import requests

app = Flask(__name__)
connection = psycopg2.connect(host="localhost", database="admin",user="admin", password="admin", port=5432)

@app.route('/', methods=["GET"])
def index():
    with connection.cursor() as cursor:
        cursor.execute("SELECT titulo, datahora, lugar, descricao, to_char(duracao,'HH:MI'), classificacao FROM Evento;")
        eventos = cursor.fetchall()

        cursor.execute("SELECT titulo, to_char(datahora,'YYYY-MM-DD HH:MI'), lugar, descricao, to_char(duracao,'HH:MI') FROM ProjetoInterno;")
        projinterno = cursor.fetchall()

        cursor.execute("SELECT titulo, to_char(datahora,'YYYY-MM-DD HH:MI'), lugar, descricao, to_char(duracao,'HH:MI') FROM ProjetoColaborativo;")
        projcolaborativo = cursor.fetchall()
    
    return render_template("eventos.html", len_eventos=len(eventos), eventos=eventos,
                            len_internos=len(projinterno), projinterno=projinterno,
                            len_colaborativos=len(projcolaborativo), projcolaborativo=projcolaborativo)

@app.route('/membros', methods=["GET"])
def pyladies():
    with connection.cursor() as cursor:
        cursor.execute('''SELECT Pessoa.nome, Pessoa.email, Pessoa.idade, Pessoa.ocupacao, Capitulo.nome 
                        FROM PyLady JOIN Pessoa ON PyLady.pessoa = Pessoa.id
                        JOIN Capitulo ON Capitulo.id = PyLady.capitulo;''')
        pyladies = cursor.fetchall()
    print(pyladies)
    return render_template("membros.html", len=len(pyladies), pyladies=pyladies)

@app.route('/capitulos', methods=["GET"])
def eventos():
    with connection.cursor() as cursor:
        cursor.execute('''SELECT C.nome, C.cidade, C.estado, C.pais, C.website 
                        FROM Capitulo C;''')
        capitulos = cursor.fetchall()
        
    return render_template("capitulos.html", len=len(capitulos), capitulos=capitulos)

@app.route('/login', methods=["GET", "POST"])
def account():
    return render_template("login.html")

@app.route('/register', methods=["GET", "POST"])
def register():
    return render_template("register.html")

if __name__=="__main__":
    app.run(host="0.0.0.0", debug=True, port=3000)