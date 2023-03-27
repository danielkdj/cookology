<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 세션 세팅 -->
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Favicon -->
<link rel="icon" href="/cookology/resources/img/core-img/favicon.ico" />
<!-- Core Stylesheet -->
<link href="/cookology/resources/css/style.css" rel="stylesheet" />
<link href="/cookology/resources/css/responsive/reponsive.css"
	rel="stylesheet" />
<style type="text/css">
.account_value {
	color: black;
}

.account_value:visited {
	color: black;
}

#kakao-login-btn {
	width: 232px;
	height: 50px;
}

.social_login {
	margin-left: 100px;
	margin-top: 5px;
}
</style>
<link rel="shortcut icon" href="/front_mo/images/favicon.png" />

<title id="forDisplayIdTitle">Cookology : LoginPage</title>

<link rel="stylesheet" type="text/css"
	href="/cookology/resources/css/login/mainStyle.css" />
<link rel="stylesheet" type="text/css"
	href="/cookology/resources/css/login/jquery-ui.css" />

<script src="/cookology/resources/js/login/main.js"></script>
<script src="/cookology/resources/js/login/vendor.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>



</head>


<body id="login" class="hd">

	<!-- Header Start -->
	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	<!-- Header End -->
	<br>

	<div class="login hd__inner450">
		<h2 class="hd__page-title">로그인</h2>
		<span class="hd__page-desc">로그인을 하시면 다양한 혜택을 누리실 수 있습니다.</span>

		<!-- 일반회원 및 가맹점주 로그인 -->
		<div class="member-login">
			<form name="reqLoginForm" method="post" action="#">
				<input type="hidden" name="PW_CHANGE" id="pwChange" value="N" />
			</form>
			<ul class="tab-menu clearfix">
				<li class="tab-menu__list tab-menu__list--on"
					data-tab="hPointMember"><a href="#" class="account_value">일반회원</a>
				</li>
				<li class="tab-menu__list" data-tab="greatingMember"><a
					href="#" class="account_value">가맹점주</a></li>
			</ul>

			<!-- 일반회원 탭 -->
			<section class="tab-content tab-content--show" id="hPointMember">
				<form action="ulogin.do" method="post">
					<div class="input-area">
						<div class="input-box">
							<input type="text" name="userid" class="input__text" id="h_id"
								title="아이디" placeholder="아이디" value="" />
						</div>

						<div class="input-box">
							<input type="password" name="userpwd" class="input__text"
								id="h_pw" title="비밀번호" placeholder="비밀번호" />
						</div>
					</div>
					<div class="member-btn btn">
						<input type="submit" class="btn-init green" id="h_loginBtn"
							value="로그인"> </input>
					</div>
				</form>
				<!-- ID/PW 찾기는 아직 안배웠음. -->
				<ul class="login_link_box">
					<li><a href="/login/memberAccount/idFind"
						class="account_value">아이디 찾기</a></li>
					<li><a href="/login/memberAccount/pwFind"
						class="account_value">비밀번호 찾기</a></li>
					<li><a
						href="${ pageContext.servletContext.contextPath}/enrollPage.do"
						class="account_value">회원가입</a></li>
				</ul>



				<div id="naver_id_login" class="social_login"></div>
				<script type="text/javascript">
					var naver_id_login = new naver_id_login(
							"zxo99cxSQR3QsdgZtNXu",
							"http://127.0.0.1:5500/naverCallback.html");
					var state = naver_id_login.getUniqState();
					naver_id_login.setButton("green", 3, 50);
					naver_id_login
							.setDomain("http://127.0.0.1:5500/naverLogin.html");
					naver_id_login.setState(state);
					naver_id_login.setPopup();
					naver_id_login.init_naver_id_login();
				</script>
				<a id="kakao-login-btn" class="social_login"></a>
				<div id="result"></div>
				<!-- Social Login Script Start : KaKao -->
				<script type="text/javascript">
					Kakao.init("171f722d437c4a5fcc82e11106598de8");
					console.log(Kakao.isInitialized());

					Kakao.Auth
							.createLoginButton({
								container : "#kakao-login-btn",
								success : function(authObj) {
									Kakao.API
											.request({
												url : "/v2/user/me",
												success : function(result) {
													$("#result").append(result);
													id = result.id;
													connected_at = result.connected_at;
													kakao_account = result.kakao_account;
													$("#result").append(
															kakao_account);
													resultdiv = "<h2>로그인 성공 !!";
													resultdiv += "<h4>id: "
															+ id + "<h4>";
													resultdiv += "<h4>connected_at: "
															+ connected_at
															+ "<h4>";
													email = "";
													gender = "";
													if (typeof kakao_account != "undefined") {
														email = kakao_account.email;
														gender = kakao_account.gender;
													}
													resultdiv += "<h4>email: "
															+ email + "<h4>";
													resultdiv += "<h4>gender: "
															+ gender + "<h4>";
													$("#result").append(
															resultdiv);
												},
												fail : function(error) {
													alert("login success, but failed to request user information: "
															+ JSON
																	.stringify(error));
												},
											});
								},
								fail : function(err) {
									alert("failed to login: "
											+ JSON.stringify(err));
								},
							});
				</script>
			</section>
			<!-- 일반회원 탭 End -->

			<!-- 가맹점주 탭 -->
			<section class="box tab-content" id="greatingMember">
				<form action="clogin.do" method="post">
					<div class="input-area">
						<div class="input-box">
							<input type="text" name="userid" class="input__text" id="id"
								title="아이디" placeholder="아이디" value="" />
						</div>

						<div class="input-box">
							<input type="password" name="userid" class="input__text" id="pw"
								title="비밀번호" placeholder="비밀번호" />
						</div>
					</div>
					<div class="member-btn btn">
						<input type="submit" class="btn-init green" id="h_loginBtn"
							value="로그인"> </input>
					</div>
				</form>
				<ul class="login_link_box">
					<li><a href="/login/memberAccount/idFind"
						class="account_value">아이디 찾기</a></li>
					<li><a href="/login/memberAccount/pwFind"
						class="account_value">비밀번호 찾기</a></li>
					<li><a
						href="${ pageContext.servletContext.contextPath}/enrollPage.do"
						class="account_value">회원가입</a></li>
				</ul>
			</section>
			<!-- 가맹점주 탭 END -->

			<!-- Social Login Script End : KaKao -->

			<br>

			<!-- Footer Start -->

			<footer class="footer_area">
				<div class="container">
					<div class="row">
						<div class="col-12">
							<div class="footer-content">
								<!-- Logo Area Start -->
								<div class="footer-logo-area text-center">
									<a href="${ pageContext.servletContext.contextPath}/main.do"
										class="yummy-logo"> Cookology</a>
								</div>
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
									Copyright @2023 All rights reserved | This template is made
									with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a
										href="https://colorlib.com" target="_blank">1A1C</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</footer>

			<!-- Footer End -->

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