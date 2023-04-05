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

  <link rel="stylesheet" type="text/css" href="/cookology/resources/css/FAQService/bootstrap.css" />
  <link rel="stylesheet" type="text/css" href="/cookology/resources/css/FAQService/font-awesome/css/font-awesome.css" />

  <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
  <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>


<body>
<!-- Header Start -->
<c:import url="/WEB-INF/views/common/header.jsp" />
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
    <a href="${pageContext.servletContext.contextPath}/QuestionPage.do"><img src="/cookology/resources/img/userService/KakaoTalk_20230328_214015497.png" width="17%"/></a>
    <br />

    <div class="panel-group" id="accordion">
      <div class="faqHeader">Q&A</div>
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4 class="panel-title">
            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Is account registration required?</a>
          </h4>
        </div>
        <div id="collapseOne" class="panel-collapse collapse in">
          <div class="panel-body">
            Account registration at <strong>PrepBootstrap</strong> is only required if you will be selling or buying themes.
            This ensures a valid communication channel for all parties involved in any transactions.
          </div>
        </div>
      </div>
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4 class="panel-title">
            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTen">Can I submit my own Bootstrap templates or themes?</a>
          </h4>
        </div>
        <div id="collapseTen" class="panel-collapse collapse">
          <div class="panel-body">
            A lot of the content of the site has been submitted by the community. Whether it is a commercial element/template/theme
            or a free one, you are encouraged to contribute. All credits are published along with the resources.
          </div>
        </div>
      </div>
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4 class="panel-title">
            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseEleven">What is the currency used for all transactions?</a>
          </h4>
        </div>
        <div id="collapseEleven" class="panel-collapse collapse">
          <div class="panel-body">
            All prices for themes, templates and other items, including each seller's or buyer's account balance are in <strong>USD</strong>
          </div>
        </div>
      </div>

      <div class="faqHeader">일반회원 질문</div>
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4 class="panel-title">
            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Who cen sell items?</a>
          </h4>
        </div>
        <div id="collapseTwo" class="panel-collapse collapse">
          <div class="panel-body">
            Any registed user, who presents a work, which is genuine and appealing, can post it on <strong>PrepBootstrap</strong>.
          </div>
        </div>
      </div>
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4 class="panel-title">
            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">I want to sell my items - what are the steps?</a>
          </h4>
        </div>
        <div id="collapseThree" class="panel-collapse collapse">
          <div class="panel-body">
            The steps involved in this process are really simple. All you need to do is:
            <ul>
              <li>Register an account</li>
              <li>Activate your account</li>
              <li>Go to the <strong>Themes</strong> section and upload your theme</li>
              <li>The next step is the approval step, which usually takes about 72 hours.</li>
            </ul>
          </div>
        </div>
      </div>
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4 class="panel-title">
            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFive">How much do I get from each sale?</a>
          </h4>
        </div>
        <div id="collapseFive" class="panel-collapse collapse">
          <div class="panel-body">
            Here, at <strong>PrepBootstrap</strong>, we offer a great, 70% rate for each seller, regardless of any restrictions, such as volume, date of entry, etc.
            <br />
          </div>
        </div>
      </div>
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4 class="panel-title">
            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSix">Why sell my items here?</a>
          </h4>
        </div>
        <div id="collapseSix" class="panel-collapse collapse">
          <div class="panel-body">
            There are a number of reasons why you should join us:
            <ul>
              <li>A great 70% flat rate for your items.</li>
              <li>Fast response/approval times. Many sites take weeks to process a theme or template. And if it gets rejected, there is another iteration. We have aliminated this, and made the process very fast. It only takes up to 72 hours for a template/theme to get reviewed.</li>
              <li>We are not an exclusive marketplace. This means that you can sell your items on <strong>PrepBootstrap</strong>, as well as on any other marketplate, and thus increase your earning potential.</li>
            </ul>
          </div>
        </div>
      </div>
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4 class="panel-title">
            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseEight">What are the payment options?</a>
          </h4>
        </div>
        <div id="collapseEight" class="panel-collapse collapse">
          <div class="panel-body">
            The best way to transfer funds is via Paypal. This secure platform ensures timely payments and a secure environment.
          </div>
        </div>
      </div>
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4 class="panel-title">
            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseNine">When do I get paid?</a>
          </h4>
        </div>
        <div id="collapseNine" class="panel-collapse collapse">
          <div class="panel-body">
            Our standard payment plan provides for monthly payments. At the end of each month, all accumulated funds are transfered to your account.
            The minimum amount of your balance should be at least 70 USD.
          </div>
        </div>
      </div>

      <div class="faqHeader">일반회원 질문</div>
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4 class="panel-title">
            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">I want to buy a theme - what are the steps?</a>
          </h4>
        </div>
        <div id="collapseFour" class="panel-collapse collapse">
          <div class="panel-body">
            Buying a theme on <strong>PrepBootstrap</strong> is really simple. Each theme has a live preview.
            Once you have selected a theme or template, which is to your liking, you can quickly and securely pay via Paypal.
            <br />
            Once the transaction is complete, you gain full access to the purchased product.
          </div>
        </div>
      </div>
      <div class="panel panel-default">
        <div class="panel-heading">
          <h4 class="panel-title">
            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven">Is this the latest version of an item</a>
          </h4>
        </div>
        <div id="collapseSeven" class="panel-collapse collapse">
          <div class="panel-body">
            Each item in <strong>PrepBootstrap</strong> is maintained to its latest version. This ensures its smooth operation.
          </div>
        </div>
      </div>
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