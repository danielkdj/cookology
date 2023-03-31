<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Cookology | OrderPage</title>
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath}/resources/css/order/order.css">
	<!-- Jquery-3.6.3 js -->
	<script src="${ pageContext.servletContext.contextPath}/resources/js/jquery/jquery-3.6.3.min.js"></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<!-- 다음주소 API -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
		var IMP = window.IMP;
		IMP.init("imp28328013");

		function requestPay() {
			// 가맹점에서 생성 및 관리하는 물건 고유 번호 생성
			var today = new Date();
			var hours = today.getHours();
			var minutes = today.getMinutes();
			var seconds = today.getSeconds();
			var milliseconds = today.getMilliseconds();
			var makeMerchantUid = hours + minutes + seconds + milliseconds;

			IMP.request_pay({
				pg : "html5_inicis",							 // 결제 수단(이니시스 결제창)
				pay_method : "card", 							 // 결제 방식(신용카드)
				merchant_uid : makeMerchantUid, 	 			 // 가맹점에서 관리하는 고유 주문 번호
				name : "${ product.product_name }", 			 // 상품 이름
				amount : "${ cart.price * cart.number}", 		 // 결제 금액
				buyer_email : "${ users.user_email }", 			 // 구매자 이메일
				buyer_name : "${ users.user_name }", 		     // 구매자 이름
				buyer_tel : "${ users.user_phone }", 		     // 구매자 연락처
				buyer_addr : "${ users.user_address }", 		 // 구매자 주소
				buyer_postcode : "${ users.user_postcode }" 	 // 구매자 우편번호
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
				} else { // 결제 실패
					var msg = "Payment has failed.";
					msg += "Error message: " + rsp.error_msg;
					alert(msg);
				}
			});
		}
		// Daum Address API usage
		function searchAddress() {
			new daum.Postcode({
				oncomplete : function(data) {
					$('#address').val(data.address);
					$('#postcode').val(data.zonecode);
				}
			}).open();
		}

	</script>
</head>
<body>
	<!-- Header Start -->
	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	<!-- Header End -->

	<%-- 주문 페이지 시작 --%>
	<div class="content_subject"><span>장바구니</span></div>
	<div class="content_main">
		<!-- 사용자 정보 -->
		<div class="user_info_div">
			<table class="table_text_align_center userrInfo_table">
				<tbody>
				<tr>
					<th style="width: 25%;">주문자</th>
					<td style="width: 25%">${ users.user_email }</td>
				</tr>
				</tbody>
			</table>
		</div>

		<!-- 배송 정보 -->
		<div class="delivery_info_div">
			<form id="delivery_info_form">
				<table class="table_text_align_center delivery_info_table">
					<tbody>
					<tr>
						<th style="width: 25%;">수령인</th>
						<td style="width: 25%"><input type="text" name="receiver_name" value="${users.user_name }" required></td>
					</tr>
					<tr>
						<th>연락처</th>
						<td><input type="text" name="receiver_phone" value="${users.user_phone }" required></td>
					</tr>
					<tr>
						<th>주소</th>
						<td>
							<input type="text" id="postcode" name="receiver_postcode" value="${users.user_postcode }" readonly required>
							<input type="button" value="우편번호 찾기" onclick="searchAddress();"><br>
							<input type="text" id="address" name="receiver_address" value="${users.user_address }" readonly required><br>
							<input type="text" name="receiver_detailAddress" value="" placeholder="상세주소" required>
						</td>
					</tr>
					<tr>
						<th>배송 요청사항</th>
						<td><textarea name="delivery_memo" placeholder="요청사항을 입력해주세요"></textarea></td>
					</tr>
					</tbody>
				</table>
			</form>
		</div>

		<!-- 상품 정보 -->
		<div class="product_info_div">
			<table class="table_text_align_center product_info_table">
				<thead>
				<tr>
					<th style="width: 20%;">상품명</th>
					<th style="width: 20%;">수량</th>
					<th style="width: 20%;">가격</th>
					<th style="width: 20%;">총 가격</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td>${ cart.product_name }</td>
					<td>${ cart.number }</td>
					<td>${ cart.price }</td>
					<td>${ cart.price * cart.number } 원</td>
				</tr>
				</tbody>
			</table>
		</div>

	<!-- 포인트 정보 -->
	<div class="point_info_div">
		<table class="table_text_align_center point_info_table">
			<tbody>
				<tr>
					<th style="width: 25%;">사용 가능한 포인트</th>
					<td style="width: 25%">1,000원</td>
				</tr>
				<tr>
					<th>사용한 포인트</th>
					<td><input type="number" name="use_point" value="0"></td>
				</tr>
        		<tr>
            		<th>적립 예정 포인트</th>
            		<td>150원</td>
 				</tr>
			</tbody>
	</table>
</div>

	<!-- 주문 요약 정보 -->
	<div class="order_info_div">
		<table class="table_text_align_center order_info_table">
			<tbody>
				<tr>
					<th style="width: 25%;">소계</th>
					<td style="width: 25%">15,000원</td>
				</tr>
				<tr>
					<th>배송비</th>
					<td>무료</td>
				</tr>
				<tr>
					<th>총계</th>
					<td>15,000원</td>
				</tr>
			</tbody>
		</table>
	</div>

	<!-- 결제 버튼 -->
	<div class="payment_button_div">
		<button onclick="requestPay()">구매하기</button>
	</div>
	</div>
	<!-- 주문 페이지 끝 -->

	<!-- Footer Start -->
	<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
	<!-- Footer End -->
</body>
</html>
