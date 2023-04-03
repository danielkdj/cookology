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

    <link rel="stylesheet" type="text/css" href="/cookology/resources/css/style.css" />
    <link rel="stylesheet" type="text/css" href="/cookology/resources/css/FAQService/font-awesome/css/font-awesome.min.css" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" crossorigin="anonymous"/>
    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

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
                    <h2>FAQ 수정하기</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <form action="#" method="post">
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <label for="name">번호 *</label>
                                <input type="text" class="form-control" id="name" value="${ faq.faq_seq_id }" readonly>
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
                        <div class="col-12">
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