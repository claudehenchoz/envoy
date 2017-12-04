<!DOCTYPE html>
<html>
<head>
    <title>{{crypt_filename}}</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.5/paper/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        .vertical-center {
            min-height: 100%;  /* Fallback for browsers do NOT support vh unit */
            min-height: 100vh; /* These two lines are counted as one :-)       */
            display: flex;
            align-items: center;
        }
    </style>
</head>
<body>
    <div class="vertical-center">
        <div class="container">
            <a class="btn btn-primary btn-lg active" role="button" download="{{crypt_filename}}" href="video/{{crypt_filename}}">
                <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span> {{crypt_filename}}
            </a>
        </div>
    </div>
</body>
</html>
