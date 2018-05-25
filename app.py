from flask import Flask, request, redirect
import sqlite3

app = Flask(__name__)
db = "/data/flask.db"


@app.route("/todo", methods=['GET', 'POST'])
def todo():
    c = sqlite3.connect(db)
    if request.method == 'GET':

        rows = c.execute("SELECT * FROM todo")
        formatted = ''.join([
            '{}<br>'.format(r) for r in rows
        ])

        t = """
        <form action="/todo" method="post">
            <input type="text" name="content">
            <button type="submit">添加</button>
        </form>
        {}
        """.format(formatted)
        return t

    else:

        content = request.form['content']
        print('request form <{}>'.format(content))
        c.execute("INSERT INTO todo (content) VALUES (?)", (content,))
        c.commit()
        c.close()

        return redirect('/todo')


@app.cli.command()
def create_db():
    c = sqlite3.connect(db)
    c.execute("""
        CREATE TABLE IF NOT EXISTS todo (
          id INTEGER PRIMARY KEY, 
          content TEXT NOT NULL
        ) 
    """)
    c.commit()
    c.close()


@app.route("/")
def hello():
    return "Hello World! version jenkins"
