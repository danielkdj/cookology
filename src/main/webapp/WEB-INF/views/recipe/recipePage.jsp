<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- ****** All JS Files ****** -->
<%--<!-- Jquery-2.2.4 js -->
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<!-- Popper js -->
<script src="js/bootstrap/popper.min.js"></script>
<!-- Bootstrap-4 js -->
<script src="js/bootstrap/bootstrap.min.js"></script>
<!-- All Plugins JS -->
<script src="js/others/plugins.js"></script>
<!-- Active JS -->--%>
<script src="js/active.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
</style>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 위의 4개의 메타 태그는 헤더에 *반드시* 와야 합니다. 다른 헤더 콘텐츠는 이 태그 *뒤에* 와야 합니다 -->
    <!-- method -->
    <!-- Trigger search button on hitting enter key -->
    <script>
        $(document).ready(function() {
            $('#searchBar').keypress(function(event){
                var keycode = (event.keyCode ? event.keyCode : event.which);
                if(keycode == '13'){
                    $('#searchBtn').click();
                }
            });
        });
    </script>
    <!-- search result return -->
    <script>
        $(document).ready(function(){
            $("#searchBar").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                $("#searchResults *").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>

    <!-- Title -->
    <title>Cookology - 레시피</title>
    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">
    <!-- Core Stylesheet -->
    <link href="/resources/css/style.css" rel="stylesheet">
    <!-- Responsive CSS -->
    <link href="/resources/css/responsive/responsive.css" rel="stylesheet">
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

<div class="breadcumb-nav">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="main.do"><i class="fa fa-home" aria-hidden="true"></i>Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">recipe</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>

<div>
    <!-- ****** SearchBar Start ****** -->
    <div style="margin-top:30px; margin-left:12%; width: 60%;" class="container">
        <h4>Search</h4>
        <div class="input-group mb-3">
            <input type="text" class="form-control" placeholder="Search recipe..." id="searchBar">
            <div class="input-group-append">
                <!-- search btn -->
                <button id="btn-brand" class="btn btn-outline-secondary" type="button" post="selectRecipe.do">Search</button>
                <!-- allergy checkbox btn -->
                <button id="btn-brand1" class="btn btn-outline-secondary" type="button" data-toggle="collapse" data-target="#allergyAccordion">Allergy</button>
            </div>
        </div>
    </div>
    <!-- ****** SearchBar End ****** -->

    <!-- ****** Allergy Checkboxes Start ****** -->
    <div class="container">
        <div id="allergyAccordion" class="collapse">
            <h6 style="margin-bottom:15px">Allergy Information</h6>
            <form>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="10">
                            <label class="form-check-label" for="10">알류</label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="20">
                            <label class="form-check-label" for="20">유제품</label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="30">
                            <label class="form-check-label" for="30">땅콩</label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="40">
                            <label class="form-check-label" for="40">견과류</label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="50">
                            <label class="form-check-label" for="50">밀</label>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="60">
                            <label class="form-check-label" for="60">참깨</label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="70">
                            <label class="form-check-label" for="70">콩(대두)</label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="80">
                            <label class="form-check-label" for="80">과일 및 채소</label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="90">
                            <label class="form-check-label" for="90">해산물 및 조개류</label>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="100">
                            <label class="form-check-label" for="100">육류</label>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
<!-- ****** Allergy Checkboxes End ****** -->

<div class="container">
    <!-- ****** Recipe Previews Start ****** -->
    <h5 style="margin-top: 35px;">Recipe Previews</h5>
    <!-- Add recipe previews here -->
    <c:set var="recipeList" value="${requestScope.recipe}"/>
    <div class="row" style="margin-top:20px; width: 100%;">
        <c:forEach items="${recipeList}" var="rc">
            <!-- Example : Single recipe preview -->
            <div style="margin-top: 20px; position:relative;" class="col-md-4">
                <div class="card" style="width: 18rem;">
                    <img src="${rc.thumb_url}" class="card-img-top" alt="Recipe Image">
                    <div class="card-body">
                        <h6 class="card-title">${rc.recipe_title}</h6>
                        <p class="card-text">${rc.recipe_description}</p>
                        <a href="moveRecipeListPage.do" id ="btn-brand2" class="btn btn-outline-secondary">View Recipe</a>
                    </div>
                </div>
            </div>
        </c:forEach>
        </div>
</div>
    <!-- ****** Recipe Previews End ****** -->


<!-- footer.jsp include -->
<c:import url="/WEB-INF/views/common/footer.jsp" />

<!-- ****** All JS Files ****** -->
<!-- Jquery-2.2.4 js -->
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<!-- Popper js -->
<script src="js/bootstrap/popper.min.js"></script>
<!-- Bootstrap-4 js -->
<script src="js/bootstrap/bootstrap.min.js"></script>
<!-- All Plugins JS -->
<script src="js/others/plugins.js"></script>
<!-- Active JS -->
<script src="js/active.js"></script>
</body>
