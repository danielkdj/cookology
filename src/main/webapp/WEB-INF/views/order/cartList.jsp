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

<form id="cartForm" action="orderPage.do" method="post">
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

		// Change the form action to "order.jsp"
		form.setAttribute("action", "order.jsp");

		// Submit the form
		form.submit();
	}
</script>
</body>
</html>
