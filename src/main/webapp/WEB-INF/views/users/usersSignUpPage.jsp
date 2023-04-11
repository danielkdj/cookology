<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>user 회원가입 페이지</title>


	<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script type="text/javascript">

		//이메일 중복 검사
		function dupCheckId(){
			$.ajax({
				url: "uIdCheck.do",
				type: "post",
				data: {user_email: $('#user_email').val()},
				success: function (result){
					if(result === "ok"){
						document.getElementById("idValidationError").innerHTML = "사용가능한 ID입니다.";
						idValidationError.style.color = "green";
					}else{
						document.getElementById("idValidationError").innerHTML = "사용중인 ID입니다.";
						idValidationError.style.color = "red";
					}
				}
			});
			return false;
		}


		// 이메일인증
		var code;

		$(function(){
			$(".mail_check_button").click(function(){
				alert("인증번호 발송되었습니다.\n메일에서 인증번호를 확인해주세요.");

				var email = $(".mail_input").val();          // 입력한 이메일
				var cehckBox = $(".mail_check_input");        // 인증번호 입력란
				var boxWrap = $(".mail_check_input_box");

				alert("이메일확인 : " + email);
				$.ajax({
					type:"GET",
					url:"mailCheck1.do?email=" + email,
					data:{users_email:email},
					success:function(data){
						cehckBox.attr("disabled",false);
						boxWrap.attr("id", "mail_check_input_box_true");
						code = data;
					}
				});
			});
		}); //document.ready

		//이메일인증번호 확인
		function emailck(){
			var inputCode = $(".mail_check_input").val();   // 입력코드

			if((code != null) && (inputCode == code)){
				alert("인증번호가 일치합니다.");
				return true;
			} else {
				alert("인증번호를 다시 확인해주세요2. ");
				return false;
			}
		}


		//비밀번호 유효성 검사
		function validatePwd() {
			let pwdInput = document.getElementById("user_password");
			let user_password = pwdInput.value;
			let message = document.getElementById("pwdValidationError");

			let pwdRegex = /^(?=.*[a-zA-Z].*[a-zA-Z].*[a-zA-Z].*[a-zA-Z])(?=.*\d.*\d)(?=.*[\W_]).{7,}$/

			if(pwdRegex.test(user_password)){
				message.innerHTML = " 사용가능한 비밀번호입니다.";
				message.style.color = "green";
			}else{
				message.innerHTML = " 사용불가능한 비밀번호입니다.";
				message.style.color = "red";
			}
		}


		//비밀번호 재확인(중복검사)
		function checkPassword(){
			let user_password = document.getElementById("user_password").value;
			let user_password2 = document.getElementById("user_password2").value;

			if(!(user_password === user_password2)){
				document.getElementById("passwordError").innerHTML = "비밀번호가 일치하지 않습니다.";
				passwordError.style.color = "red";
			}else{
				document.getElementById("passwordError").innerHTML = "입력하신 비밀번호를 확인했습니다.";
				passwordError.style.color = "green";
			}
		}


		//이름 유효성 검사
		function validateName(){
			let nameInput = document.getElementById("user_name");
			let user_name = nameInput.value;
			let message = document.getElementById("nameValidationError");

			let nameRegex = /^(?=.*[가-힣a-zA-Z]).{3,30}$/;

			if(nameRegex.test(user_name)){
				message.innerHTML = "이름을 확인했습니다.";
				message.style.color = "green";
			}else{
				message.innerHTML = "한글, 영어(대, 소문자)를 조합해 3~30글자까지만 작성가능합니다.";
				message.style.color = "red";
			}
		}


		//전화번호 유효성 검사
		function validatePhone(){
			let phoneInput = document.getElementById("user_phone");
			let user_phone = phoneInput.value;
			let message = document.getElementById("phoneValidationError");

			let phoneRegex = /^\d{11}$/;

			if(phoneRegex.test(user_phone)){
				message.innerHTML = "전화번호를 확인했습니다.";
				message.style.color = "green";
			}else{
				message.innerHTML = "전화번호 형식에 적합하지 않습니다";
				message.style.color = "red";
			}
		}


		//우편번호 API
		$(function(){
			$('#postcodify_search_button').postcodifyPopUp();
		});

		$(function execute(){
		});


		//회원가입 버튼
		function users_SignUp_Btn(){
			$('#usersSignUp').submit();
		}
	</script>


	<style>

		.my_btn{
			background-color: gainsboro;
			color: black;
			border: none;
			width: 150px;
			height: 30px;
		}

		fieldset{
			width: 500px;
			padding: 30px;
			padding-bottom: 30px;
			padding-right: 30px;
			padding-left: 30px;
		}


	</style>

</head>

<body>

<h1 align="center"><a href="main.do">Cookology</a></h1>

<hr>

<form action="usersSignUp.do" method="post" id="usersSignUp">


	<label><h3>Mail(ID)</h3></label>
	<input type="text" name="user_email" id="user_email" size="30" onkeyup="dupCheckId()" required>
<!--	<input type="button" id="check_Email_Btn" value="인증번호 전송"><br>-->
	<sub><span id="idValidationError"></span></sub><br>


	<input type="text" size="27" placeholder="인증번호 입력란" required>
	<button onclick="message()">Check me!</button><br><br><br>

	<label><h3>비밀번호</h3></label>
	<p>
		비밀번호 구성방법<br>
		영어 대,소문자 5개 이상<br>
		숫자 2개, 특수문자 1개 이상 작성해주세요.
	</p>
	<input type="password" name="user_password" id="user_password" maxlength="14" size="27" onkeyup="validatePwd()" required>
	<sub><span id="pwdValidationError"></span></sub>


	<label><h3>비밀번호 재확인</h3></label>
	<input type="password" id="user_password2" maxlength="14" size="27" onfocusout="checkPassword()" required>
	<sub><span id="passwordError"></span></sub>


	<label><h3>이름</h3></label>
	<input type="text" name="user_name" id="user_name" maxlength="10" size="27" onkeyup="validateName()" required><br>
	<sup><span id="nameValidationError"></span></sup><br><br>


	<label><h3>전화번호</h3></label>
	<input type="text" name="user_phone" id="user_phone" maxlength="11" size="27" onkeyup="validatePhone()" placeholder="- 빼고 숫자만 입력"><br>
	<sup><span id="phoneValidationError"></span></sup><br><br>

	<!-- API 사용 -->
	<label><h3>우편번호</h3></label>
	<input type="text" name="user_post_code" class="postcodify_postcode5" maxlength="6" required>
	<button type="button" id="postcodify_search_button">검색</button><br><br>


	<label><h3>주소</h3></label>
	<input type="text" name="user_address1" class="postcodify_address" maxlength="40" size="40" placeholder="도로명 주소" required><br>
	<input type="text" name="user_address2" class="postcodify_extra_info" maxlength="20" size="40" placeholder="상세주소" required>


	<label><h3>알러지 정보</h3></label>
	<fieldset>
		<input type="checkbox" name="user_allergy" value="10">난류 &nbsp;
		<input type="checkbox" name="user_allergy" value="20">우유, 유제품 &nbsp;
		<input type="checkbox" name="user_allergy" value="30">땅콩 &nbsp;
		<input type="checkbox" name="user_allergy" value="40">견과류 &nbsp;
		<input type="checkbox" name="user_allergy" value="50">밀 &nbsp;
		<input type="checkbox" name="user_allergy" value="60">참깨<br><br>
		<input type="checkbox" name="user_allergy" value="70">콩(대두) &nbsp;
		<input type="checkbox" name="user_allergy" value="80">과일 및 채소 &nbsp;
		<input type="checkbox" name="user_allergy" value="90">해산물 및 조개류 &nbsp;
		<input type="checkbox" name="user_allergy" value="100">육류
	</fieldset><br><br><br>

	<button type="submit" onclick="users_SignUp_Btn();" class="my_btn" >회원가입 완료</button> &nbsp;
	<button onclick="javascript:history.go(-1); return false;" class="my_btn" >홈페이지로 돌아가기</button>

</form>
</body>
</html>