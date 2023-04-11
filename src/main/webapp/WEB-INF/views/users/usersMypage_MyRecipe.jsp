<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>users MY페이지 기본(개인정보 수정)</title>

    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
    <script type="text/javascript">


    </script>


    <style>
        .users_Mypage_Btn{
            background-color: gainsboro;
            color: black;
            width: 230px;
            height: 50px;
        }




        .search_box{
            width: 420px;
            height: 30px;
        }


        .box{
            align: center;
            width: 420px;
            height: 100px;
            background-color: white;
            border: 1px solid black;
        }

    </style>

</head>



<body>
<form action="usersMypage_MyRecipe.do", method="post">
    <table align="center" cellspacing="17" cellpadding="0" border="1" >
        <tr><h2>개인정보 수정</h2></tr>





        <td width="500">
            <table  align="center" cellpadding="5" >
               <!-- 스크롤바 부분은 작성안함(넘어감) -->
                <tr><th><input type="search" class="search_box"></th></tr>
                <tr><th><div class="box"></div></th></tr>
                <tr><th><div class="box"></div></th></tr>
            </table>


        </td>
    </table>
</form>

</body>
</html>