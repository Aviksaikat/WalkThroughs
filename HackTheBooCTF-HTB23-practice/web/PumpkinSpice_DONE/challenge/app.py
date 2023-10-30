import string
import subprocess
import time
from threading import Thread

from flask import Flask, abort, render_template, request

app = Flask(__name__)

addresses = []

def start_bot():
    from selenium import webdriver
    from selenium.webdriver.chrome.options import Options
    from selenium.webdriver.chrome.service import Service
    from selenium.webdriver.support.ui import WebDriverWait

    host, port = "localhost", 1337
    HOST = f"http://{host}:{port}"

    options = Options()

    options.add_argument("--headless")
    options.add_argument("--no-sandbox")
    options.add_argument("--disable-dev-shm-usage")
    options.add_argument("--disable-infobars")
    options.add_argument("--disable-background-networking")
    options.add_argument("--disable-default-apps")
    options.add_argument("--disable-extensions")
    options.add_argument("--disable-gpu")
    options.add_argument("--disable-sync")
    options.add_argument("--disable-translate")
    options.add_argument("--hide-scrollbars")
    options.add_argument("--metrics-recording-only")
    options.add_argument("--mute-audio")
    options.add_argument("--no-first-run")
    options.add_argument("--dns-prefetch-disable")
    options.add_argument("--safebrowsing-disable-auto-update")
    options.add_argument("--media-cache-size=1")
    options.add_argument("--disk-cache-size=1")
    options.add_argument("--user-agent=HTB/1.0")

    service = Service(executable_path="/usr/bin/chromedriver")
    browser = webdriver.Chrome(service=service, options=options)

    browser.get(f"{HOST}/addresses")
    time.sleep(5)
    browser.quit()


@app.route("/", methods=["GET"])
def index():
    return render_template("index.html")


@app.route("/addresses", methods=["GET"])
def all_addresses():
    remote_address = request.remote_addr
    if remote_address != "127.0.0.1" and remote_address != "::1":
        return render_template("index.html", message="Only localhost allowed")

    return render_template("addresses.html", addresses=addresses)


@app.route("/add/address", methods=["POST"])
def add_address():
    address = request.form.get("address")
    
    if not address:
        return render_template("index.html", message="No address provided")

    addresses.append(address)
    Thread(target=start_bot,).start()
    return render_template("index.html", message="Address registered")


@app.route("/api/stats", methods=["GET"])
def stats():
    remote_address = request.remote_addr
    if remote_address != "127.0.0.1" and remote_address != "::1":
        return render_template("index.html", message="Only localhost allowed")

    command = request.args.get("command")
    if not command:
        return render_template("index.html", message="No command provided")

    results = subprocess.check_output(command, shell=True, universal_newlines=True)
    return results


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=1337, debug=False)
