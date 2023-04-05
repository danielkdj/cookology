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

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/cookology/resources/css/FAQService/font-awesome/css/font-awesome.min.css" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" crossorigin="anonymous"/>
    <style>
        .event-button {
            background-color: rgba(255, 131, 87, 1);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .event-button:hover {
            background-color : rgba(255, 131, 255, 1);
        }
        .event-button i {
            margin-right: 5px;
        }

    </style>
</head>

<body>
<!-- Header Start -->
<c:import url="/WEB-INF/views/common/header.jsp" />
<!-- Header End -->


<div class="inquiry-section section_padding_100">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section-heading text-center">
                    <h2>질문하기</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <form action="#" method="post">
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <label for="name">질문자 *</label>
                                <input type="text" class="form-control" id="name" value="${ loginUser.user_email }" readonly>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group">
                                <label for="subject">질문 *</label>
                                <input type="text" class="form-control" id="subject" required>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-group">
                                <label for="message">답변 *</label>
                                <textarea class="form-control" id="message" rows="5" required></textarea>
                            </div>
                        </div>
                        <div>
                            <button class="event-button" onclick="javascript:location.href='FAQUpdateset.do';">
                                <i class="fas fa-question-circle"></i>수정하기
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- Footer Start -->
<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
<!-- Footer End -->
</body>

</html>