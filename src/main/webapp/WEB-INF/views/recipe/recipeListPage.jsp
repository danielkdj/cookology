<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- Favicon -->
<link rel="icon" href="/cookology/resources/img/core-img/Cookology_logo.png" />

<script src="js/active.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper-cjs"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<html lang="ko">
<!-- Bootstrap CSS Brand Color -->
<style>
    .blog_area .container .justify-content-left {
        display: flex;
        justify-content: flex-start;
    }
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

    #btn-brand3{
        background-color: #FC6C3F;
        border-color: #FC6C3F;
        color: #FFFFFF;
    }

    #btn-brand3:hover {
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
    <link href="/resources/css/responsive/responsive.css" rel="stylesheet">
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
<!-- ****** Pageinfo End ****** -->

<!-- ****** PagePath Start ****** -->
<div class="breadcumb-nav">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav aria-label="breadcrumb">
                    <ol style="margin-bottom: 75px" class="breadcrumb">
                        <li class="breadcrumb-item"><a href="main.do"><i class="fa fa-home" aria-hidden="true"></i>Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page"><a href="rpage.do">recipe</a></li>
                        <li class="breadcrumb-item active" aria-current="page">recipe list</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>
<!-- ****** PagePath End ****** -->

<!-- ****** SearchBar Start ****** -->
    <div class="container">
    <h4>Search</h4>
        <c:choose>
        <c:when test="${not empty sessionScope.user_email}">
        <form action="optionsearch.do" method="post">
            </c:when>
            <c:otherwise>
            <form action="rsearchlist.do" method="post">
                </c:otherwise>
                </c:choose>
            <div class="input-group mb-3">
                <input type="text" class="form-control" placeholder="Search recipe..." id="searchBar" name="keyword">
                <div class="input-group-append">
                    <!-- search btn -->
                    <button id="btn-brand" class="btn btn-outline-secondary" type="submit">Search</button>
                    <!-- allergy checkbox btn -->
                    <button id="btn-brand1" class="btn btn-outline-secondary" type="button" data-toggle="collapse"
                            data-target="#allergyAccordion">Allergy
                    </button>
                </div>
            </div>
        </form>
    </div>
<!-- ****** SearchBar End ****** -->

    <!-- ****** Allergy Checkboxes Start ****** -->
    <div class="container">
        <div id="allergyAccordion" class="collapse">
            <h6 style="margin-bottom:15px">Remove allergies</h6>
            <form>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="10">
                            <label class="form-check-label" for="10">알류</label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="20">
                            <label class="form-check-label" for="20">유제품</label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="30">
                            <label class="form-check-label" for="30">땅콩</label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="40">
                            <label class="form-check-label" for="40">견과류</label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="50">
                            <label class="form-check-label" for="50">밀</label>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="60">
                            <label class="form-check-label" for="60">참깨</label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="70">
                            <label class="form-check-label" for="70">콩(대두)</label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="80">
                            <label class="form-check-label" for="80">과일 및 채소</label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="90">
                            <label class="form-check-label" for="90">해산물 및 조개류</label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="100">
                            <label class="form-check-label" for="100">육류</label>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- ****** Allergy Checkboxes End ****** -->
    <!-- ****** SearchBar End ****** -->

    <!-- ****** Blog Area Start ****** -->
    <section class="blog_area section_padding_0_80">
        <div class="container">
            <div class="row justify-content-left">
                <div class="col-12 col-lg-8">
                    <div class="row">
                        <!-- Single Post -->
                        <div class="col-12">
                            <div class="single-post wow fadeInUp" data-wow-delay=".2s">
                                <!-- Post Thumb -->

                                <div class="post-thumb">
                                    <img src="/cookology/resources/img/blog-img/1.jpg" alt=""/>
                                    <a href="rregpage.do" id="btn-brand3" class="btn btn-outline-secondary">Move
                                        Edit</a>
                                </div>
                                <%--<h3>${created_at}</h3>--%>
                            </div>
                        </div>

                        <!-- Post Content -->
                        <div class="post-content">
                            <div class="post-meta d-flex">
                                <!-- Post Comment & Share Area -->
                                <div class="post-comment-share-area d-flex">
                                    <!-- Post Favourite -->
                                    <div class="post-favourite">
                                        <a href="#"><i class="fa fa-heart-o" aria-hidden="true"></i>10</a>
                                    </div>
                                    <!-- Post Comments -->
                                    <div class="post-comments">
                                        <a href="#"><i class="fa fa-comment-o" aria-hidden="true"></i>12</a>
                                    </div>
                                    <!-- Post Share -->
                                    <div class="post-share">
                                        <a href="#"><i class="fa fa-share-alt" aria-hidden="true"></i></a>
                                    </div>
                                </div>
                            </div>
                            <a href="#">
                                <h2 class="post-headline">Boil The Kettle And Make A Cup
                                    Of Tea Folks, This Is Going To Be A Big One!</h2>
                            </a>
                            <p>Tiusmod tempor incididunt ut labore et dolore magna
                                aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                                ullamco laboris nisi ut aliquip ex ea commodoconsequat.</p>
                            <a href="#" class="read-more">Continue Reading..</a>
                        </div>
                    </div>
                </div>
    <!-- ****** Blog Area End ****** -->


                <!-- Single Post -->
                <div class="col-12 col-md-6">
                    <div class="single-post wow fadeInUp" data-wow-delay=".4s">
                        <!-- Post Thumb -->
                        <div class="post-thumb">
                            <img src="/cookology/resources/img/blog-img/2.jpg" alt=""/>
                        </div>
                        <!-- Post Content -->
                        <div class="post-content">
                            <div class="post-meta d-flex">
                                <div class="post-author-date-area d-flex">
                                    <!-- Post Author -->
                                    <div class="post-author">
                                        <a href="#">By Marian</a>
                                    </div>
                                    <!-- Post Date -->
                                    <div class="post-date">
                                        <a href="#">May 19, 2017</a>
                                    </div>
                                </div>
                                <!-- Post Comment & Share Area -->
                                <div class="post-comment-share-area d-flex">
                                    <!-- Post Favourite -->
                                    <div class="post-favourite">
                                        <a href="#"><i class="fa fa-heart-o" aria-hidden="true"></i> 10</a>
                                    </div>
                                    <!-- Post Comments -->
                                    <div class="post-comments">
                                        <a href="#"><i class="fa fa-comment-o" aria-hidden="true"></i> 12</a>
                                    </div>
                                    <!-- Post Share -->
                                    <div class="post-share">
                                        <a href="#"><i class="fa fa-share-alt" aria-hidden="true"></i></a>
                                    </div>
                                </div>
                            </div>
                            <a href="#">
                                <h4 class="post-headline">Where To Get The Best Sunday
                                    Roast In The Cotswolds</h4>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</section>
    <!-- ****** Blog Area End ****** -->

    <!-- footer.jsp include -->
    <c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
