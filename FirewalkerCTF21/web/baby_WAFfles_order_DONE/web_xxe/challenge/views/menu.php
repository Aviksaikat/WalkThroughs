<!DOCTYPE html>
<html>
<head>
    <title>xxe</title>
    <link rel='shortcut icon' href='/assets/favicon.ico' />
    <link href='//stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
    <link rel="stylesheet" href="/assets/css/main.css">
    <meta name="author" content="makelaris, makelarisjr">
</head>
<body>
  <div id="alerts"></div>
  <nav class='navbar navbar-expand-md navbar-dark bg-dark navbar-laravel'>
    <ul class='nav navbar-nav'>
      <form class='form-inline' method='POST'>
        <div class='btn-group'>
          <button id='food_select' type='button' class='btn btn-danger dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>
            WAFfles or Ice Cream
          </button>
          <div class='dropdown-menu'>
            <a class='dropdown-item' onclick="food('WAFfles');" href='#'>WAFfles</a>
            <a class='dropdown-item' onclick="food('Ice Scream');" href='#'>Ice Scream</a>
            <div class='dropdown-divider'></div>
            <a class='dropdown-item disabled' onclick="food('Both');" href=''>Both</a>
          </div>
        </div>
        <input type='text' id='food' hidden name='food'>
        <input type='text' id="table" class='form-control ml-1' name='table' placeholder='Table Number' required>
        <input type='submit' class='btn btn-primary ml-1' value='Order'>
      </form>
    </ul>
  </nav>
  <div class='container'>
    <h1>I scream for Ice Cream and WAFfles. We are butter together.</h1>
  </div>
</body>
<script src='//cdnjs.cloudflare.com/ajax/libs/pixi.js/5.3.3/pixi.min.js' integrity='sha512-J7UHpLx39bpqtP+aWP6yIuXroFk0XPkDQaS9zDthM4TVeaXstWYh556gxsXwwIwpAPSoKqVHW+eqz3B93SpyKg==' crossorigin='anonymous'></script>
<script src='//cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js' integrity='sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==' crossorigin='anonymous'></script>
<script src='//stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js' integrity='sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o' crossorigin='anonymous'></script>
<script src='/assets/js/main.js'></script>
</html>