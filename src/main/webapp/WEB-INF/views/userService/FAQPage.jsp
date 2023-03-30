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
</head>


<body>
<!-- Header Start -->
<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
<!-- Header End -->


<!-- ****** QnA Start ****** -->
<div class="container">

  <div class="page-header">
    <a href="FAQPage.do"><h1>자주하는 질문(FAQ)</h1></a>&nbsp; &nbsp;
    <a href="QNAPage.do"><h1>질문하기(QNA)</h1></a>&nbsp; &nbsp;
    <a href="noticePage.do"><h1>공지사항</h1></a>
  </div>

  <!-- Bootstrap org.oaoc.cookology.FAQ - START -->
  <div class="container">
    <br />
    <br />
    <br />

    <div class="alert alert-warning alert-dismissible" role="alert">
      <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
      자주하는 질문 모아놨어요. 이곳에서 해결하지 못하면<strong>*질문하기를 이용해주세요*</strong>나머진 알아서해 ㅡㅡ
    </div>
    <a href="${pageContext.servletContext.contextPath}/FAQUpdatePage.do"><img src="/cookology/resources/img/userService/KakaoTalk_20230328_214015497.png" width="17%"/></a>
    <br />
<c:forEach items="list" var="L">
    <div class="panel-group" id="accordion">
      <div class="faqHeader">FAQ</div>
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4 class="panel-title">
            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">${ L.questions }</a>
          </h4>
        </div>
        <div id="collapseOne" class="panel-collapse collapse in">
          <div class="panel-body">
              ${ L.frequentlyAsked }
          </div>
        </div>
      </div>
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4 class="panel-title">
            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTen">${ L.questions }</a>
          </h4>
        </div>
        <div id="collapseTen" class="panel-collapse collapse">
          <div class="panel-body">
              ${ L.frequentlyAsked }
          </div>
        </div>
      </div>
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4 class="panel-title">
            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseEleven">${ L.questions }</a>
          </h4>
        </div>
        <div id="collapseEleven" class="panel-collapse collapse">
          <div class="panel-body">
              ${ L.frequentlyAsked }
          </div>
        </div>
      </div>

      <div class="faqHeader"></div>
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4 class="panel-title">
            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">${ L.questions }</a>
          </h4>
        </div>
        <div id="collapseTwo" class="panel-collapse collapse">
          <div class="panel-body">
              ${ L.frequentlyAsked }
          </div>
        </div>
      </div>
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4 class="panel-title">
            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">${ L.questions }</a>
          </h4>
        </div>
        <div id="collapseThree" class="panel-collapse collapse">
          <div class="panel-body">
              ${ L.frequentlyAsked }
          </div>
        </div>
      </div>
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4 class="panel-title">
            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFive">${ L.questions }</a>
          </h4>
        </div>
        <div id="collapseFive" class="panel-collapse collapse">
          <div class="panel-body">
              ${ L.frequentlyAsked }
            <br />
          </div>
        </div>
      </div>
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4 class="panel-title">
            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSix">${ L.questions }</a>
          </h4>
        </div>
        <div id="collapseSix" class="panel-collapse collapse">
          <div class="panel-body">
              ${ L.frequentlyAsked }
          </div>
        </div>
      </div>
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4 class="panel-title">
            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseEight">${ L.questions }</a>
          </h4>
        </div>
        <div id="collapseEight" class="panel-collapse collapse">
          <div class="panel-body">
              ${ L.frequentlyAsked }
          </div>
        </div>
      </div>
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4 class="panel-title">
            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseNine">${ L.questions }</a>
          </h4>
        </div>
        <div id="collapseNine" class="panel-collapse collapse">
          <div class="panel-body">
              ${ L.frequentlyAsked }
          </div>
        </div>
      </div>

      <div class="faqHeader">일반회원 질문</div>
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4 class="panel-title">
            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">${ L.questions }</a>
          </h4>
        </div>
        <div id="collapseFour" class="panel-collapse collapse">
          <div class="panel-body">
              ${ L.frequentlyAsked }
          </div>
        </div>
      </div>
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4 class="panel-title">
            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven">${ L.questions }</a>
          </h4>
        </div>
        <div id="collapseSeven" class="panel-collapse collapse">
          <div class="panel-body">
              ${ L.frequentlyAsked }
          </div>
        </div>
      </div>
    </div>
  </div>
  </c:forEach>
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