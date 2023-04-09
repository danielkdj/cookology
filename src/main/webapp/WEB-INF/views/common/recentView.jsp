<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Recent Viewed Menu</title>
  <link href="/cookology/resources/css/style.css" rel="stylesheet" />
  <link href="/cookology/resources/css/responsive/reponsive.css"
        rel="stylesheet" />
  <style>
    .floating-square {
      position: fixed;
      top: 20%;
      right: 20px;
      width: 200px;
      background-color: #f1f1f1;
      padding: 15px;
      border: 1px solid #888;
      z-index: 9999;
    }
  </style>
</head>
<body>
<div id="recently-viewed-menu" class="floating-square">
  <h4>최근 본 상품</h4>
  <ul>
    <%
      String recentMenus = "";
      if (request.getParameter("menuId") != null) {
        String menuId = request.getParameter("menuId");
        recentMenus = (String)session.getAttribute("recentMenus");
        if (recentMenus == null) {
          recentMenus = "";
        }
        recentMenus = menuId + "," + recentMenus;
        session.setAttribute("recentMenus", recentMenus);
      } else {
        recentMenus = (String)session.getAttribute("recentMenus");
      }
      if (recentMenus != null) {
        String[] menuIds = recentMenus.split(",");
        for (int i = 0; i < menuIds.length; i++) {
          out.println("<li>" + menuIds[i] + "</li>");
        }
      }
    %>
  </ul>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  $(document).ready(function () {
    var floatingSquare = $('#recently-viewed-menu');
    var targetY = parseFloat(floatingSquare.css('top'));
    var currentY = targetY;

    function updatePosition() {
      var scrollTop = $(window).scrollTop();
      var windowHeight = $(window).height();
      var squareHeight = floatingSquare.outerHeight();
      var maxScrollTop = $(document).height() - windowHeight;

      var scrollRatio = scrollTop / maxScrollTop;
      targetY = scrollRatio * (windowHeight - squareHeight - 40) + 20; // Adjust the 40 for padding

      currentY += (targetY - currentY) * 0.1;
      floatingSquare.css('top', currentY + 'px');

      requestAnimationFrame(updatePosition);
    }

    updatePosition();
  });
</script>
</body>
</html>
