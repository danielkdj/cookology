<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<header>
		<h1 id="logo">Spring project : first</h1>
		<!-- 로그인 하지 않은 경우-->
		<c:if test="${empty loginMember}">
			
		</c:if>
		
		<!-- 로그인 한 경우 : 관리자가 로그인 한 경우 -->
		<c:if test="${ !empty sessionScope.loginMember and loginMember.admin eq 'Y'} }">
		
		</c:if>
		
		
		<!-- 로그인 한 경우 : 일반회원이 로그인 한 경우 -->
		<c:if test="${ !empty sessionScope.loginMember and loginMember.admin eq 'N'} }">
		
		</c:if>		
		
	</header>
</body>
</html>