<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Cookcology delete</title>

    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
    <script type="text/javascript">





    </script>

    <style>
        .Box1{
            width: 500px;
            margin : 0 auto;
        }

        .users{
            width: 480px;
            height: 40px;
            font-size: 16px;
            float: left;
            margin: 0 auto;
            padding-left: 10px;
        }

        .my_btn1{
            width: 90px;
            height: 30px;
            font-size: 13px;
        }

        .my_btn2{
            width: 170px;
            height: 30px;
            font-size: 13px;
        }
    </style>
</head>



<body>
<div class="Box1">
    <table  align="center" style="cellpadding:5px; border:1px;">

        <h2>탈퇴하기</h2>

        <form action="usersMypage_DeleteForm.do" method="post">
            <div class="my-box1">

            <h3>회원탈퇴를 진행하려면 본인의 ID/PWD를 입력해주세요</h3>
            <br><br>

                <h3>Mail(ID)</h3>
                <input type="text" class="users" name="user_email" id="user_email" placeholder="ID" autofocus>
                <br><br><br><br>

                <h3>이름</h3>
                <input type="text" class="users" name="user_name" id="user_name" placeholder="이름" >
                <br><br><br><br>

                <h3>전화번호</h3>
                <input type="text" class="users" name="user_phone" id="user_phone" placeholder="전화번호" >
                <br><br><br><br>


                <button class="my_btn1" type="submit" onclick="users_Delete_Btb();">탈퇴하기</button>
                <button class="my_btn2"><a href="${pageContext.servletContext.contextPath}/main.do">홈페이지로 돌아가기</a></button>
            </div>
        </form>
    </table>
</div>

</body>
</html>

