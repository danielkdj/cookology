<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Cookcology Mypage</title>

    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
    <script type="text/javascript">


    </script>


    <style>
        .my_btn{
            background-color: gainsboro;
            color: black;
            width: 240px;
            height: 50px;
        }
    </style>

</head>



<body>



    <table align="center" cellspacing="17" cellpadding="0" border="1" >
        <tr><h2>개인정보 수정</h2></tr>


        <td width="300">
            <table align="center" cellspacing="" cellpadding="0" border="0">
                <th>변경할 사진공간</th>
                <th>OO님</th>
                <tr>
                    <th>프로필 사진</th>
                    <th><button>사진변경</button><br>
                        <button>사진삭제</button>
                    </th>
                </tr>
            </table>


            <hr>

            <table align="center" cellspacing="8" >
                <tr>
                    <th>
                        <c:url var="userMypage_Info" value="uMypage.do">
                            <c:param name="user_email" value="${loginUsers.user_email}"/>
                        </c:url>
                        <button class="my_btn">
                            <a href="${userMypage_Info}">개인정보 수정</a>
                        </button>
                    </th>
                </tr>
                <tr>
                    <th>
                        <button class="my_btn" onclick="javascript:location.href='#';"> 레시피 조회</button>
                    </th>
                </tr>
                <tr>
                    <th>
                        <button class="my_btn" onclick="javascript:location.href='#';"> 주문정보 조회</button>
                    </th>
                </tr>
                <tr>
                    <th>
                        <button class="my_btn" onclick="javascript:location.href='uDeleteForm.do';"> 탈퇴하기</button>
                    </th>
                </tr>
            </table>
        </td>


        <table  align="center" style="cellpadding:5px; border:1px;">
            <form action="usersMypage_DeleteForm.do" method="post">
                    <div class="my-box1">


                        <p>회원탈퇴를 하기 위해서는 본인의 ID/PWD를 입력해주세요</p>


                            <input type="text" class="user" name="user_name" placeholder="ID" required autofocus><br><br>
                            <input type="text" class="user" name="user_phone" placeholder="PWD" required><br><br><br>

                            <div class="my-box3">
                                <button type="submit" onclick="users_Delete_Btb();">탈퇴하기</button>
                                <button onclick="window.location.href='main.do'">홈페이지로 돌아가기</button>
                            </div>

                    </div>
            </form>
        </table>
    </table>


</body>
</html>

