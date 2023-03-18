<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Cookology - Home</title>

    <!-- Jquery-2.2.4 js -->
    <script src="/cookology/resources/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="/cookology/resources/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap-4 js -->
    <script src="/cookology/resources/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins JS -->
    <script src="/cookology/resources/js/others/plugins.js"></script>
    <!-- Active JS -->
    <script src="/cookology/resources/js/active.js"></script>
    <!-- Favicon -->
    <link rel="icon" href="/cookology/resources/img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link href="/cookology/resources/css/style.css" rel="stylesheet">

    <!-- Responsive CSS -->
    <link href="/resource/css/responsive/responsive.css" rel="stylesheet">

</head>
<body>
<!-- Preloader Start -->
<div id="preloader">
    <div class="yummy-load"></div>
</div>

<!-- Background Pattern Swither -->
<div id="pattern-switcher">
    Bg Pattern
</div>
<div id="patter-close">
    <i class="fa fa-times" aria-hidden="true"></i>
</div>

<!-- ****** Top Header Area Start ****** -->
<div class="top_header_area">
    <div class="container">
        <div class="row">
            <div class="col-5 col-sm-6">
                <!--  Top Social bar start -->
                <div class="top_social_bar">
                    <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                    <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                    <a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
                    <a href="#"><i class="fa fa-skype" aria-hidden="true"></i></a>
                    <a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a>
                </div>
            </div>
            <!--  Login Register Area -->
            <div class="col-7 col-sm-6">
                <div class="signup-search-area d-flex align-items-center justify-content-end">
                    <div class="login_register_area d-flex">
                        <div class="login">
                            <a href="register.html">로그인</a>
                        </div>
                        <div class="register">
                            <a href="register.html">회원가입</a>
                        </div>
                        <div class="support">
                            <a href="support.html">고객지원</a>
                        </div>
                    </div>
                    <!-- Search Button Area -->
                    <div class="search_button">
                        <a class="searchBtn" href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                    </div>
                    <!-- Search Form -->
                    <div class="search-hidden-form">
                        <form action="#" method="get">
                            <input type="search" name="search" id="search-anything" placeholder="Search Anything...">
                            <input type="submit" value="" class="d-none">
                            <span class="searchBtn"><i class="fa fa-times" aria-hidden="true"></i></span>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ****** Top Header Area End ****** -->
<!-- Preloader Start -->

<!-- ****** Top Header Area End ****** -->

<!-- ****** Header Area Start ****** -->
<header class="header_area">
    <div class="container">
        <div class="row">
            <!-- Logo Area Start -->
            <div class="col-12">
                <div class="logo_area text-center">
                    <a href="index.html" class="yummy-logo">Cookology</a>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <nav class="navbar navbar-expand-lg">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#yummyfood-nav"
                            aria-controls="yummyfood-nav" aria-expanded="false" aria-label="Toggle navigation"><i
                            class="fa fa-bars" aria-hidden="true"></i>Menu
                    </button>
                    <!-- Menu Area Start -->
                    <div class="collapse navbar-collapse justify-content-center" id="yummyfood-nav">
                        <ul class="navbar-nav" id="yummy-nav">
                            <li class="nav-item active">
                                <a class="nav-link" href="index.html">Home <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="yummyDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">카테고리</a>
                                <div class="dropdown-menu" aria-labelledby="yummyDropdown">
                                    <a class="dropdown-item" href="index.html">Home</a>
                                    <a class="dropdown-item" href="recipes.html">레시피</a>
                                    <a class="dropdown-item" href="best.html">추천메뉴</a>
                                    <a class="dropdown-item" href="event.html">이벤트</a>
                                    <a class="dropdown-item" href="tracking.html">배송조회</a>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="best.html">베스트</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="recipes.html">레시피</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="event.html">이벤트</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="tracking.html">배송조회</a>
                            </li>
                        </ul>
                    </div>
                </nav>
                <!-- Search Button Area -->
                <div class="search_button">
                    <a class="search-recipes-Btn" href="#"><i class="fa fa-search"
                                                              aria-hidden="true"></i></a>
                </div>
                <!-- Search Form -->
                <div class="search-form">
                    <form action="#" method="get">
                        <input type="search" name="search" id="search-recipes"
                               placeholder="Search Recipes...">
                        <input type="submit"
                               value="" class="d-none">
                        <span class="search-recipes-Btn">
								</span>
                    </form>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- ****** Header Area End ****** -->

<!-- ****** Welcome Post Area Start ****** -->
<section class="welcome-post-sliders owl-carousel">

    <!-- Single Slide -->
    <div class="welcome-single-slide">
        <!-- Post Thumb -->
        <img src="img/bg-img/slide-1.jpg" alt="">
        <!-- Overlay Text -->
        <div class="project_title">
            <div class="post-date-commnents d-flex">
                <a href="#">May 19, 2017</a>
                <a href="#">5 Comment</a>
            </div>
            <a href="#">
                <h5>“I’ve Come and I’m Gone”: A Tribute to Istanbul’s Street</h5>
            </a>
        </div>
    </div>

    <!-- Single Slide -->
    <div class="welcome-single-slide">
        <!-- Post Thumb -->
        <img src="img/bg-img/slide-2.jpg" alt="">
        <!-- Overlay Text -->
        <div class="project_title">
            <div class="post-date-commnents d-flex">
                <a href="#">May 19, 2017</a>
                <a href="#">5 Comment</a>
            </div>
            <a href="#">
                <h5>“I’ve Come and I’m Gone”: A Tribute to Istanbul’s Street</h5>
            </a>
        </div>
    </div>

    <!-- Single Slide -->
    <div class="welcome-single-slide">
        <!-- Post Thumb -->
        <img src="img/bg-img/slide-3.jpg" alt="">
        <!-- Overlay Text -->
        <div class="project_title">
            <div class="post-date-commnents d-flex">
                <a href="#">May 19, 2017</a>
                <a href="#">5 Comment</a>
            </div>
            <a href="#">
                <h5>“I’ve Come and I’m Gone”: A Tribute to Istanbul’s Street</h5>
            </a>
        </div>
    </div>

    <!-- Single Slide -->
    <div class="welcome-single-slide">
        <!-- Post Thumb -->
        <img src="img/bg-img/slide-4.jpg" alt="">
        <!-- Overlay Text -->
        <div class="project_title">
            <div class="post-date-commnents d-flex">
                <a href="#">May 19, 2017</a>
                <a href="#">5 Comment</a>
            </div>
            <a href="#">
                <h5>“I’ve Come and I’m Gone”: A Tribute to Istanbul’s Street</h5>
            </a>
        </div>
    </div>

    <!-- Single Slide -->
    <div class="welcome-single-slide">
        <!-- Post Thumb -->
        <img src="img/bg-img/slide-4.jpg" alt="">
        <!-- Overlay Text -->
        <div class="project_title">
            <div class="post-date-commnents d-flex">
                <a href="#">May 19, 2017</a>
                <a href="#">5 Comment</a>
            </div>
            <a href="#">
                <h5>“I’ve Come and I’m Gone”: A Tribute to Istanbul’s Street</h5>
            </a>
        </div>
    </div>

</section>
<!-- ****** Welcome Area End ****** -->

<!-- ****** Categories Area Start ****** -->

<!-- ****** Categories Area End ****** -->

<!-- ****** Blog Area Start ****** -->

<!-- Single Post -->


<!-- Single Post -->


<!-- ******* List Blog Area Start ******* -->


<!-- ****** QnA Start ****** -->
<div class="container">

    <div class="page-header">
        <h1>FAQ <small>자주하는 질문</small></h1>
    </div>

    <!-- Bootstrap FAQ - START -->
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
            <div class="faqHeader">FnA</div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Is account registration required?</a>
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

    <!-- Bootstrap FAQ - END -->

</div>


<!-- ****** Instagram Area Start ****** -->
<div class="instargram_area owl-carousel section_padding_100_0 clearfix" id="portfolio">

    <!-- Instagram Item -->
    <div class="instagram_gallery_item">
        <!-- Instagram Thumb -->
        <img src="img/instagram-img/1.jpg" alt="">
        <!-- Hover -->
        <div class="hover_overlay">
            <div class="yummy-table">
                <div class="yummy-table-cell">
                    <div class="follow-me text-center">
                        <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i>보러가기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Instagram Item -->
    <div class="instagram_gallery_item">
        <!-- Instagram Thumb -->
        <img src="img/instagram-img/2.jpg" alt="">
        <!-- Hover -->
        <div class="hover_overlay">
            <div class="yummy-table">
                <div class="yummy-table-cell">
                    <div class="follow-me text-center">
                        <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i>보러가기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Instagram Item -->
    <div class="instagram_gallery_item">
        <!-- Instagram Thumb -->
        <img src="img/instagram-img/3.jpg" alt="">
        <!-- Hover -->
        <div class="hover_overlay">
            <div class="yummy-table">
                <div class="yummy-table-cell">
                    <div class="follow-me text-center">
                        <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i>보러가기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Instagram Item -->
    <div class="instagram_gallery_item">
        <!-- Instagram Thumb -->
        <img src="img/instagram-img/4.jpg" alt="">
        <!-- Hover -->
        <div class="hover_overlay">
            <div class="yummy-table">
                <div class="yummy-table-cell">
                    <div class="follow-me text-center">
                        <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i>보러가기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Instagram Item -->
    <div class="instagram_gallery_item">
        <!-- Instagram Thumb -->
        <img src="img/instagram-img/5.jpg" alt="">
        <!-- Hover -->
        <div class="hover_overlay">
            <div class="yummy-table">
                <div class="yummy-table-cell">
                    <div class="follow-me text-center">
                        <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i>보러가기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Instagram Item -->
    <div class="instagram_gallery_item">
        <!-- Instagram Thumb -->
        <img src="img/instagram-img/6.jpg" alt="">
        <!-- Hover -->
        <div class="hover_overlay">
            <div class="yummy-table">
                <div class="yummy-table-cell">
                    <div class="follow-me text-center">
                        <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i>보러가기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Instagram Item -->
    <div class="instagram_gallery_item">
        <!-- Instagram Thumb -->
        <img src="img/instagram-img/1.jpg" alt="">
        <!-- Hover -->
        <div class="hover_overlay">
            <div class="yummy-table">
                <div class="yummy-table-cell">
                    <div class="follow-me text-center">
                        <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i>보러가기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Instagram Item -->
    <div class="instagram_gallery_item">
        <!-- Instagram Thumb -->
        <img src="img/instagram-img/2.jpg" alt="">
        <!-- Hover -->
        <div class="hover_overlay">
            <div class="yummy-table">
                <div class="yummy-table-cell">
                    <div class="follow-me text-center">
                        <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i>보러가기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<!-- ****** Our Creative Portfolio Area End ****** -->

<!-- ****** Footer Social Icon Area Start ****** -->
<div class="social_icon_area clearfix">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="footer-social-area d-flex">
                    <div class="single-icon">
                        <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i><span>facebook</span></a>
                    </div>
                    <div class="single-icon">
                        <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i><span>Twitter</span></a>
                    </div>
                    <div class="single-icon">
                        <a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i><span>GOOGLE+</span></a>
                    </div>
                    <div class="single-icon">
                        <a href="#"><i class="fa fa-linkedin-square" aria-hidden="true"></i><span>linkedin</span></a>
                    </div>
                    <div class="single-icon">
                        <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i><span>Instagram</span></a>
                    </div>
                    <div class="single-icon">
                        <a href="#"><i class="fa fa-vimeo" aria-hidden="true"></i><span>VIMEO</span></a>
                    </div>
                    <div class="single-icon">
                        <a href="#"><i class="fa fa-youtube-play" aria-hidden="true"></i><span>YOUTUBE</span></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ****** Footer Social Icon Area End ****** -->

<!-- ****** Footer Menu Area Start ****** -->
<footer class="footer_area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="footer-content">
                    <!-- Logo Area Start -->
                    <div class="footer-logo-area text-center">
                        <a href="index.html" class="yummy-logo">Cookology</a>
                    </div>
                    <!-- Menu Area Start -->
                    <nav class="navbar navbar-expand-lg">
                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                                data-target="#yummyfood-footer-nav" aria-controls="yummyfood-footer-nav"
                                aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars"
                                                                                        aria-hidden="true"></i> Menu
                        </button>
                        <!-- Menu Area Start -->
                        <div class="collapse navbar-collapse justify-content-center" id="yummyfood-footer-nav">
                            <ul class="navbar-nav" name="ar">
                                <li class="nav-item active">
                                    <a class="nav-link" href="index.html">Home <span
                                            class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="best.html">베스트</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="recipes.html">레시피</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="event.html">이벤트</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="contact.html">배송조회</a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-12">
                <!-- Copywrite Text -->
                <div class="copy_right_text text-center">
                    <p>Copyright @2023 All rights reserved | This template is made with <i class="fa fa-heart-o"
                                                                                           aria-hidden="true"></i> by <a
                            href="https://colorlib.com" target="_blank">1A1C</a></p>
                </div>
            </div>
        </div>
    </div>
</footer>

<!-- ****** Footer Menu Area End ****** -->


</body>
