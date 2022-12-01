from flask import Flask, render_template, url_for, request, redirect, flash
from datetime import datetime
import psycopg2
import requests

app = Flask(__name__)
connection = psycopg2.connect(host="localhost", database="admin",user="admin", password="admin", port=5432)

@app.route('/', methods=["GET"])
def index():
    return render_template("index.html")

if __name__=="__main__":
    app.run(host="0.0.0.0", debug=True, port=3000)