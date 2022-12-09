# Trabalho 3 - SCC0640

- Luiz Fernando Silva Eugênio dos Santos 10892680
- Samuel Rubens Souza Oliveira 11912533

Aplicação desenvolvida na disciplina SCC0640 - Bases de Dados. Banco de dados para o PyLadies Brasil.

## Executando

1. Para subir do banco de dados, entre na pasta `bd` e execute o comando

```
docker-compose up
```

2. Com a máquina docker em execução, em outro terminal se conecte ao banco executando o script

```
bash connect.sh
```

3. Em seguida, conectado ao banco crie as tableas usando os comandos descritos no arquivo `init.sql`.

4. Ainda conectado ao banco, popule as tabelas executando a transação descrita no arquivo `inserts.sql`.

5. Com as tabelas criadas e populadas, desconecte-se do banco e instale as bibliotecas que serão usadas para executar a aplicação. Na pasta raís, execute:

```
pip install -r requirements.txt
```

6. Por fim, entre na pasta `app` e execute 

```
python app.py
```

Você poderá ver a aplicação em execução em `localhost:3000`.