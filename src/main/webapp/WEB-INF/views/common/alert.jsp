<%--
  Created by IntelliJ IDEA.
  User: ICT02-23
  Date: 2023-03-30
  Time: 오후 4:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Alert</title>
    <style>
        .popup {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 9999;
        }
        .popup-message {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
            text-align: center;
        }
        .popup-buttons {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .popup-buttons button {
            margin: 0 10px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
        }
        .popup-buttons button.yes {
            background-color: #4CAF50;
            color: #fff;
        }
        .popup-buttons button.no {
            background-color: #f44336;
            color: #fff;
        }
    </style>
</head>
<body>
<div class="popup">
    <div class="popup-message">
        <h2>${message}</h2>
        <div class="popup-buttons">
            <a href="${url}" class="yes">${urlName}</a>
            <a href="${url2}" class="no">${urlName2}</a>
        </div>
    </div>
</div>
</body>
</html>
