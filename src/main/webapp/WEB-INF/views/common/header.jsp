<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="description" content="" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- Core Stylesheet -->
<link href="/cookology/resources/css/style.css" rel="stylesheet" />

<link href="/cookology/resources/css/responsive/reponsive.css"
	rel="stylesheet" />

</head>
<body>

		<!-- ****** Top Header Area Start ****** -->
	<div class="top_header_area">
		<div class="container">
			<div class="row">
				<div class="col-5 col-sm-6">
					<!--  Top Social bar start -->
					<div class="top_social_bar">
						<a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
						<a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a> <a
							href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a> <a
							href="#"><i class="fa fa-skype" aria-hidden="true"></i></a> <a
							href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a>
					</div>
				</div>
				<!--  Login Register Area -->
				<div class="col-7 col-sm-6">
					<div class="signup-search-area d-flex align-items-center justify-content-end">
						<div class="login_register_area d-flex">
							<div class="login">

								<a href="/cookology/WEB-INF/views/user/loginPage.jsp\jpg">로그인</a>
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
							<a class="searchBtn" href="#"><i
								class="fa fa-search" aria-hidden="true"></i></a>
						</div>
						<!-- Search Form -->
						<div class="search-hidden-form">
							<form action="#" method="get">
								<input type="search" name="search" id="search-anything"
									placeholder="Search Anything..." /> <input
									type="submit" value="" class="d-none" /> <span
									class="searchBtn"><i
									class="fa fa-times" aria-hidden="true"></i></span>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ****** Top Header Area End ****** -->

	<!-- ****** Header Area Start ****** -->
	<header class="header_area">
		<div class="container">
			<div class="row">
				<!-- Logo Area Start -->
				<div class="col-12">
					<div class="logo_area text-center">
						<a href="/cookology/WEB-INF/views/common/main.jsp"
							class="yummy-logo">Cookology</a>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-12">
					<nav class="navbar navbar-expand-lg">
						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#yummyfood-nav"
							aria-controls="yummyfood-nav" aria-expanded="false"
							aria-label="Toggle navigation">
							<i class="fa fa-bars" aria-hidden="true"></i>Menu
						</button>
						<!-- Menu Area Start -->
						<div class="collapse navbar-collapse justify-content-center"
							id="yummyfood-nav">
							<ul class="navbar-nav" id="yummy-nav">
								<li class="nav-item active"><a class="nav-link" href="">Home
										<span class="sr-only">(current)</span>
								</a></li>
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="" id="yummyDropdown"
									role="button" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">카테고리</a>
									<div class="dropdown-menu" aria-labelledby="yummyDropdown">
										<a class="dropdown-item"
											href="/cookology/WEB-INF/views/common/main.jsp">Home</a> <a
											class="dropdown-item"
											href="/cookology/WEB-INF/views/common/recipes.html">레시피</a> <a
											class="dropdown-item"
											href="/cookology/WEB-INF/views/common/best.html">추천메뉴</a> <a
											class="dropdown-item"
											href="/cookology/WEB-INF/views/common/event.html">이벤트</a> <a
											class="dropdown-item"
											href="/cookology/WEB-INF/views/common/tracking.html">배송조회</a>
									</div></li>
								<li class="nav-item"><a class="nav-link"
									href="/cookology/WEB-INF/views/common/best.html">베스트</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/cookology/WEB-INF/views/common/recipes.html">레시피</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/cookology/WEB-INF/views/common/event.html">이벤트</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/cookology/WEB-INF/views/common/tracking.html">배송조회</a></li>
							</ul>
						</div>
					</nav>

				</div>
				<!-- Search Form -->
				<div class="search-form">
					<form action="#" method="get">
						<input type="search" name="search" id="search-recipes"
							placeholder="Search Recipes..." /> <input
							type="submit" value="" class="d-none" /> <span
							class="search-recipes-Btn"> </span>
					</form>
				</div>
			</div>
		</div>
		</div>
	</header>

	<!-- ****** Header Area End ****** -->
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
</body>
</html>