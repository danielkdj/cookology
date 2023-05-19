<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<!-- Favicon -->
<link rel="icon" href="/cookology/resources/img/core-img/Cookology_logo.png" />
<script src="js/active.js"></script>
<!-- 부트스트랩 JS -->
<script src="js/active.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper-cjs"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<html lang="ko">
<!-- Bootstrap CSS Brand Color -->
<style>
    #btn-brand {
        background-color: #FC6C3F;
        border-color: #FC6C3F;
        color: #FFFFFF;
    }

    #btn-brand:hover {
        background-color: #E95627;
        border-color: #E95627;
        color: #FFFFFF;
    }
    #btn-brand1 {
        background-color: #FC6C3F;
        border-color: #FC6C3F;
        color: #FFFFFF;
    }

    #btn-brand1:hover {
        background-color: #E95627;
        border-color: #E95627;
        color: #FFFFFF;
    }
    #btn-brand2 {
        background-color: #FC6C3F;
        border-color: #FC6C3F;
        color: #FFFFFF;
    }

    #btn-brand2:hover {
        background-color: #E95627;
        border-color: #E95627;
        color: #FFFFFF;
    }

    #btn-brand3 {
        background-color: #FC6C3F;
        border-color: #FC6C3F;
        color: #FFFFFF;
    }

    #btn-brand3:hover {
        background-color: #E95627;
        border-color: #E95627;
        color: #FFFFFF;
    }

    #btn-brand4 {
        background-color: #FC6C3F;
        border-color: #FC6C3F;
        color: #FFFFFF;
    }

    #btn-brand4:hover {
        background-color: #E95627;
        border-color: #E95627;
        color: #FFFFFF;
    }
</style>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 위의 4개의 메타 태그는 헤더에 *반드시* 와야 합니다. 다른 헤더 콘텐츠는 이 태그 *뒤에* 와야 합니다 -->
    <!-- method -->

    <!-- Title -->
    <title>Cookology - 레시피</title>
    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">
    <!-- Core Stylesheet -->
    <link href="/resources/css/style.css" rel="stylesheet">
    <!-- Responsive CSS -->
    <link href="/resources/css/responsive.css" rel="stylesheet">
</head>
</html>
<!-- header.jsp include -->
<c:import url="/WEB-INF/views/common/header.jsp" />
<body>
<!-- 스타일 속성을 적용하여 background-image webapp/resources/img/catagory-img/3.jpg 를 배경으로 한다. -->
<div class="breadcumb-area" style="background-image: url('${pageContext.servletContext.contextPath}/resources/img/catagory-img/3.jpg');">
    <div class="container h-100">
        <div class="row h-100 align-items-center">
            <div class="col-12">
                <div class="bradcumb-title text-center">
                    <h2>Recipe</h2>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- ****** PagePath Start ****** -->
<div class="breadcumb-nav">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav aria-label="breadcrumb">
                    <ol style="margin-bottom: 75px" class="breadcrumb">
                        <li class="breadcrumb-item"><a href="main.do"><i class="fa fa-home" aria-hidden="true"></i>Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page"><a href="rpage.do">recipe</a></li>
                        <li class="breadcrumb-item active" aria-current="page">recipe register</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>
<!-- ****** PagePath End ****** -->

<!-- ****** My Recipe Start ****** -->
<div class="container">
    <h1 style="margin-top:55px;">My Recipe</h1>
    <form action="recipe" method="post">
        <div class="form-group">
            <label for="title">Title</label>
            <input type="text" class="form-control" id="title" name="title" required>
        </div>
        <div class="form-group">
            <label for="category">Category</label>
            <select class="form-control" id="category" name="category" required>
                <option value="1">한식</option>
                <option value="2">중식</option>
                <option value="3">일식</option>
                <option value="4">양식</option>
                <option value="5">기타</option>
            </select>
        </div>
        <div class="form-group">
            <label for="image">Image</label>
            <input type="text" class="form-control" id="image" name="image" required>
        </div>
        <div class="form-group">
            <label for="ingredient">Ingredient</label>
            <textarea class="form-control" id="ingredient" name="ingredient" rows="5" required></textarea>
        </div>
        <div class="form-group">
            <label for="step">Step</label>
            <textarea class="form-control" id="step" name="step" rows="5" required></textarea>
        </div>
        <div class="form-group">
            <label for="tip">Tip</label>
            <textarea class="form-control" id="tip" name="tip" rows="5" required></textarea>
        </div>
        <div class="form-group">
            <label for="video">Video</label>
            <input type="text" class="form-control" id="video" name="video" required>
        </div>
        <div class="form-group">
            <label for="tag">Tag</label>
            <input type="text" class="form-control" id="tag" name="tag" required>
        </div>
        <div class="form-group">
            <label for="difficulty">Difficulty</label>
            <select class="form-control" id="difficulty" name="difficulty" required>
                <option value="1">초급</option>
                <option value="2">중급</option>
                <option value="3">고급</option>
            </select>
        </div>
        <div class="form-group">
            <label for="time">Time</label>
            <input type="text" class="form-control" id="time" name="time" required>
        </div>
        <div class="form-group">
            <label for="calorie">Calorie</label>
            <input type="text" class="form-control" id="calorie" name="calorie" required>
        </div>
        <div class="form-group">
            <label for="serving">Serving</label>
            <input type="text" class="form-control" id="serving" name="serving" required>
        </div>
        <div class="container">
            <button type="submit" class="btn btn-primary" id="btn-brand3">Submit</button>
            <button type="cancle" class="btn btn-primary" id="btn-brand4">Cancle</button>
        </div>
    </form>
</div>

<!-- ***** Register Area End ***** -->

    <!-- footer.jsp include -->
    <c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
