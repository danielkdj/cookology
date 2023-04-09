<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

<%-- Order Page Start --%>
	<div>
		<div class="content_subject">
			<span>장바구니</span>
		</div>

		<div class="content_main">
			<!-- 사용자 정보 -->
			<div class="user_info_div">
				<table class="table_text_align_center userrInfo_table">
					<tbody>
					<tr>
						<th style="width: 25%;">주문자</th>
						<td style="width: 25%">${ order.user_email }</td>
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
							<td style="width: 25%"><input type="text" name="receiver_name" value="${order.user_name }" required></td>
						</tr>
						<tr>
							<th>연락처</th>
							<td><input type="text" name="receiver_phone" value="${order.user_phone }" required></td>
						</tr>
						<tr>
							<th>주소</th>
							<td>
								<input type="text" id="postcode" name="receiver_postcode" value="${order.user_postcode }" readonly required>
								<input type="button" value="우편번호 찾기" onclick="searchAddress();"><br>
								<input type="text" id="address" name="receiver_address" value="${order.user_address }" readonly required><br>
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
						<th style="width: 30%;">상품정보</th>
						<th style="width: 20%;">판매자</th>
						<th style="width: 15%;">배송비</th>
						<th style="width: 10%;">수량</th>
						<th style="width: 15%;">상품금액</th>
					</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${ order.items }">
							<tr>
								<td>${ order.product.name }</td>
								<td>${ order.number }</td>
								<td>${ order.price }</td>
								<td>${ order.amount }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<!-- 포인트 정보 -->
		<div class="point_info_div">
			<table class="table_text_align_center point_info_table">
				<tbody>
				<tr>
					<th style="width: 25%;">사용 가능한 포인트</th>
					<td style="width: 25%">${ order.point }</td>
				</tr>
				<tr>
					<th>사용할 포인트</th>
					<td><input type="number" name="use_point" value="0" min="0" max="1000"> KRW</td>
				</tr>
				</tbody>
			</table>
		</div>

		<!-- 주문 요약 정보 -->
		<div class="order_info_div">
			<table class="table_text_align_center order_info_table">
				<tbody>
					<tr>
						<th style="width: 25%;">주문 금액</th>
						<td style="width: 25%">order.amount</td>
					</tr>
					<tr>
						<th>배송비</th>
						<td>${ order.deliveryfee }</td>
					</tr>
					<tr>
						<th>총계</th>
						<td>${ order.amount + order.deliveryfee }</td>
					</tr>
				</tbody>
			</table>
		</div>

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