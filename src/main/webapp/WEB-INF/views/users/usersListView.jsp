<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>first</title>
<style type="text/css">
form.sform {
	display: none;  /* 안 보이게 설정 */
	background: lightgray;
}
</style>
<script type="text/javascript" 
	src="${ pageContext.servletContext.contextPath }/resources/js/jquery/jquery-3.6.3.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('input[name=item]').on('change', function(){
			$('input[name=item]').each(function(index){
				if($(this).is(':checked')){
					$('form.sform').eq(index).css('display', 'block');
				}else{
					$('form.sform').eq(index).css('display', 'none');
				}
			});  //each
		});  //on
		
	}); //document.ready
	
	// 로그인 제한 / 가능 함수
	function changeLogin(element){
		//선택한 radio의 name 속성의 이름에서 userid 분리 추출함
		var user_email = element.name.substring(9);
		
		if(element.checked == true && element.value == "N"){
			//로그인 제한을 체크했다면
			console.log("로그인 제한 체크함");
			location.href = "${ pageContext.servletContext.contextPath }/loginok.do?user_email=" 
						+ user_email + "&login_ok=N";
		}else{
			//로그인 가능을 체크했다면
			console.log("로그인 가능 체크함");
			location.href = "${ pageContext.servletContext.contextPath }/loginok.do?user_email=" 
						+ user_email + "&login_ok=Y";
		}
	}
	// 로그인 제한 / 가능 함수
	function changeAdmin(element){
		//선택한 radio의 name 속성의 이름에서 user_email 분리 추출함
		var user_email = element.name.substring(9);
			
		if(element.checked == true && element.value == "N"){
			//로그인 제한을 체크했다면
			location.href = "${ pageContext.servletContext.contextPath }/adminok.do?user_email=" + user_email + "&admin_ok=N";
		}else{
			//로그인 가능을 체크했다면
			location.href = "${ pageContext.servletContext.contextPath }/adminok.do?user_email=" + user_email + "&admin_ok=Y";
		}
	}

	
</script>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr>
<h1 align="center">회원 관리 페이지</h1>
<h2 align="center">현재 회원수 : ${ requestScope.list.size() } 명</h2>
<center>
	<button onclick="javascript:location.href='${ pageContext.servletContext.contextPath }/ulist.do';">전체 보기</button>
	<br><br>
	<!-- 항목별 검색 기능 추가 -->
	<fieldset id="ss">
		<legend>검색할 항목을 선택하세요.</legend>
		<input type="radio" name="item" id="uid"> 회원아이디 &nbsp;
		<input type="radio" name="item" id="uenroll"> 가입날짜 &nbsp;
	</fieldset>
	<!-- 검색 항목 제공 끝 -->
	<br>
	<!-- 회원아이디로 검색 폼 -->
	<form action="${ pageContext.servletContext.contextPath }/usearch.do" 
	method="post" id="idform" class="sform">
		<input type="hidden" name="action" value="id">
		<input type="search" name="keyword"> &nbsp;
		<input type="submit" value="검색">
	</form>
	
	<!-- 가입날짜로 검색 폼 -->
	<form action="${ pageContext.servletContext.contextPath }/usearch.do" 
	method="post" id="enrollform" class="sform">
		<input type="hidden" name="action" value="enroll">
		<input type="date" name="begin"> ~ 
			<input type="date" name="end"> &nbsp;
		<input type="submit" value="검색">
	</form>
	
		<!-- 로그인 제한/가능 여부로 검색 폼 -->
	<form action="${ pageContext.servletContext.contextPath }/usearch.do" 
	method="post" id="lokform" class="sform">
		<input type="hidden" name="action" value="login">
		<input type="radio" name="keyword" value="Y"> 로그인 가능 회원 &nbsp;
		<input type="radio" name="keyword" value="N"> 로그인 제한 회원 &nbsp;
		<input type="submit" value="검색">
	</form>
	
		<!-- 관리자 검색 폼 -->
	<form action="${ pageContext.servletContext.contextPath }/usearch.do" 
	method="post" id="aokform" class="sform">
		<input type="hidden" name="action" value="admin">
		<input type="radio" name="keyword" value="Y"> 관리자 &nbsp;
		<input type="radio" name="keyword" value="N"> 일반 회원 &nbsp;
		<input type="submit" value="검색">
	</form>
	
	
</center>
<br><br>
<!-- 조회해 온 회원 리스트 출력 처리 -->
<table align="center" border="1" cellspacing="0" cellpadding="3">
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>전화번호</th>
		<th>가입날짜</th>
		<th>마지막 정보수정날짜</th>
		<th>로그인 제한여부</th>
		<th>관리자 권한 부여</th>
	</tr>
	<c:forEach items="${ requestScope.list }" var="m">
		<tr>
			<td>${ m.user_email }</td>
			<td>${ m.user_name }</td>
			<td>${ m.user_phone }</td>
			<td>
				<fmt:formatDate value="${ m.create_at }" 
				type="date" dateStyle="medium" />
			</td>
			<td>
				<fmt:formatDate value="${ m.modifyed_at }"
				type="date" dateStyle="medium" />
			</td>
			<td>
				<c:if test="${ m.login_ok eq 'Y' }">
					<input type="radio" name="login_ok_${ m.user_email }" 
					value="Y" checked onchange="changeLogin(this);"> 가능 &nbsp;
					<input type="radio" name="login_ok_${ m.user_email }" 
					value="N" onchange="changeLogin(this);"> 제한
				</c:if>
				<c:if test="${ m.login_ok eq 'N' }">
					<input type="radio" name="login_ok_${ m.user_email }"  
					value="Y" onchange="changeLogin(this);"> 가능 &nbsp;
					<input type="radio" name="login_ok_${ m.user_email }"  
					value="N" checked onchange="changeLogin(this);"> 제한
				</c:if>
			</td>
			<td>
				<c:if test="${ m.admin_ok eq 'Y' }">
					<input type="radio" name="admin_ok_${ m.user_email }" 
					value="Y" checked onchange="changeAdmin(this);"> 관리자 &nbsp;
					<input type="radio" name="admin_ok m.admin_ok }" 
					value="N" onchange="changeAdmin(this);"> 일반회원
				</c:if>
				<c:if test="${ m.admin_ok eq 'N' }">
					<input type="radio" name="admin_ok_${ m.user_email }" 
					value="Y" onchange="changeAdmin(this);"> 관리자 &nbsp;
					<input type="radio" name="admin_ok m.admin_ok }" 
					value="N" checked onchange="changeAdmin(this);"> 일반회원
				</c:if>
			</td>
		</tr>
	</c:forEach>
</table>
<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>







