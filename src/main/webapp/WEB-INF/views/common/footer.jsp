<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<title>Cookology - Home</title>
	<!-- Favicon -->
<link rel="icon" href="/cookology/resources/img/core-img/favicon.ico" />
	<!-- Core Stylesheet -->
<link href="/cookology/resources/css/style.css" rel="stylesheet" />
<link href="/cookology/resources/css/responsive/reponsive.css"
	rel="stylesheet" />
</head>

<body>

	<!-- ****** Footer Menu Area Start ****** -->
	<footer class="footer_area">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="footer-content">
						<!-- Logo Area Start -->
						<div class="footer-logo-area text-center">
						<a href="${ pageContext.servletContext.contextPath}/main.do" class="yummy-logo">
							Cookology</a>
						</div>
						<!-- Menu Area Start -->
						<nav class="navbar navbar-expand-lg">
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#yummyfood-footer-nav"
								aria-controls="yummyfood-footer-nav" aria-expanded="false"
								aria-label="Toggle navigation">
								<i class="fa fa-bars" aria-hidden="true"></i> Menu
							</button>
							<!-- Menu Area Start -->
							<div class="collapse navbar-collapse justify-content-center"
								id="yummyfood-footer-nav">
								<ul class="navbar-nav">
									<li class="nav-item active"><a class="nav-link"
									href="${ pageContext.servletContext.contextPath}/main.do">Home <span
											class="sr-only">(current)</span></a></li>
									<li class="nav-item"><a class="nav-link" href="best.html">베스트</a>
									</li>
									<li class="nav-item"><a class="nav-link"
										href="recipes.html">레시피</a></li>
									<li class="nav-item"><a class="nav-link" href="event.html">이벤트</a>
									</li>
									<li class="nav-item"><a class="nav-link"
										href="contact.html">배송조회</a></li>
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
						<p>
							Copyright @2023 All rights reserved | This template is made with
							<i class="fa fa-heart-o" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">1A1C</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>

	<!-- ****** Footer Menu Area End ****** -->

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