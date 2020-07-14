import os
from flask import Flask, request, redirect, url_for, session, render_template, escape

from parcial1_pm.db import get_db

def create_app():
    app = Flask(__name__, instance_relative_config=True)
    PROJECT_ROOT = os.path.dirname(os.path.realpath(__file__))
    app.config.from_mapping(
        # a default secret that should be overridden by instance config
        SECRET_KEY="dev",
        # store the database in the instance folder
        DATABASE=os.path.join(PROJECT_ROOT, "flaskr.sqlite"),
    )
    # existing code omitted

    from . import db
    db.init_app(app)

    return app

app = create_app()

@app.route('/', methods=['GET', 'POST'])
def index():
    if 'id_user' in session:
        db = get_db()
        data = [
                {'id':1, 'name':'azul', 'color':'#0000FF'}, 
                {'id':2, 'name':'rojo', 'color':'#FF0000'}, 
                {'id':3, 'name':'verde', 'color':'#00FF00'}, 
                {'id':4, 'name':'amarillo', 'color':'#FFFF00'}
            ]

        print(request.form.get('comp_select'))
        colorbg = r'#FF0000'
        if request.form.get('comp_select') != None:
            for d in data:
                print(d, type(request.form.get('comp_select')), d['id'])
                if request.form.get('comp_select') == str(d['id']):
                    colorbg = d['color']
                    print('color', colorbg)

        user = db.execute('SELECT * FROM user WHERE id = ?', (session['id_user'],)).fetchone()
        return render_template('index.html', colorbg=colorbg, data=data,
            username=escape(user['ci']))
    return redirect(url_for('login'))


@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        db = get_db()
        idx = db.execute('SELECT id FROM user WHERE ci = ? and password = ?',
            (request.form['ci'],request.form['password'])).fetchone()

        if idx:
            session['id_user'] = idx['id']

        return redirect(url_for('index'))
    return '''
        <form method="post">
            <p><input type=text name=ci>
            <p><input type=text name=password>
            <p><input type=submit value=Login>
        </form>
    '''


@app.route("/logout")
def logout():
    """Clear the current session, including the stored user id."""
    session.clear()
    return redirect(url_for("index"))