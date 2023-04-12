<%--
  Created by IntelliJ IDEA.
  User: ICT02-30
  Date: 2023-04-12
  Time: 오전 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script
            src="https://code.jquery.com/jquery-3.6.4.js"
            integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
            crossorigin="anonymous"></script>
    <title>popup-test</title>
</head>
<body>
<div id="popup" style="display: none;">
    <p>여기에 팝업 내용을 작성하세요.</p>
    <button onclick="hidePopupForToday()">오늘 하루 보지 않기</button>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        checkPopupVisibility();
    });

    function checkPopupVisibility() {
        const popup = document.getElementById("popup");

        const hiddenUntil = localStorage.getItem("hidePopupUntil");

        if (hiddenUntil) {
            const now = new Date();
            const hiddenUntilDate = new Date(hiddenUntil);

            if (now < hiddenUntilDate) {
                // 팝업을 숨김
                popup.style.display = "none";
            } else {
                // 팝업을 보여줌
                popup.style.display = "block";
            }
        } else {
            // 처음 방문 시 팝업을 보여줌
            popup.style.display = "block";
        }
    }

    function hidePopupForToday() {
        const now = new Date();
        const tomorrow = new Date(now.getFullYear(), now.getMonth(), now.getDate() + 1);

        localStorage.setItem("hidePopupUntil", tomorrow.toISOString());

        const popup = document.getElementById("popup");
        popup.style.display = "none";
    }
</script>
</body>
</html>
