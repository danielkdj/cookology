<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script
            src="https://code.jquery.com/jquery-3.6.4.js"
            integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
            crossorigin="anonymous"></script>
    <title>Insert</title>

    <script>
        window.onload = function() {
            // 최대 창 너비
            let maxWidth = 500;
            let maxheight  = 800;
            // let currentHeight = window.innerHeight;
            window.addEventListener("resize", () => { if (window.innerWidth != maxWidth) window.resizeTo(maxWidth, maxheight);});
        }


    </script>

    <%--button--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" crossorigin="anonymous"/>
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/event/event-button.css"/>

    <style>
        body{
            overflow-x: hidden;
        }
        .event-button {
            margin-top: 10px;
            display: block;
            margin-left: auto;
            margin-right: auto;
            color: white;
        }

        input[type='date'],
        input[type='number'],
        input[type='text'],
        textarea
        {
            display: block;
            margin-top: 5px;
            margin-bottom: 5px;
            width: 70%;
            padding: 5px;
            border-radius: 5px;
            border: none;
            box-shadow: 1px 1px 5px gray;
            margin-left: auto;
            margin-right: auto;
        }

        input[type='color']
        {
            display: block;
            margin-top: 5px;
            margin-bottom: 5px;
            width: 70%;
            padding: 5px;
            border-radius: 5px;
            border: none;
            box-shadow: 1px 1px 5px gray;
        }
        textarea {
            height: 100px;
        }

    </style>

</head>
<body>
<script type="text/javascript">
    $(function () {
        console.log($('#addCalendarForm').serialize());
        $('#addCalendarButton').on('click', () => {
            const form = $('form').serializeArray();
            $.ajax({
                url:"addCalenderEvent.do",
                type : "post",
                data: form,
                success:(result) => {
                    console.log(result.status);
                    // if(result.status=="200"){
                        window.close();
                    // } else {
                    //     alert("error!");
                    // }
                },
                error: function(request, status, errorData){
                    console.log("error code : " + request.status
                        + "\nMessage : " + request.responseText
                        + "\nError : " + errorData);
                    alert("error!다시 입력");
                }
            })
        })
    })
</script>
    <form method="post" id="addCalendarForm">
        <table align="center" width="500" border="1" cellspacing="0"
               cellpadding="5">
            <tr>
                <td>시작일</td>
                <td><input type="date" id="start" name="start"></td>
            </tr>
            <tr>
                <td>종료일</td>
                <td><input type="date" id="end" name="end"></td>
            </tr>
            <tr>
                <td>제목</td>
                <td><input type="text" id="title" name="title"></td>
            </tr>
            <tr>
                <td>URL</td>
                <td><input type="text" id="url" name="url"></td>
            </tr>
            <tr>
                <td>배경색</td>
                <td><input type="color" id="backgroundcolor" name="backgroundcolor" value="#fc6c3f"></td>
            </tr>
            <tr>
                <td>설명</td>
                <td><textarea id="description" name="description"></textarea></td>
            </tr>
            <tr>
                <td>내용</td>
                <td><textarea id="content" name="content"></textarea></td>
            </tr>
            <tr>
                <td>경도</td>
<%--                <td><input type="text" id="w" name="lo" required></td>--%>
            </tr>
            <tr>
                <td>위도</td>
<%--                <td><input type="text" id="r" name="lo" required></td>--%>
            </tr>
        </table>

    </form>



<%--        <input type="submit" value="추가" class="event-button" onclick="submitForm();">--%>
<button type="button" class="event-button" id="addCalendarButton">
    <i class="fas fa-paper-plane"></i> 추가
</button>
</body>
</html>
