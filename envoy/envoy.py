from flask import Flask
from flask import render_template
from flask import request
from flask import send_from_directory

import os
from urllib import urlretrieve
from urlparse import urlparse
from shutil import move
import gnupg
import rstr



passphrase = 'changeme'
file_ext = '.webm'

gpg = gnupg.GPG()


app = Flask(__name__)


@app.route("/")
def hello():
    return render_template('get.html')

@app.route("/<path:url>")
def url(url):
    return render_template('get.html')

@app.route('/g', methods=['POST'])
def g():
    if request.method == 'POST':

        desturl = request.form["desturl"]

        parsed_url = urlparse(desturl)

        real_filename = parsed_url.path.split('/')[-1].strip()

        if parsed_url.scheme:
            filename = rstr.rstr('abcdef0123456789', 8, 12)
            try:
                urlretrieve(desturl, filename)
            except:
                #abort(401, "Something went wrong")
                pass

            crypt_filename = filename + file_ext
            stream = open(filename, "rb")

            try:
                gpg.encrypt_file(stream, passphrase=passphrase,
                                 recipients=None, symmetric='AES256',
                                 output=crypt_filename, armor=False)
            except:
                #abort(401, "Something went wrong")
                pass

            move(crypt_filename, 'download')
            stream.close()
            os.remove(filename)

            return render_template("download.html", crypt_filename=crypt_filename,
                            real_filename=real_filename)

        return "This is not a URL: " + desturl
    else:
        return "error"

@app.route("/d/<path:path>")
def download(path):
    return send_from_directory('download', path)
