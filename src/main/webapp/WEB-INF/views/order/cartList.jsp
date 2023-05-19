<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
	<title>장바구니</title>

	<!-- Favicon -->
	<link rel="icon" href="/cookology/resources/img/core-img/Cookology_logo.png" />
	<link rel="stylesheet" href="/cookology/resources/css/cart.css"/>
	<link rel="stylesheet" href="/cookology/resources/css/tracking.css"/>
	<style type="text/css">
		body {
			min-height: 300vh;
			display: flex;
			flex-direction: column;
		}

		.cart-table {
			flex: 1;
		}

		.cart-table {
			margin: 0 auto; /* 가운데 정렬 */
		}
		button {
			background-color: #fc6c3f;
			border: none;
			color: white;
			padding: 10px 20px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			font-size: 16px;
			margin: 4px 2px;
			cursor: pointer;
			transition-duration: 0.4s;
			border-radius: 5px;
		}

		button:hover {
			background-color: #ff9a76;
			color: white;
		}
		.fadeIn {
			opacity: 0;
			transition: opacity 1.5s;
		}
	</style>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

</head>
<body>
<div style="display: flex; flex-direction: column; min-height: 100vh;">
	<!-- Header Start -->
	<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
	<!-- Header End -->
	<!-- RecentViewPopup Start -->
	<c:import url="/WEB-INF/views/common/recentView.jsp"></c:import>
	<!-- RecentViewPopup End -->
	<!-- 스타일 속성을 적용하여 background-image webapp/resources/img/catagory-img/3.jpg 를 배경으로 한다. -->
	<div class="breadcumb-area">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-12">
					<div class="bradcumb-title text-center">
						<h2>장바구니</h2>
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
							<li class="breadcrumb-item active" aria-current="page"><a href="cartList.do">장바구니</a></li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>


	<br /><br /><br /><br /><br />
	<h1 align="center">장바구니</h1>

	<form id="cartForm" action="orderPage.do" method="post">
		<table class="cart-table">
			<thead>
			<tr>
				<th></th>
				<th>상품 이미지</th>
				<th>상품 이름</th>
				<th>가격</th>
				<th>수량</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${cartList}" var="cartItem">
				<tr>
								<td>
						<input type="checkbox" name="product_seq_id" value="${cartItem.product_seq_id}" data-price="${cartItem.price * cartItem.amount}" onclick="updateTotalPrice()" />

					</td>
					<td>
						<img src="/cookology/resources/img/product-img/${productList[cartItem.product_seq_id].rename_filepath}" alt="${productList[cartItem.product_seq_id].product_name}" style="width: 100px; height: 100px;" />



					</td>
					<td>${productList[cartItem.product_seq_id].product_name}</td>
					<td style="text-align: center;">${cartItem.price}</td>
					<td style="text-align: center;">${cartItem.amount}</td>
				</tr>
			</c:forEach>

				<!-- 체크된 상품의 가격을 합산 -->
			<c:set var="totalPrice" value="0" />
			<c:forEach items="${cartList}" var="cart">
				<c:if test="${fn:contains(param.selectedItems, cart.product_seq_id)}">
					<c:set var="totalPrice" value="${totalPrice + (cart.amount * cart.price)}" />
				</c:if>
			</c:forEach>

			<tr>
				<td colspan="6" align="right">총 가격:</td>
				<td id="totalPrice">${totalPrice}</td>
			</tr>
			</tbody>

		</table>

		<div style="text-align: center;">
			<button type="button" onclick="requestPay()" style="margin-top: 30px;">주문하기</button>
		</div>
	</form>

	<script>

		// 체크된 상품의 총 가격 업데이트하는 함수
		function updateTotalPrice() {
			var selectedItems = getSelectedItems();
			var totalAmount = selectedItems.reduce(function (accumulator, item) {
				return accumulator + item.price;
			}, 0);
			document.getElementById("totalPrice").innerHTML = totalAmount;
		}


		// 아임포트 초기화
		var IMP = window.IMP;
		IMP.init("imp28328013");

		// 체크된 상품 목록을 가져오는 함수
		function getSelectedItems() {
			var checkboxes = document.getElementsByName("product_seq_id");
			var selectedItems = [];

			for (var i = 0; i < checkboxes.length; i++) {
				if (checkboxes[i].checked) {
					var item = {
						product_seq_id: checkboxes[i].value,
						price: parseInt(checkboxes[i].getAttribute("data-price"), 10)
					};
					selectedItems.push(item);
				}
			}
			return selectedItems;
		}
		// 결제 요청 함수
		function requestPay() {
			var selectedItems = getSelectedItems();
			var today = new Date();
			var hours = today.getHours();
			var minutes = today.getMinutes();
			var seconds = today.getSeconds();
			var milliseconds = today.getMilliseconds();
			var MerchantUid = hours + minutes + seconds + milliseconds;
			// 선택된 상품이 없으면 경고 메시지 표시
			if (selectedItems.length === 0) {
				alert("장바구니에서 상품을 선택하세요.");
				return;
			}

			// 선택된 상품의 총 가격 계산
			var totalAmount = selectedItems.reduce(function (accumulator, item) {
				return accumulator + item.price;
			}, 0);
			IMP.request_pay({
				pg: "html5_inicis",
				pay_method: "card",
				merchant_uid: MerchantUid,
				name: "${productNameList}",
				amount: totalAmount,
				buyer_email: "${buyerEmail}",
				buyer_name: "${buyerName}",
				buyer_tel: "${buyerTel}",
				buyer_addr: "${buyerAddr1} ${buyerAddr2}",
				buyer_postcode: "${buyerPostcode}"
			}, function (rsp) {
				if (rsp.success) {
					alert("결제가 완료되었습니다.");
					// 결제 성공시 로직 작성
				} else {
					alert("결제에 실패하였습니다.");
					// 결제 실패시 로직 작성
				}
			});
		}
	</script>
</div>
</body>
</html>
