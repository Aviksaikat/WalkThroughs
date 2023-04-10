from flask import current_app
import pickle, base64

def env(key):
    val = False
    try:
        val = current_app.config[key]
    finally:
        return val

def get_job_list():
    data = current_app.redis.hkeys(env('REDIS_JOBS'))
    data = [job_id.decode() for job_id in data]

    return data

def get_job_id():
    job_id = current_app.redis.get(env('REDIS_NUM_JOBS'))
    current_app.redis.incr(env('REDIS_NUM_JOBS'))
    return job_id

def create_job_queue(trapName, trapURL):
    job_id = get_job_id()

    data = {
        'job_id': int(job_id),
        'trap_name': trapName,
        'trap_url': trapURL,
        'completed': 0,
        'inprogress': 0,
        'health': 0
    }

    current_app.redis.hset(env('REDIS_JOBS'), job_id, base64.b64encode(pickle.dumps(data)))

    current_app.redis.rpush(env('REDIS_QUEUE'), job_id)

    return data

def get_job_queue(job_id):
    data = current_app.redis.hget(env('REDIS_JOBS'), job_id)
    if data:
        return pickle.loads(base64.b64decode(data))

    return None
