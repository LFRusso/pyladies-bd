from flask import Flask, render_template, url_for, request, redirect, flash
from datetime import datetime
import psycopg2
import requests

app = Flask(__name__)
connection = psycopg2.connect(host="localhost", database="admin",user="admin", password="admin", port=5432)

@app.route('/', methods=["GET"])
def index():
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM Evento;")
        results = cursor.fetchall()
    print(results)
    return render_template("eventos.html", len=10)

@app.route('/membros', methods=["GET"])
def pyladies():
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM PyLady;")
        results = cursor.fetchall()
    print(results)
    return render_template("membros.html", len=10)

@app.route('/capitulos', methods=["GET"])
def eventos():
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM Capitulo;")
        results = cursor.fetchall()
    print(results)
    return render_template("capitulos.html", len=10)

@app.route('/login', methods=["GET", "POST"])
def account():
    return render_template("login.html")

@app.route('/register', methods=["GET", "POST"])
def register():
    return render_template("register.html")

if __name__=="__main__":
    app.run(host="0.0.0.0", debug=True, port=3000)