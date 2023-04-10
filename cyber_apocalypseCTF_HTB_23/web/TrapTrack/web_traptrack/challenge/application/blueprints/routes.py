import json
from application.database import db, User, TrapTracks
from flask import Blueprint, Response, jsonify, redirect, render_template, request
from flask_login import login_required, login_user, logout_user
from application.cache import get_job_list, create_job_queue, get_job_queue

web = Blueprint('web', __name__)
api = Blueprint('api', __name__)

def response(message, status=200):
    return jsonify({'message': message}), status

@web.route('/', methods=['GET'])
def login():
    return render_template('login.html')

@api.route('/login', methods=['POST'])
def user_login():
    if not request.is_json:
        return response('Missing required parameters!', 401)

    data = request.get_json()
    username = data.get('username', '')
    password = data.get('password', '')

    if not username or not password:
        return response('Missing required parameters!', 401)

    user = User.query.filter_by(username=username).first()

    if not user or not user.password == password:
        return response('Invalid username or password!', 403)

    login_user(user)
    return response('User authenticated successfully!')

@web.route('/admin/')
@login_required
def scrape_list():
    trap_tracks = TrapTracks.query.all()
    return render_template('admin.html', tracks=trap_tracks)

@api.route('/tracks/list', methods=['GET'])
@login_required
def job_list():
    data = get_job_list()

    if not data:
        return Response(json.dumps([]), mimetype='application/json')

    return Response(json.dumps(data), mimetype='application/json')

@api.route('/tracks/add', methods=['POST'])
@login_required
def tracks_add():
    if not request.is_json:
        return response('Missing required parameters!', 401)

    data = request.get_json()

    trapName = data.get('trapName', '')
    trapURL = data.get('trapURL', '')

    if not trapName or not trapURL:
        return response('Missing required parameters!', 401)

    async_job = create_job_queue(trapName, trapURL)

    track = TrapTracks(trap_name=trapName, trap_url=trapURL, track_cron_id=async_job['job_id'])

    db.session.add(track)
    db.session.commit()

    return response('Trap Track added successfully!', 200)

@api.route('/tracks/delete', methods=['POST'])
@login_required
def tracks_del():
    if not request.is_json:
        return response('Missing required parameters!', 401)

    data = request.get_json()

    trackID = data.get('id', '')

    if not trackID:
        return response('Missing required parameters!', 401)

    try:
        TrapTracks.query.filter_by(id=int(trackID)).delete()
        db.session.commit()
    except Exception as e:
        pass

    return response('Trap Track deleted successfully!', 200)


@api.route('/tracks/<int:job_id>/status', methods=['GET'])
@login_required
def job_status(job_id):
    data = get_job_queue(job_id)

    if not data:
        return response('Job does not exist!', 401)

    return Response(json.dumps(data), mimetype='application/json')

@web.route('/logout')
@login_required
def logout():
    logout_user()
    return redirect('/')
