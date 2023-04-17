<%--
  Created by IntelliJ IDEA.
  User: ICT02-30
  Date: 2023-03-27
  Time: 오후 2:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8" />
  <title>Cookology FAQ  | PrepBootstrap</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <%--  <link rel="stylesheet" type="text/css" href="/cookology/resources/css/FAQService/bootstrap.min.css" />--%>
  <%--  <link rel="stylesheet" type="text/css" href="/cookology/resources/css/FAQService/font-awesome/css/font-awesome.min.css" />--%>


  <%--  <script type="text/javascript" src="js/jquery-2.2.4.min.js"></script>--%>
  <%--  <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>--%>
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
  <script>
    $(document).ready(function() {
      $('#btn-brand1').click(function() {
        $('#allergyAccordion').collapse('toggle');
      });
    });
  </script>
</head>


<body>
<!-- Header Start -->
<c:import url="/WEB-INF/views/common/header.jsp" />
<!-- Header End -->

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
<!-- ****** QnA Start ****** -->
<div class="container">

  <div class="page-header">
    <a href="FAQPage.do"><h1>자주하는 질문(FAQ)</h1></a>&nbsp; &nbsp;
    <c:url var="qna" value="QNAPage.do">
      <c:param name="user_email" value="${ loginUser.user_email }" />
    </c:url>
    <%--    <c:url var="qna" value="QNAPage.do">--%>
    <%--      <c:param name="user_email" value="${ loginUser.user_email }" />--%>
    <%--    </c:url>--%>
    <a href="${ qna }"><h1>질문하기(QNA)</h1></a>&nbsp; &nbsp;
    <a href="nlist.do?page=1"><h1>공지사항</h1></a>
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

    <br />

    <div class="panel-group" id="accordion">
      <div class="faqHeader">FAQ</div>
      <!-- "list" 변수 설정 -->


      <!-- Loop through the FAQ list and set an index variable -->
      <c:if test="${ loginUser.is_admin ne 'Y'}">
        <c:set var="list" value="${list}" />
        <c:forEach items="${list}" var="L" varStatus="index">

          <div class="panel panel-default"  data-wow-delay=".(${ index }*2)s">
            <div class="panel-heading">
              <h4 class="panel-title">
                <!-- Change the href attribute to use an index to make it unique for each FAQ entry. -->
                <!-- href 속성을 인덱스를 사용하도록 변경하여 각 FAQ 항목에 대해 고유하게 만듭니다. -->
                <a  id="toggle-link" class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse${index.count}">${ L.questions }</a>
              </h4>
            </div>
            <!-- Change the id attribute to use an index to make it unique for each FAQ entry. -->
            <!-- id 속성을 인덱스를 사용하도록 변경하여 각 FAQ 항목에 대해 고유하게 만듭니다. -->
            <div id="collapse${index.count}" class="panel-collapse collapse">
              <div class="panel-body">
                  ${ L.frequentlyAsked }
              </div>
            </div>

          </div>
          <%-- <c:url var="adminok" value="admincheck.do">
             <c:param name="adminok" value="${ index }" />
           </c:url>--%>

        </c:forEach>

      </c:if>


      <c:if test="${ loginUser.is_admin  eq 'Y'}">
        <c:set var="list" value="${list}" />
        <c:forEach items="${list}" var="L" varStatus="index">

          <div class="panel panel-default"  data-wow-delay=".(${ index }*2)s">
            <div class="panel-heading">
              <h4 class="panel-title">
                <!-- Change the href attribute to use an index to make it unique for each FAQ entry. -->
                <!-- href 속성을 인덱스를 사용하도록 변경하여 각 FAQ 항목에 대해 고유하게 만듭니다. -->
                <a  <%--id="toggle-link"--%> class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse${index.count}">${ L.questions }</a>
              </h4>
            </div>
            <!-- Change the id attribute to use an index to make it unique for each FAQ entry. -->
            <!-- id 속성을 인덱스를 사용하도록 변경하여 각 FAQ 항목에 대해 고유하게 만듭니다. -->
            <div id="collapse${index.count}" class="panel-collapse collapse">
              <div class="panel-body">

                  ${ L.frequentlyAsked }
                <c:url var="update" value="moveFAQUpdate.do">
                  <c:param name="faq_seq_id" value="${ L.faq_seq_id }" />
                </c:url>
                <button style="float: right" class="event-button" onclick="javascript:location.href='${ update }';">
                  <i class="fas fa-question-circle"></i>FAQ수정하기
                </button>
              </div>
            </div>

          </div>
          <%-- <c:url var="adminok" value="admincheck.do">
             <c:param name="adminok" value="${ index }" />
           </c:url>--%>

        </c:forEach>

      </c:if>
    </div>
  </div>



  <!-- Bootstrap org.oaoc.cookology.FAQ - END -->

</div>


<!-- Footer Start -->

<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>

<!-- Footer End -->

</body>
</html>