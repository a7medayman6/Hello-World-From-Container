from flask import Flask, render_template, request, redirect
from subprocess import check_output
import os

app = Flask(__name__)


@app.route('/')
def index():
    hostname = str(check_output(['hostname']).strip()).split('\'')[1]

    return render_template('index.html', hostname=hostname)

if __name__ == "__main__":
    app.run()