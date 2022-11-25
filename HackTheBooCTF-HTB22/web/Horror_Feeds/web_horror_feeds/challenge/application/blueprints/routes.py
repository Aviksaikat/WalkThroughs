from flask import Blueprint, render_template, request, session, current_app, redirect
from application.database import login, register
from application.util import response, is_authenticated, token_verify

web = Blueprint('web', __name__)
api = Blueprint('api', __name__)

@web.route('/')
def sign_in():
    return render_template('login.html')

@web.route('/dashboard')
@is_authenticated
def dashboard():
    current_user = token_verify(session.get('auth'))
    return render_template('dashboard.html', flag=current_app.config['FLAG'], user=current_user.get('username'))

@web.route('/logout')
def logout():
    session['auth'] = None
    return redirect('/')

@api.route('/login', methods=['POST'])
def api_login():
    if not request.is_json:
        return response('Invalid JSON!'), 400
    
    data = request.get_json()
    username = data.get('username', '')
    password = data.get('password', '')
    
    if not username or not password:
        return response('All fields are required!'), 401
    
    user = login(username, password)
    
    if user:
        session['auth'] = user
        return response('Success'), 200
        
    return response('Invalid credentials!'), 403

@api.route('/register', methods=['POST'])
def api_register():
    if not request.is_json:
        return response('Invalid JSON!'), 400
    
    data = request.get_json()
    username = data.get('username', '')
    password = data.get('password', '')
        
    if not username or not password:
        return response('All fields are required!'), 400
    
    user = register(username, password)
    
    if user:
        return response('User registered! Please login')
    
    return response('User exists already!'), 409