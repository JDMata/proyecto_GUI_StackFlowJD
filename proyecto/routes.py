from flask import render_template, request, redirect, url_for
from models import db, User, Question, Answer

def init_routes(app):
    @app.route('/')
    def index():
        questions = Question.query.all()
        return render_template('index.html', questions=questions)

    @app.route('/register', methods=['GET', 'POST'])
    def register():
        if request.method == 'POST':
            username = request.form['username']
            email = request.form['email']
            password = request.form['password']
            new_user = User(username=username, email=email, password=password)
            db.session.add(new_user)
            db.session.commit()
            return redirect(url_for('index'))
        return render_template('register.html')

    @app.route('/ask', methods=['GET', 'POST'])
    def ask():
        if request.method == 'POST':
            title = request.form['title']
            content = request.form['content']
            new_question = Question(title=title, content=content, user_id=1)
            db.session.add(new_question)
            db.session.commit()
            return redirect(url_for('index'))
        return render_template('ask.html')

    @app.route('/question/<int:id>')
    def question(id):
        q = Question.query.get(id)
        answers = Answer.query.filter_by(question_id=id).all()
        return render_template('question.html', question=q, answers=answers)
