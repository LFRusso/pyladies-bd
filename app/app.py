from flask import Flask, render_template, url_for, request, redirect, flash
from datetime import datetime
import psycopg2
import requests

app = Flask(__name__)
app.secret_key = b'_5#y2L"F4Q8z\n\xec]/'
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
def login():    
    logged_in = False
    eventos = []
    user = None

    # Buscando email na base
    try:
        email = request.form["email"]
    except:
        email = None

    with connection.cursor() as cursor:
        cursor.execute(f"SELECT nome, email, idade, cpf FROM Pessoa WHERE email='{email}';")
        data = cursor.fetchall()
    
    if(len(data) != 0): # Email encontrado
        logged_in = True
        user = data[0]
        # Selecionando eventos participadps
        with connection.cursor() as cursor:
            cursor.execute(f'''SELECT E.titulo, E.datahora, E.lugar, E.descricao, E.classificacao, A.certificado
            FROM Evento E JOIN (Pessoa JOIN ParticipacaoEvento ON Pessoa.id = ParticipacaoEvento.Pessoa) A
            ON E.id = A.evento WHERE A.email='{email}';''')
            eventos = cursor.fetchall()

    return render_template("login.html", logged_in=logged_in, data=user, len_eventos=len(eventos), eventos=eventos)


@app.route('/register', methods=["GET", "POST"])
def register():

    try:
        email = request.form["email"]
        nome = request.form["nome"]
        idade = request.form["idade"]
        genero = request.form["genero"]
        etnia = request.form["etnia"]
        cor = request.form["cor"]
        ocupacao = request.form["ocupacao"]
        cpf = request.form["cpf"]
        orientacao = request.form["orientacao"]
    except:
        return render_template("register.html")

    # Inserindo usuário novo no banco
    with connection.cursor() as cursor:
        cursor.execute(f'''INSERT INTO Pessoa (EMAIL,NOME,IDADE,GENERO,ETNIA,COR,OCUPACAO,CPF,ORIENTACAOSEXUAL)
                            VALUES ('{email}','{nome}',{idade},'{genero}','{etnia}','{cor}','{ocupacao}',{cpf},'{orientacao}');''')

    return render_template("login.html", logged_in=False, data=None, len_eventos=0, eventos=None)

if __name__=="__main__":
    app.run(host="0.0.0.0", debug=True, port=3000)