import redis, pickle, time, base64
from healthcheck import request

config = {
    'REDIS_HOST' : '127.0.0.1',
    'REDIS_PORT' : 6379,
    'REDIS_JOBS' : 'jobs',
    'REDIS_QUEUE' : 'jobqueue',
    'REDIS_NUM_JOBS' : 100
}

def env(key):
    val = False
    try:
        val = config[key]
    finally:
        return val

store = redis.StrictRedis(host=env('REDIS_HOST'), port=env('REDIS_PORT'), db=0)

def get_work_item():
    job_id = store.rpop(env('REDIS_QUEUE'))
    if not job_id:
        return False

    data = store.hget(env('REDIS_JOBS'), job_id)

    job = pickle.loads(base64.b64decode(data))
    return job

def incr_field(job, field):
    job[field] = job[field] + 1
    store.hset(env('REDIS_JOBS'), job['job_id'], base64.b64encode(pickle.dumps(job)))

def decr_field(job, field):
    job[field] = job[field] - 1
    store.hset(env('REDIS_JOBS'), job['job_id'], base64.b64encode(pickle.dumps(job)))

def set_field(job, field, val):
    job[field] = val
    store.hset(env('REDIS_JOBS'), job['job_id'], base64.b64encode(pickle.dumps(job)))

def run_worker():
    job = get_work_item()
    if not job:
        return

    incr_field(job, 'inprogress')

    trapURL = job['trap_url']

    response = request(trapURL)

    set_field(job, 'health', 1 if response else 0)

    incr_field(job, 'completed')
    decr_field(job, 'inprogress')

if __name__ == '__main__':
    while True:
        time.sleep(10)
        run_worker()
