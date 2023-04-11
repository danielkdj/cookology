<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>사용자 PWD 찾기</title>

    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
    <script type="text/javascript">

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



    </script>

    <style>
        .my-box1{
            width: 1000px;
            height: 700px;
            margin: 0 auto;
            margin-top: 150px;
            border: 1px solid black;
        }

        .my-box2{
            width: 450px;
            height: 550px;
            margin: 0 auto;
            margin-top: 70px;
        }

        .users{
            width: 450px;
            height: 40px;
            float: left;
            margin: 0 auto;
            border: 1px solid black;
        }

        .mail_input{
            width: 450px;
            height: 40px;
            float: left;
            margin: 0 auto;
            border: 1px solid black;
        }

        .mail_check_input{
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

        <h1>PWD 재설정하기</h1>
        <br>

        <p>입력정보를 통해 PWD를 찾을 수 있습니다 .</p>
        <h6>전화번호 입력 시 공백 또는 '-' 없이 입력해주세요</h6>

        <form action="userFind_PWD.do" method="post">
            <div class="join_e">
                <div class="join_item">이메일</div>
                <div class="mail_api">
                    <div class="mail_input_box">
                        <input class="mail_input" name="users_email" placeholder="이메일"> &nbsp; &nbsp;
                    </div>
                    <div class="mail_check_wrop">
                        <div class="mail_check_input_box">
                            <input class="mail_check_input" placeholder="인증번호" onfocus="this.value=null" /> &nbsp; &nbsp;
                        </div>
                            <input type="button" class="mail_check_button"  value="인증번호전송">
                            <input type="button" value="인증번호확인" onclick="emailck(); return false;" />
                        <br><br>
                    </div>
                </div>
            </div>
            <br>
            <input type="text" class="users" name="users_name" placeholder="이름" autofocus><br><br>
            <input type="text" class="users" name="users_phone2" placeholder="전화번호" ><br><br><br>
            <div class="my-box3">
                <input type="submit" value="PWD 찾기">
                <button onclick="window.location.href='main.do'">홈페이지로 돌아가기</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>