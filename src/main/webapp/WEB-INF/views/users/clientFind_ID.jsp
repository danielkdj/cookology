<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>가맹점주 ID/PWD 찾기</title>
    <!--로그인 페이지에만 연결하는 걸로 나중에 수정하기-->

    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
    <script type="text/javascript">

        function client_find_ID_Btb(){
            var search_id = document.ID_search;
            let nameInput = document.getElementById("user_name");
            let phoneInput = document.getElementById("user_phone");
            let message = document.getElementById("checkError");

            if(!(nameInput.value.lenght < 3 && nameInput.value.lenght > 30)){
                message.innerHTML = "이름의 너무 길거나 짧게 작성되었습니다."
                message.style.color = "red";
                return;
            }

            if(phoneInput.value.lenght !== 11){
                message.innerHTML = "전화번호 형식이 올바르지 않습니다."
                message.style.color = "red";
                return;
            }

            search_id.method = "post";
            search_id.action = "#"; //이동할 페이지 이름
            search_id.submit();

        }



        function checkPassword(){
            let user_password = document.getElementById("user_password");
            let user_password2 = document.getElementById("user_password2");

            if(user_password !== user_password2){
                document.getElementById("passwordError").innerHTML = "이미 사용중인 ID입니다.";
                passwordError.style.color = "red";
            }else{
                document.getElementById("passwordError").innerHTML = "사용가능한 ID입니다.";
                passwordError.style.color = "green";
            }


    </script>



</head>
<body>


<h3>사용자 아이디/비밀번호 찾기</h3>




<form name="ID_search" method="post">
    <h3>ID 조회하기</h3>
    <section id="id_search">
        <label>이름</label>
        <input type="text" name="user_name" placeholder="본인이름"><br>

        <label>전화번호</label>
        <input type="text" name="user_phone" placeholder="전화번호 숫자만 '-'없이 입력">
        <button type="submit" onclick="client_find_ID_Btb();">ID 찾기</button>
    </section>
</form>
<br>
<hr>
<br>


<form name="PWD_search1" method="post">
    <h3>전화번호로 PWD 조회하기</h3>
    <section id="pwd_search1">
        <label>이름</label>
        <input type="text" name="user_name" placeholder="본인이름"><br>

        <label>전화번호</label>
        <input type="text" name="user_password" placeholder="본인 비밀번호">
        <button type="submit" onclick="users_find_PWD_Btb1();">PWD 찾기</button>
    </section>
</form>
<br>
<hr>
<br>


<form name="PWD_search2" method="post">
    <h3>이메일로 PWD 조회하기</h3>
    <section id="pwd_search2">
        <label>이름</label>
        <input type="text" name="user_name" placeholder="본인이름"><br>

        <label>메일(Mail)</label>
        <input type="text" name="user_email" placeholder="">
        <button type="submit" onclick="users_find_PWD_Btb2();">PWD 찾기</button>
    </section>
</form>
<br>

<button onclick="javascript:history.go(-1); return false;" class="my_btn" >홈페이지로 돌아가기</button>



</body>
</html>
