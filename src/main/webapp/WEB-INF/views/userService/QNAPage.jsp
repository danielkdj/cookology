<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ICT02-30
  Date: 2023-03-27
  Time: 오후 2:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <title>Cookology FAQ | PrepBootstrap</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

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
<c:import url="/WEB-INF/views/common/header.jsp"/>
<!-- Header End -->


<!-- ****** QnA Start ****** -->
<div class="container">

    <div class="page-header">

        <a href="FAQPage.do"><h1>자주하는 질문(FAQ)</h1></a>&nbsp; &nbsp;
        <c:url var="qna" value="QNAPage.do">
            <c:param name="user_email" value="${ loginUser.user_email }" />
        </c:url>
        <a href="${ qna }"><h1>질문하기(QNA)</h1></a>&nbsp; &nbsp;
        <a href="noticePage.do"><h1>공지사항</h1></a>
    </div>

    <!-- Bootstrap org.oaoc.cookology.FAQ - START -->
    <div class="container">
        <br/>
        <br/>
        <br/>

        <div class="alert alert-warning alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span
                    class="sr-only">Close</span></button>
            자주하는 질문 모아놨어요. 이곳에서 해결하지 못하면<strong>*질문하기를 이용해주세요*</strong>나머진 알아서해 ㅡㅡ
        </div>
        <c:url var="QuestionPage" value="QuestionPage.do">
            <c:param name="user_email" value="${ loginUser.user_email }" />
        </c:url>
        <button class="event-button" onclick="javascript:location.href='${ QuestionPage }';">
            <i class="fas fa-question-circle"></i> 질문하기
        </button>
        <br/>
           <div class="panel-group" id="accordion">
            <div class="faqHeader">Q&A</div>
               <c:set var="list" value="${list}" />

               <!-- Loop through the FAQ list and set an index variable -->
               <c:forEach items="${list}" var="L" varStatus="index">
                   <div class="panel panel-default">
                       <div class="panel-heading">
                           <h4 class="panel-title">
                               <!-- Change the href attribute to use an index to make it unique for each FAQ entry. -->
                               <!-- href 속성을 인덱스를 사용하도록 변경하여 각 FAQ 항목에 대해 고유하게 만듭니다. -->
                               <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse${index.count}">
                                       ${ L.q_title }${ L.q_content }<small>${ L.q_create_at }</small></a>
                           </h4>
                       </div>
                       <!-- Change the id attribute to use an index to make it unique for each FAQ entry. -->
                       <!-- id 속성을 인덱스를 사용하도록 변경하여 각 FAQ 항목에 대해 고유하게 만듭니다. -->
                       <div id="collapse${index.count}" class="panel-collapse collapse">
                           <div class="panel-body">
                                   ${ L.a_content }<small>${ L.a_create_at }</small>
                           </div>
                       </div>
                   </div>

                       <buttom type="submit" value="수정하기" style="width:100px; height:50px;"></buttom>

               </c:forEach>
        </div>
    </div>
      <style>
        .faqHeader {
            font-size: 27px;
            margin: 20px;
        }

        .panel-heading [data-toggle="collapse"]:after {
            font-family: 'Glyphicons Halflings';
            content: "\e072"; /* "play" icon */
            float: right;
            color: #F58723;
            font-size: 18px;
            line-height: 22px;
            /* rotate "play" icon from > (right arrow) to down arrow */
            -webkit-transform: rotate(-90deg);
            -moz-transform: rotate(-90deg);
            -ms-transform: rotate(-90deg);
            -o-transform: rotate(-90deg);
            transform: rotate(-90deg);
        }

        .panel-heading [data-toggle="collapse"].collapsed:after {
            /* rotate "play" icon from > (right arrow) to ^ (up arrow) */
            -webkit-transform: rotate(90deg);
            -moz-transform: rotate(90deg);
            -ms-transform: rotate(90deg);
            -o-transform: rotate(90deg);
            transform: rotate(90deg);
            color: #454444;
        }
    </style>

    <!-- Bootstrap org.oaoc.cookology.FAQ - END -->

</div>


<!-- Footer Start -->
<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
<!-- Footer End -->

</body>
</html>