<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ICT02-30
  Date: 2023-03-27
  Time: 오후 2:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <title>Cookology FAQ  | PrepBootstrap</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" type="text/css" href="/cookology/resources/css/FAQService/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/cookology/resources/css/FAQService/font-awesome/css/font-awesome.min.css" />


    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .inquiry-container {
            width: 400px;
            background-color: #f8f8f8;
            border: 1px solid #ccc;
            padding: 20px;
            margin: 0 auto;
        }
        h2 {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input, textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            margin-top: 20px;
            border: 1px solid #ccc;
        }
        .button-wrapper {
            text-align: center;
        }
        button {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 10px 20px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 10px 2px;
            transition-duration: 0.4s;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<!-- Header Start -->
<c:import url="/WEB-INF/views/common/header.jsp" />
<!-- Header End -->
<div class="inquiry-container">
    <h2>1:1 문의</h2>
    <form id="inquiry-form">
        <label for="name">이름:</label>
        <input type="text" id="name" name="name" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="subject">제목:</label>
        <input type="text" id="subject" name="subject" required>

        <label for="message">내용:</label>
        <textarea id="message" name="message" rows="5" required></textarea>

        <button class="button-wrapper" type="submit">보내기</button>
    </form>
</div>
<script>
    document.getElementById('inquiry-form').addEventListener('submit', function(event) {
        event.preventDefault();
        alert('Your inquiry has been submitted!');
        // You can replace the alert() function with an API call to submit the form data
    });
</script>
</body>
</html>


<!-- Footer Start -->
<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
<!-- Footer End -->

</body>
</html>