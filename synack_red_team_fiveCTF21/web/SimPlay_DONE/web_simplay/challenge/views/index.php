<html>
<head>
  <meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no'>
  <title>SimPlay</title>
  <link rel='stylesheet' href='//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css' integrity='sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm' crossorigin='anonymous'>
  <link rel='stylesheet' href='/static/css/main.css' />
  <link rel='preconnect' href='//fonts.gstatic.com'>
  <link link='preload' href='//fonts.googleapis.com/css2?family=Press+Start+2P&display=swap' rel='stylesheet'>
  <link rel='icon' href='/assets/favicon.png' />
</head>
<body>
<div id='main' class='container'>
  <h1 id='title'>
    <b>SimPlay</b>
  </h1>
  <br>
  <div id='img-div'>
    <img id='image' src='/assets/cyberpunk.gif' alt='staring in the abyss'>
    <br>
  </div>
  <h2>You'll find love:</h2> 
  <br>
  <span id='time'> <?= $time ?></span>
  <div class='form-group'>
    <a href='?format=r' class='btn-lg btn-danger btn-block text-center'>Try again!</a>
  </div>
</div>
</body>
<script src='//cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js' integrity='sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ==' crossorigin='anonymous'></script> 
<script src='/static/js/main.js'></script>
</html>