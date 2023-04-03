<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>user 회원가입 페이지</title>

	<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script type="text/javascript">

		//아이디는 controller에서 유효성 검사해야함
		//비밀번호 유효성 검사
		// function validatePwd() {

			let pwdInput = document.getElementById("user_pwd1");
			// let user_Pwd1 = pwdInput.value;
			// let message = document.getElementById("pwdValidationError");

			// let pwdRegex = /^(?=.*[a-zA-Z].*[a-zA-Z].*[a-zA-Z].*[a-zA-Z].*[a-zA-Z])(?=.*\d.*\d)(?=.*[\W_]).{10,}$/;

			// if(pwdRegex.test(user_Pwd1)){
			// 	message.innerHTML = " 사용가능한 비밀번호입니다.";
			// 	message.style.color = "green";
			// }else{
			// 	message.innerHTML = " 사용불가능한 비밀번호입니다.";
			// 	message.style.color = "red";
			// }
		}

		//비밀번호 재확인
		function checkPassword(){
			let user_Pwd1 = document.getElementById("user_pwd1").value;
			let user_Pwd2 = document.getElementById("user_pwd2").value;

			if(user_Pwd1 !== user_Pwd2){
				document.getElementById("passwordError").innerHTML = "비밀번호가 일치하지 않습니다.";
				passwordError.style.color = "red";
			}else{
				document.getElementById("passwordError").innerHTML = "비밀번호 확인에 성공했습니다.";
				passwordError.style.color = "green";
			}
		}

		//이름, 전화번호, 우편번호 유효성검사
		function validate(){
			let userPhoneTag = document.getElementById("user_phone");
			let userPostcodeTag = document.getElementById("postcodify_postcode5");


			//전화번호 유효성검사
			if(!check(/^010.(?=.*\d).{4}.(?=.*\d).{4}$/, userPhoneTag, "전화번호를 올바르게 입력해주세요.")){
				return flase;
			}

			//우편번호 유효성검사
			if(!check(/^[\d]{5}&/, userPostcodeTag)){
				return flase;
			}

			return flase;
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

<form action="enroll.do" method="post" onsubmit="return validate();">

	<label><b>프로필 사진</b></label><br><br><br>
	<!-- 일단 모르겠으니 프로필은 건너뜁니다 -->


	<label><b>Mail(ID)</b></label><br>
	<input type="text" name="user_id" id="user_id" maxlength="15" size="10" required>
	<label><b> @ </b></label>
	<select name="mail.com">
		<option value='선택'>----선택----</option>
		<option value='daum'>daum.com</option>
		<option value='google'>gmail.com</option>
		<option value='nate'>nate.com</option>
		<option value='outlook'>outlook.com</option>
		<option value='naver'>naver.com</option>
		<option value='yahoo'>yahoo.com</option>
	</select>
	<input type="button" value="인증번호 전송"><br>
	<input type="text" size="27" placeholder="인증번호 입력란">
	<button onclick="message()">Check me!</button><br><br><br>


	<label><b>비밀번호</b></label><br>
	<sup>비밀번호 구성조건 작성할 예정</sup><br>
	<input type="password" name="user_password" id="user_pwd1" maxlength="14" size="27" <%--onkeyup="validatePwd()"--%> required>
	<sup><p id="pwdValidationError"></p></sup><br><br>


	<label><b>비밀번호 재확인</b></label><br>
	<input type="password" id="user_pwd2" maxlength="14" size="27" onkeyup="checkPassword()" required>
	<sup><p id="passwordError"></p></sup><br><br>


	<label><b>이름</b></label><br>
	<input type="text" name="user_name" id="user_name" maxlength="10" size="27" required><br><br><br>


	<label><b>전화번호</b></label><br>
	<input type="text" name="user_phone" id="user_phone" maxlength="11" size="27" placeholder="- 빼고 숫자만 입력"><br><br><br>


	<!-- API 사용 -->
	<label><b>우편번호</b></label><br>
	<input type="text" name="user_post" class="postcodify_postcode5" maxlength="6" size="27" required>
	<button type="button" id="postcodify_search_button">검색</button><br><br>


	<label><b>주소</b></label><br>
	<input type="text" name="user_address1" class="postcodify_address" maxlength="40" size="40" placeholder="도로명 주소" required><br>
	<input type="text" name="user_address2" class="postcodify_extra_info" maxlength="20" size="40" placeholder="상세주소" required><br><br><br>


	<label><b>알러지 정보</b></label><br>
	<fieldset>
		<label><input type="checkbox" name="user_allergy" value="10">난류</label>
		<label><input type="checkbox" name="user_allergy" value="9">우유, 유제품</label>
		<label><input type="checkbox" name="user_allergy" value="8">땅콩</label>
		<label><input type="checkbox" name="user_allergy" value="7">견과류</label><br><br>
		<label><input type="checkbox" name="user_allergy" value="6">밀</label>
		<label><input type="checkbox" name="user_allergy" value="5">참깨</label>
		<label><input type="checkbox" name="user_allergy" value="4">콩(대두)</label>
		<label><input type="checkbox" name="user_allergy" value="3">과일 및 채소</label><br><br>
		<label><input type="checkbox" name="user_allergy" value="2">해산물 및 조개류</label>
		<label><input type="checkbox" name="user_allergy" value="1">육류</label>
	</fieldset><br><br><br>


	<input type="submit" value="회원가입 완료" size="20"><br>
	<input type="submit" value="홈페이지로 돌아가기" size="20">
</form>
</body>

</html>