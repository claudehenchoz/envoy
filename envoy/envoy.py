import os
from bottle import route, run, request, abort, static_file, template
from urllib import urlretrieve
from urlparse import urlparse
from shutil import move
import gnupg
import rstr

passphrase = 'changeme'
file_ext = '.webm'

gpg = gnupg.GPG()


@route('/')
def hello():
    return template("t_hello")


@route('/video', method='POST')
def process():

    entry = request.forms.get('entry')
    clear_entry = gpg.decrypt(entry, passphrase=passphrase)

    if clear_entry:
        parsed_url = urlparse(clear_entry.data)
        print parsed_url
        if parsed_url.scheme:
            filename = rstr.rstr('abcdef0123456789', 8, 12)
            try:
                urlretrieve(clear_entry.data, filename)
            except:
                abort(401, "Something went wrong")

            crypt_filename = filename + file_ext
            stream = open(filename, "rb")

            try:
                gpg.encrypt_file(stream, passphrase=passphrase,
                                 recipients=None, symmetric='AES256',
                                 output=crypt_filename, armor=False)
            except:
                abort(401, "Something went wrong")

            move(crypt_filename, 'video')
            stream.close()
            os.remove(filename)

            return template("t_video", crypt_filename=crypt_filename)

        else:
            abort(401, "Not bad, you're almost there")

    else:
        abort(401, "Nice try")


@route('/video/<filename>', method='GET')
def server_static(filename):
    return static_file(filename, root='video')


run(host='0.0.0.0', port=62266, debug=False, server='paste')
