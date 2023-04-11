<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>장바구니</title>
	<!-- Favicon -->
	<link rel="icon" href="/cookology/resources/img/core-img/Cookology_logo.png" />
	<link rel="stylesheet" href="/cookology/resources/css/cart.css"/>

</head>
<body>
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
					<h2>배송조회</h2>
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
						<li class="breadcrumb-item active" aria-current="page"><a href="trackingPage.do">배송조회</a></li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>


<br /><br /><br /><br /><br />
<h1 align="center">장바구니</h1>

<form id="cartForm" action="ordersPage.do" method="post">
	<table>
		<thead>
		<tr>
			<th></th>
			<th>상품 이미지</th>
			<th>상품 이름</th>
			<th>가격</th>
			<th>수량</th>
			<th>할인 가격</th>
			<th>금액</th>
		</tr>
		</thead>
		<tbody>
		<c:set var="totalPrice" value="0" />
		<c:forEach items="${cartList}" var="item">
			<tr>
				<td><input type="checkbox" name="product_seq_id" value="${item.cart_id}"></td>
				<td><img src="${product.product_image}" alt="${item.product_name}"></td>
				<td>${item.product_name}</td>
				<td>${item.price}</td>
				<td>${item.number}</td>
				<td>${item.product_discounted_price}</td>
				<td>${item.number * item.price}</td>
			</tr>
			<!-- 체크된 상품의 가격을 합산 -->
			<c:if test="${fn:contains(selectedItems, item.cart_id)}">
				<c:set var="totalPrice" value="${totalPrice + (item.number * item.price)}" />
			</c:if>
		</c:forEach>
		<tr>
			<td colspan="6" align="right">총 가격:</td>
			<td>${totalPrice}</td>
		</tr>
		</tbody>
	</table>

	<button type="button" onclick="submitSelectedItems()">주문하기</button>
</form>

<script>
	// 폼을 제출할 때 선택된 상품만 전송
	function submitSelectedItems() {
		// Get all the checkboxes
		var checkboxes = document.getElementsByName("product_seq_id");

		// Create an array to store the selected items
		var selectedItems = [];

		// Loop through the checkboxes and check if they are checked
		for (var i = 0; i < checkboxes.length; i++) {
			if (checkboxes[i].checked) {
				// Add the value of the checked checkbox to the selectedItems array
				selectedItems.push(checkboxes[i].value);
			}
		}

		// Create a hidden input field with the selectedItems array as its value
		var hiddenInput = document.createElement("input");
		hiddenInput.setAttribute("type", "hidden");
		hiddenInput.setAttribute("name", "selectedItems");
		hiddenInput.setAttribute("value", selectedItems);

		// Append the hidden input field to the form
		var form = document.getElementById("cartForm");
		form.appendChild(hiddenInput);

		// Change the form action to "orders.jsp"
		form.setAttribute("action", "orders.jsp");

		// Submit the form
		form.submit();
	}
</script>
</body>
</html>
