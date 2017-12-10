<!DOCTYPE html>
<html>

<head>
    <title>{{crypt_filename}}</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.5/paper/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        .vertical-center {
            align-items: center;
        }
    </style>
</head>

<body>
    <div class="vertical-center">
        <p></p>
        <div class="container">
            <a class="btn btn-primary btn-lg active" role="button" download="{{crypt_filename}}" href="video/{{crypt_filename}}">
                <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span> {{crypt_filename}}
            </a>

            <p>
                <pre><code>gpg --output "{{real_filename}}" --passphrase "passphrase" --batch --decrypt "{{crypt_filename}}"</code></pre>
            </p>
        </div>

    </div>
</body>

</html>
