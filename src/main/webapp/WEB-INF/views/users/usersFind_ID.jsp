<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>사용자 ID 찾기</title>
    <!--로그인 페이지에만 연결하는 걸로 나중에 수정하기-->

    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

    <style>
        .my-box1{
            width: 1000px;
            height: 600px;
            margin: 0 auto;
            margin-top: 150px;
            border: 1px solid black;
        }

        #span1{
            color: green;
        }

        .my-box2{
            width: 450px;
            height: 550px;
            margin: 0 auto;
            margin-top: 70px;
        }

        .my-box3{
        }

        .user{
            width: 450px;
            height: 40px;
            float: left;
            margin: 0 auto;
            border: 1px solid black;
        }
    </style>
</head>
<body>


<div class="my-box1">
    <div class="my-box2">

        <h1>ID 조회하기</h1>
        <br>

        <span id="span1">
        <c:if test="${!empty user_email}">
            <h3>사용자의 ID는 ${user_email}입니다.</h3>
        </c:if>
        </span>
        <br>

        <p>입력정보를 통해 ID를 찾을 수 있습니다 .</p>
        <h5>전화번호 입력 시 공백 또는 '-' 없이 입력해주세요</h5>

        <form action="userFind_ID.do" method="post">
            <input type="text" class="user" name="user_name" placeholder="이름"  autofocus><br><br>
            <input type="text" class="user" name="user_phone" placeholder="전화번호" ><br><br><br>

            <div class="my-box3">
                <input type="submit" value="ID 찾기">
                <button onclick="window.location.href='main.do'">홈페이지로 돌아가기</button>
            </div>
        </form>
    </div>
</div>

<button onclick="window.location.href='userFind_PWD.do'">PWD 찾기</button>

</body>
</html>