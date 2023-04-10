import pycurl

def request(url):
    response = False
    try:
        c = pycurl.Curl()
        c.setopt(c.URL, url)
        c.setopt(c.TIMEOUT, 5)
        c.setopt(c.VERBOSE, True)
        c.setopt(c.FOLLOWLOCATION, True)

        response = c.perform_rb().decode('utf-8', errors='ignore')
        c.close()
    finally:
        return response
