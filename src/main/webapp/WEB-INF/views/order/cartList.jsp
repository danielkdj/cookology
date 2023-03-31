<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Cart List</title>
	<style>
		body {
			font-family: Arial, sans-serif;
		}
		table {
			border-collapse: collapse;
			margin: 20px 0;
		}
		th, td {
			border: 1px solid #ddd;
			padding: 8px;
			text-align: left;
		}
		th {
			background-color: #f2f2f2;
		}
		img {
			max-width: 100px;
		}
		.total-price {
			font-weight: bold;
		}
		input[type="checkbox"] {
			margin-right: 5px;
		}
		input[type="submit"] {
			margin-top: 20px;
			padding: 10px;
			background-color: #4CAF50;
			color: #fff;
			border: none;
			border-radius: 3px;
			cursor: pointer;
			font-size: 16px;
		}
		input[type="submit"]:hover {
			background-color: #3e8e41;
		}
	</style>
</head>
<body>
<h1>장바구니</h1>

<form action="orderPage.do" method="post">
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

	<input type="submit" value="주문하기">
</form>

<script>
	// 폼을 제출할 때 선택된 상품만 전송
	var form = document.querySelector('form');
	form.addEventListener('submit', function(event) {
		var selectedItems = document.getElementsByName('selectedItems');
		for (var i = 0; i < selectedItems.length; i++) {
			if (!selectedItems[i].checked) {
				selectedItems[i].disabled = true;
			}
		}
	});
</script>
</body>
</html>
