<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">

<title>Cookology - Home</title>
<style type="text/css">
#loginBox {
	position: absolute;
	left: 1100px;
	top: 10px;
	z-index: 20;
	font-size: 13px;
	text-decoration: none;
}

#loginBox a {
	color: black;
}

#loginBox a:visited {
	color: black;
}

.logout-btn {
	padding: 1px;
}
</style>
<!-- Favicon -->
<link rel="icon"
	href="/cookology/resources/img/core-img/Cookology_logo.png" />
<!-- Core Stylesheet -->
<link href="/cookology/resources/css/style.css" rel="stylesheet" />
<link href="/cookology/resources/css/responsive/reponsive.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
<script type="text/javascript">
	function movePage() {
		location.href = "loginPage.do";
	}
</script>
</head>
<body>

	<!-- ****** Top Header Area Start ****** -->
	<div class="top_header_area">
		<div class="container">
			<div class="row">
				<div class="col-5 col-sm-6">
					<!--  Top Social bar start -->

				</div>



				<!--  Login Register Area -->
				<div class="col-7 col-sm-6">
					<div
						class="signup-search-area d-flex align-items-center justify-content-end">

						<!-- Login Area Display Start -->
						<!-- 로그인 안 했을 때 : Session 객체 안에 loginMember 가 없다면 -->
						<c:if test="${ empty sessionScope.loginMember }">
							<div class="login_register_area d-flex">
								<div class="login">
									<a
										href="${ pageContext.servletContext.contextPath}/loginPage.do">로그인</a>
								</div>
								<div class="register">
									<a
										href="${ pageContext.servletContext.contextPath}/enrollPage.do">회원가입</a>
								</div>
								<div class="#">
									<a href="#">고객지원</a>
								</div>
							</div>
						</c:if>
						<!-- Login Area Display End -->

					</div>
				</div>

				<!-- 로그인 했을 때 : 일반회원인 경우 -->
				<c:if
					test="${!empty sessionScope.loginMember and loginMember.admin ne 'Y' }">
					<div id="loginBox" class="lineA">
						${ loginMember.username }님 &nbsp; <a>쪽지</a> &nbsp; &nbsp; <a>메일</a>
						&nbsp; &nbsp;
						<!-- 마이페이지 클릭시 연결대상과 전달값 지정 -->
						<c:url var="callMyInfo" value="/myinfo.do">
							<c:param name="userid" value="${loginMember.userid }" />
						</c:url>
						<a href="${ callMyInfo }">My Page</a> &nbsp;
						<button class="logout-btn"
							onclick="javascript:location.href='logout.do';">
							<span>로그아웃</span>
						</button>
					</div>
				</c:if>
				<!-- 로그인 했을 때 : 관리자인 경우 -->
				<c:if
					test="${ !empty sessionScope.loginMember and loginMember.admin eq 'Y' }">
					<div id="loginBox" class="lineA">
						${ loginMember.username } 님 &nbsp; <a
							href="${ pageContext.servletContext.contextPath}/admin.do">관리
							페이지로 이동</a> &nbsp;
						<!-- 마이페이지 Service 제공 클릭시 연결대상과 전달값 지정 -->
						<c:url var="callMyIjfo" value="/myinfo.do">
							<c:param name="userid" value="${ loginMember.userid }" />
						</c:url>
						<a href="${ callMyInfo }">My Page</a> &nbsp;
						<button class="logout-btn"
							onclick="javascript:location.href='logout.do';">
							<span>로그아웃</span>
						</button>
					</div>

				</c:if>
				<!-- Login Area Display End -->
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
						<a href="${ pageContext.servletContext.contextPath}/main.do"
							class="yummy-logo"> Cookology</a>
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

								<li class="nav-item"><a class="nav-link"
									href="/cookology/WEB-INF/views/common/best.html">레시피</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/cookology/WEB-INF/views/common/recipes.html">밀키트</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/cookology/WEB-INF/views/common/recipes.html">이벤트</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/cookology/WEB-INF/views/common/event.html">장바구니</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/cookology/WEB-INF/views/common/tracking.html">배송조회</a></li>

							</ul>
						</div>
					</nav>

				</div>

			</div>
		</div>
		</div>
	</header>

	<!-- ****** Header Area End ****** -->

	<!-- Jquery-3.6.3 js -->
	<script src="/cookology/resources/js/jquery-3.6.3.min.js"></script>
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