<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<!-- Favicon -->
<link rel="icon" href="/cookology/resources/img/core-img/Cookology_logo.png" />
<script src="js/active.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<html lang="ko">
<!-- Bootstrap CSS Brand Color -->
<style>
    #btn-brand {
        background-color: #FC6C3F;
        border-color: #FC6C3F;
        color: #FFFFFF;
    }

    #btn-brand:hover {
        background-color: #E95627;
        border-color: #E95627;
        color: #FFFFFF;
    }
    #btn-brand1 {
        background-color: #FC6C3F;
        border-color: #FC6C3F;
        color: #FFFFFF;
    }

    #btn-brand1:hover {
        background-color: #E95627;
        border-color: #E95627;
        color: #FFFFFF;
    }
    #btn-brand2 {
        background-color: #FC6C3F;
        border-color: #FC6C3F;
        color: #FFFFFF;
    }

    #btn-brand2:hover {
        background-color: #E95627;
        border-color: #E95627;
        color: #FFFFFF;
    }
</style>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 위의 4개의 메타 태그는 헤더에 *반드시* 와야 합니다. 다른 헤더 콘텐츠는 이 태그 *뒤에* 와야 합니다 -->
    <!-- method -->

    <!-- Title -->
    <title>Cookology - 레시피</title>
    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">
    <!-- Core Stylesheet -->
    <link href="/resources/css/style.css" rel="stylesheet">
    <!-- Responsive CSS -->
    <link href="/resources/css/responsive.css" rel="stylesheet">
</head>
</html>
<!-- header.jsp include -->
<c:import url="/WEB-INF/views/common/header.jsp" />
<body>
<!-- 스타일 속성을 적용하여 background-image webapp/resources/img/catagory-img/3.jpg 를 배경으로 한다. -->
<div class="breadcumb-area" style="background-image: url('${pageContext.servletContext.contextPath}/resources/img/catagory-img/3.jpg');">
    <div class="container h-100">
        <div class="row h-100 align-items-center">
            <div class="col-12">
                <div class="bradcumb-title text-center">
                    <h2>Recipe</h2>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="breadcumb-nav">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="main.do"><i class="fa fa-home" aria-hidden="true"></i>Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page"><a href="rpage.do">recipe</a></li>
                        <li class="breadcrumb-item active" aria-current="page"><a href="rlistpage.do">recipe detail</a></li>
                        <li class="breadcrumb-item active" aria-current="page">recipe register</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>
    <!-- footer.jsp include -->
    <c:import url="/WEB-INF/views/common/footer.jsp" />

    <!-- ****** All JS Files ****** -->
    <!-- Jquery-2.2.4 js -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap-4 js -->
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins JS -->
    <script src="js/others/plugins.js"></script>
    <!-- Active JS -->
    <script src="js/active.js"></script>
</body>
