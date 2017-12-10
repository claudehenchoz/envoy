<!DOCTYPE html>
<html>

<head>
    <title></title>
    <link href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.5/paper/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        .vertical-center {
            min-height: 100%;
            /* Fallback for browsers do NOT support vh unit */
            min-height: 100vh;
            /* These two lines are counted as one :-)       */
            display: flex;
            align-items: center;
        }
    </style>
</head>

<body>
    <div class="vertical-center">
        <div class="container">
            <form action="video" method="POST">
                <div class="form-group">
                    <textarea name="entry" class="form-control" rows="12" placeholder="Enter something"></textarea>
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
            <p>
                <pre><code>echo https://i.imgur.com/Hs1hhnl.mp4 | gpg --symmetric --armor --passphrase "passphrase" --batch</code></pre>
            </p>
        </div>
    </div>
</body>

</html>