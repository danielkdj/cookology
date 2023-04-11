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


<form action="usersMypage_InfoForm.do", method="post">
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


        <td>
            <div id="table2">
                <table  align="center" style="cellpadding:5px; border:1px;">
                    <tr>
                        <th>이름</th>
                        <td><input type="text" value="${requestScope.users.user_name}" readonly></td>
                    </tr>
                    <tr>
                        <th></th>
                        <td></td>
                    </tr>

                    <tr>
                        <th>이메일(ID)</th>
                        <td><input type="text" value="${requestScope.users.user_email}" readonly></td>
                    </tr>

                    <tr>
                        <th></th>
                        <td></td>
                    </tr>

                    <tr>
                        <th>비밀번호</th>
                        <td><input type="password" name="user_pwd1" id="user_pwd1"></td>
                    </tr>
                    <tr>
                        <th>비밀번호 재확인</th>
                        <td><input type="password" name="user_pwd2" id="user_pwd2"></td>
                        <td><input type="button"></td>
                    </tr>

                    <tr>
                        <th>우편번호</th>
                        <td>
                            <input type="text" name="user_post_code" class="postcodify_postcode5" maxlength="6" value="${requestScope.users.user_post_code}" required>
                            <button type="button" id="postcodify_search_button">검색</button>
                        </td>
                    </tr>
                    <tr>
                        <th>기본주소</th>
                        <td><input type="text" name="user_address1"  value="${requestScope.users.user_address1}"></td>
                    </tr>
                    <tr>
                        <th>상세주소</th>
                        <td><input type="text" name="user_address2"  value="${requestScope.users.user_address2}"></td>
                    </tr>

                    <tr>
                        <th>
                            <button type="submit" onclick="users_Mypage_Update_Btn();">개인정보 수정하기</button> &nbsp;
                            <button><a href="${pageContext.servletContext.contextPath}/main.do">홈페이지로 돌아가기</a></button>
                        </th>
                    </tr>
                </table>
            </div>
        </td>
    </table>
</form>

</body>
</html>

