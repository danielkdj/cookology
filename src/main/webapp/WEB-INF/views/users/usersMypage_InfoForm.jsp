<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <meta charset="UTF-8">
    <title>Cookcology Mypage</title>

    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
    <script type="text/javascript">


    </script>


    <style>
        .Box1{
            width: 550px;
            margin : 0 auto;
            border: 1px solid black;
        }

        .InfoForm_title{
            padding: 10px;
            padding-left: 45px;
            font-size: 30px;
        }

        .mail_input{
            width: 280px;
            height: 30px;
            font-size: 14px;
            float: left;
            margin: 0 auto;
            padding-left: 10px;
            border: 1px solid black;
        }

        .users{
            width: 280px;
            height: 30px;
            font-size: 14px;
            float: left;
            margin: 0 auto;
            padding-left: 10px;
            border: 1px solid black;
        }

        .postcodify_postcode5{
            width: 280px;
            height: 30px;
            font-size: 14px;
            float: left;
            margin: 0 auto;
            padding-left: 10px;
            border: 1px solid black;
        }

        .postcodify_address{
            width: 280px;
            height: 30px;
            font-size: 14px;
            float: left;
            margin: 0 auto;
            padding-left: 10px;
            border: 1px solid black;
        }

        .postcodify_extra_info{
            width: 280px;
            height: 30px;
            font-size: 14px;
            float: left;
            margin: 0 auto;
            padding-left: 10px;
            border: 1px solid black;
        }


        .my_btn{
            background-color: orange;
            font-size: 17px;
            color: black;
            width: 240px;
            height: 50px;
        }
    </style>

</head>



<body>



    <table align="center" cellspacing="17"  border="1" width="1000" >

        <td width="300">
            <h2 class="InfoForm_title">개인정보 수정</h2>

            <hr>
            <table align="center" cellspacing="8" >
                <tr>
                    <th>
                        <c:url var="usersMypage_Info" value="/uMypage_InfoForm.do">
                            <c:param name="user_email" value="${loginUsers.user_email}"/>
                        </c:url>
                        <button class="my_btn">
                            <a href="${usersMypage_Info}">개인정보 수정</a>
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
                        <button class="my_btn" onclick="javascript:location.href='uMypage_DeleteForm.do';"> 탈퇴하기</button>
                    </th>
                </tr>
            </table>
        </td>


        <td>
            <form action="usersMypage_InfoForm.do", method="post">
                <div class="Box1">
                    <div id="table2">
                        <table  align="center" style="cellpadding:5px; border:1px;">
                            <tr>
                                <th>
                                    <h3>Mail(ID)</h3>
                                </th>
                                <td>
                                    <input class="mail_input" value="${requestScope.users.user_email}" readonly>
                                </td>
                            </tr>

                            <tr>
                                <th>
                                    <h3>비밀번호</h3>
                                </th>
                                <td>
                                    <input class="users" type="password" name="user_password" id="user_password" maxlength="14" size="27" onfocusout="validatePwd()" required>
                                    <sub><span id="pwdValidationError"></span></sub>
                                </td>
                            </tr>

                            <tr>
                                <th>
                                    <h3>재입력</h3>
                                </th>
                                <td>
                                    <input class="users" type="password" id="user_password2" maxlength="14" size="27" onfocusout="checkPassword()" required>
                                    <sub><span id="passwordError"></span></sub>
                                </td>
                            </tr>

                            <tr>
                                <th>
                                    <h3>이름</h3>
                                </th>
                                <td>
                                    <input class="users" value="${requestScope.users.user_name}" readonly>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <h3>전화번호</h3>
                                </th>
                                <td>
                                    <input class="users" value="${requestScope.users.user_phone}" readonly>
                                </td>
                            </tr>

                            <tr>
                                <th>
                                    <h3>우편번호</h3>
                                </th>
                                <th>
                                    <button type="button" id="postcodify_search_button">검색</button>
                                    <input type="text" name="user_post_code" class="postcodify_postcode5" maxlength="6" required>
                                </th>
                            </tr>

                            <tr>
                                <th>
                                    <h3>주소</h3>
                                </th>
                                <td>
                                    <input type="text" name="user_address1" class="postcodify_address" maxlength="40" size="40" value="${requestScope.users.user_address1}"  required>
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <input type="text" name="user_address2" class="postcodify_extra_info" maxlength="20" size="40" value="${requestScope.users.user_address2}" required>
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <br><br><br>

                                    <button type="submit" onclick="users_Mypage_Update_Btn();">개인정보 수정하기</button> &nbsp;
                                    <button><a href="${pageContext.servletContext.contextPath}/main.do">홈페이지로 돌아가기</a></button>
                                </td>
                            </tr>
                        </table>
                        <br><br><br>
                    </div>
                </div>
            </form>
        </td>
    </table>


</body>
</html>

