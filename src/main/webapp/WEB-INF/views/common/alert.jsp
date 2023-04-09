<!DOCTYPE html>
<html>
<head>
  <title>Alert</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<script>
  $(document).ready(function(){
    // Display the alert popup
    alert('${message}');

    // Redirect to the specified URL when the user clicks the Yes button
    $('button#yes-btn').click(function(){
      window.location.href = '${url}';
    });

    // Go back to the previous page when the user clicks the No button
    $('button#no-btn').click(function(){
      window.history.back();
    });
  });
</script>
<h1>${message}</h1>
<button id="yes-btn">${urlName}</button>
<button id="no-btn">${urlName2}</button>
</body>
</html>
