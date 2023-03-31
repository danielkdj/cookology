<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>client 회원가입 페이지</title>

	<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script type="text/javascript">

		//비밀번호 유효성 검사
		function validatePwd() {
			let pwdInput = document.getElementById("client_pwd1");
			let client_Pwd1 = pwdInput.value;
			let message = document.getElementById("pwdValidationError");

			let pwdRegex = /^(?=.*[a-zA-Z].*[a-zA-Z].*[a-zA-Z].*[a-zA-Z].*[a-zA-Z])(?=.*\d.*\d)(?=.*[\W_]).{10,}$/;

			if(pwdRegex.test(client_Pwd1)){
				message.innerHTML = " 사용가능한 비밀번호입니다.";
				message.style.color = "green";
			}else{
				message.innerHTML = " 사용불가능한 비밀번호입니다.";
				message.style.color = "red";
			}
		}


		//비밀번호 재확인
		function checkPassword(){
			let client_Pwd1 = document.getElementById("client_pwd1").value;
			let client_Pwd2 = document.getElementById("client_pwd2").value;

			if(client_Pwd1 !== client_Pwd2){
				document.getElementById("passwordError").innerHTML = "비밀번호가 일치하지 않습니다.";
				passwordError.style.color = "red";
			}else{
				document.getElementById("passwordError").innerHTML = "비밀번호 확인에 성공했습니다.";
				passwordError.style.color = "green";
			}
		}


		//이름 유효성 검사
		function validateName(){
			let nameInput = document.getElementById("client_name");
			let client_name = nameInput.value;
			let message = document.getElementById("nameValidationError");

			let nameRegex = /^(?=.*[가-힣a-zA-Z]).{3,10}$/;

			if(nameRegex.test(client_name)){
				message.innerHTML = "이름을 확인했습니다.";
				message.style.color = "green";
			}else{
				message.innerHTML = "이름이 적합하지 않습니다" + "/n한글, 영어를 조합해 3~9글자까지만 작성가능합니다.";
				//한줄 띄어서 작성하고 싶어요.... 왜 안되는거죠?
				message.style.color = "red";
			}
		}


		//사업자 본인 전화번호 유효성 검사
		function validatePhone1(){
			let phoneInput = document.getElementById("client_phone1");
			let client_phone1 = phoneInput.value;
			let message = document.getElementById("phone1ValidationError");

			let phoneRegex = /^(?=.*[ㄴ/d]).{11}$/;

			if(phoneRegex.test(client_phone1)){
				message.innerHTML = "전화번호를 확인했습니다.";
				message.style.color = "green";
			}else{
				message.innerHTML = "사업자 전화번호 형식이 적합하지 않습니다.";
				message.style.color = "red";
			}
		}


		//사업장 전화번호 유효성 검사
		function validatePhone2(){
			let phoneInput = document.getElementById("client_phone2");
			let client_phone2 = phoneInput.value;
			let message = document.getElementById("phone2ValidationError");

			let phoneRegex = /^(?=.*[/d]).{11}$/;

			if(phoneRegex.test(client_phone2)){
				message.innerHTML = "사업장 전화번호를 확인했습니다.";
				message.style.color = "green";
			}else{
				message.innerHTML = "사업장 전화번호 형식이 적합하지 않습니다.";
				message.style.color = "red";
			}
		}


		<!-- 우편번호 API -->
		$(function(){
			$('#postcodify_search_button').postcodifyPopUp();
		});

		$(function execute(){
		});

	</script>


</head>

<body>

<h1 align="center"><a href="main.do">Cookology</a></h1>

<hr>

<form action="" method="post" onsubmit="return validate();">

	<label><b>프로필 사진</b></label><br><br><br>
	<!-- 일단 모르겠으니 프로필은 건너뜁니다 -->


	<label><b>사업자등록번호</b></label><br>
	<input type="text" name="client_id" id="client_id" maxlength="15" size="27" required><br><br><br>



	<label><b>비밀번호</b></label><br>
	<sup>비밀번호 구성조건 작성할 예정</sup><br>
	<input type="password" name="client_pwd1" id="client_pwd1" maxlength="14" size="27" onkeyup="validatePwd()" required>
	<sup><p id="pwdValidationError"></p></sup><br><br>


	<label><b>비밀번호 재확인</b></label><br>
	<input type="password" name="client_pwd2" id="client_pwd2" maxlength="14" size="27" onkeyup="checkPassword()" required>
	<sup><p id="passwordError"></p></sup><br><br>



	<label><b>사업자 이름</b></label><br>
	<input type="text" name="client_name" id="client_name" maxlength="10" size="27" onkeyup="validateName()" required><br>
	<sup><p id="nameValidationError"></p></sup><br><br>


	<label><b>사업자 전화번호</b></label><br>
	<input type="text" name="client_phone" id="client_phone1" maxlength="11" size="27" onkeyup="validatePhone1()" placeholder="- 빼고 숫자만 입력"><br>
	<sup><p id="phone1ValidationError"></p></sup><br><br>


	<lable><b>사업장 전화번호</b></lable><br>
	<input type="text" name="client_phone" id="client_phone2" maxlength="11" size="27" onkeyup="validatePhone2()" placeholder="- 빼고 숫자만 입력"><br>
	<sup><p id="phone2ValidationError"></p></sup><br><br>


	<!-- API 사용 -->
	<label><b>사업장 우편번호</b></label><br>
	<input type="text" name="client_post" class="postcodify_postcode5" maxlength="6" size="27" required>
	<button type="button" id="postcodify_search_button">검색</button><br><br>



	<label><b>사업소제지</b></label><br>
	<input type="text" name="client_address1" class="postcodify_address" maxlength="40" size="40" placeholder="도로명 주소" required><br>
	<input type="text" name="client_address2" class="postcodify_extra_info" maxlength="20" size="40" placeholder="상세주소" required><br><br><br>



	<input type="submit" value="회원가입 완료" size="20"><br>
	<input type="submit" value="홈페이지로 돌아가기" size="20">
</form>
</body>

</html>