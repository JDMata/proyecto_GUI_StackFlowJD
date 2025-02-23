import psycopg2
import psycopg2.extras
from flask import Flask, render_template, request, redirect, url_for, session, flash

app = Flask(__name__)
app.secret_key = 'clave_secreta'  # Necesaria para manejar sesiones

# Conectar a PostgreSQL
def get_db_connection():
    return psycopg2.connect(
        dbname="studentoverflow",
        user="postgres",
        password="ADMOn-2024",
        host="localhost",
        port="5432"
    )

@app.route('/')
def index():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute("SELECT id, title FROM questions ORDER BY id DESC")
    questions = cur.fetchall()
    cur.close()
    conn.close()
    return render_template('index.html', questions=questions)




@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']

        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute("SELECT id, username FROM users WHERE email = %s AND password = %s", (email, password))
        user = cur.fetchone()
        cur.close()
        conn.close()

        if user:
            session['user_id'] = user[0]
            session['username'] = user[1]
            return redirect(url_for('user_questions'))
        else:
            flash("Credenciales incorrectas. Intenta de nuevo.", "danger")

    return render_template('login.html')

@app.route('/user/questions')
def user_questions():
    if 'user_id' not in session:
        return redirect(url_for('login'))

    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute("SELECT title FROM questions WHERE user_id = %s ORDER BY id DESC", (session['user_id'],))
    questions = cur.fetchall()
    cur.close()
    conn.close()

    return render_template('user_questions.html', username=session['username'], questions=questions)

@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('index'))


@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        password = request.form['password']

        conn = get_db_connection()
        cur = conn.cursor()

        # Verificar si el usuario ya existe
        cur.execute("SELECT * FROM users WHERE email = %s", (email,))
        existing_user = cur.fetchone()

        if existing_user:
            flash("El email ya está registrado. Intenta con otro.", "danger")
        else:
            # Insertar nuevo usuario en la base de datos
            cur.execute("INSERT INTO users (username, email, password) VALUES (%s, %s, %s)",
                        (username, email, password))  # ⚠️ Deberías usar hashing para la contraseña
            conn.commit()
            flash("Registro exitoso. Ahora puedes iniciar sesión.", "success")
            return redirect(url_for('login'))

        cur.close()
        conn.close()

    return render_template('register.html')

@app.route('/question/<int:id>')
def question(id):
    conn = get_db_connection()

    cur = conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor)

    
    cur.execute("SELECT id, title, content FROM questions WHERE id = %s", (id,))
    question = cur.fetchone()

    cur.execute("""
        SELECT answers.content, users.username 
        FROM answers
        JOIN users ON answers.user_id = users.id
        WHERE answers.question_id = %s
    """, (id,))
    answers = cur.fetchall()
    
    cur.close()
    conn.close()

    if question:
        return render_template('question.html', question=question, answers=answers)
    else:
        return "Pregunta no encontrada", 404

@app.route('/answer/<int:question_id>', methods=['POST'])
def answer(question_id):
    if 'user_id' not in session:
        return redirect(url_for('login'))

    content = request.form['content']
    user_id = session['user_id']

    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute("INSERT INTO answers (question_id, user_id, content) VALUES (%s, %s, %s)",
                (question_id, user_id, content))
    conn.commit()
    cur.close()
    conn.close()

    return redirect(url_for('question', id=question_id))


@app.route('/ask', methods=['GET', 'POST'])
def ask():
    if request.method == 'POST':
        title = request.form['title']
        content = request.form['content']
        user_id = session.get('user_id')  # Asegúrate de que el usuario ha iniciado sesión

        if not user_id:
            flash("Debes iniciar sesión para hacer una pregunta.", "danger")
            return redirect(url_for('login'))

        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute("INSERT INTO questions (user_id, title, content) VALUES (%s, %s, %s)", 
                    (user_id, title, content))
        conn.commit()
        cur.close()
        conn.close()

        flash("Pregunta publicada exitosamente.", "success")
        return redirect(url_for('index'))

    return render_template('ask.html')



if __name__ == '__main__':
    app.run(debug=True)

