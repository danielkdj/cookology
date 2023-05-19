<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Cookology | OrderPage</title>
	<link rel="stylesheet" href="/cookology/resources/css/tracking.css"/>
	<!-- Favicon -->
	<link rel="icon" href="/cookology/resources/img/core-img/Cookology_logo.png" />
	<link rel="stylesheet" href="/cookology/resources/css/order.css">
	<!-- Jquery-3.6.3 js -->
	<script src="/cookology/resources/js/jquery/jquery-3.6.3.min.js"></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/v1/iamport.js"></script>

	<script type="text/javascript">
		var IMP = window.IMP;
		IMP.init("imp28328013"); // 아임포트 API 키로 초기화

		function requestPay() {
			// 가맹점에서 생성 및 관리하는 물건 고유 번호 생성
			var today = new Date();
			var hours = today.getHours();
			var minutes = today.getMinutes();
			var seconds = today.getSeconds();
			var milliseconds = today.getMilliseconds();
			var MerchantUid = hours + minutes + seconds + milliseconds;

			IMP.request_pay({
				pg : "html5_inicis",							 		  	 // 결제 수단(이니시스 결제창)
				pay_method : "card", 							 			 // 결제 방식(신용카드)
				merchant_uid : MerchantUid, 	 					 		 // 가맹점에서 관리하는 고유 주문 번호
				name : "${order.product_name}", 			    		  	 // 상품 이름
				amount : ${order.amount}, 						 			 // 결제 총 금액
				buyer_email : "${ order.user_email }", 			 			 // 구매자 이메일
				buyer_name : "${ order.user_name }", 		    			 // 구매자 이름
				buyer_tel : "${ order.user_phone }", 		     		 	 // 구매자 연락처
				buyer_addr : "${ order.user_address }", 					 // 구매자 주소
				buyer_postcode : "${ order.user_postcode }" 	 			 // 구매자 우편번호
			}, function(rsp) {
				if (rsp.success) { // 결제 성공 시
					var msg = "결제가 완료되었습니다.";
					alert(msg);
					jQuery.ajax({
						url : "https://www.myservice.com/payments/complete",
						method : "POST",
						headers : {
							"Content-Type" : "application/json"
						},
						data : {
							imp_uid : rsp.imp_uid,
							merchant_uid : rsp.merchant_uid
						}
					}).done(function(data) {
						// 가맹점 서버 결제 API 성공시 로직
					});
					location.href = "결제 완료 후 이동할 페이지 url";
				} else { // 결제 실패 시
					var msg = "결제에 실패했습니다.";
					msg += "Error message: " + rsp.error_msg;
					alert(msg);
				}
			});
		}

	</script>

</head>
<body>

<!-- Header Start -->
	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	<!-- Header End -->

	<!-- RecentViewPopup Start -->
	<c:import url="/WEB-INF/views/common/recentView.jsp"></c:import>
	<!-- RecentViewPopup End -->

	<div class="breadcumb-area">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-12">
					<div class="bradcumb-title text-center">
						<h2>주문 / 결제 페이지</h2>
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
							<li class="breadcrumb-item active" aria-current="page"><a href="orderPage.do">주문 / 결제 페이지</a></li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>


	<br /><br /><br /><br /><br />
	<h1 align="center">주문 / 결제 페이지</h1>
		<div class="content_main">
			<table>
				<tr>
					<th>상품 이미지</th>
					<th>상품 이름</th>
					<th>수량</th>
					<th>상품 가격</th>
					<th>총 가격</th>
				</tr>
				<c:if test="${not empty ordersList}">
					<c:forEach var="order" items="${ordersList}">
						<tr>
							<td><img src="${order.product.product_image}" alt="${order.product.product_name}"></td>
							<td>${order.product.product_name}</td>
							<td>${order.amount}</td>
							<td>${order.product.product_price}</td>
							<td>${order.totalPrice}</td>
						</tr>
					</c:forEach>
				</c:if>

			</table>
		<!-- Payment button -->
		<div class="payment_button_div">
			<button onclick="requestPay()">지금 구매하기</button>
		</div>
	</div>
	<!-- Order page End -->

	<!-- footer 시작 -->
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	<!-- footer 끝 -->

</body>
</html>