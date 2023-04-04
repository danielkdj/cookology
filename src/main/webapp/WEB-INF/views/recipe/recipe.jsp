<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 위의 4개의 메타 태그는 헤더에서 *반드시* 와야 합니다. 다른 헤더 콘텐츠는 이 태그 *뒤에* 와야 합니다 -->

    <!-- Title -->
    <title>Cookology - 레시피</title>
    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">
    <!-- Core Stylesheet -->
    <link href="style.css" rel="stylesheet">
    <!-- Responsive CSS -->
    <link href="css/responsive/responsive.css" rel="stylesheet">
</head>



<!-- header.jsp include -->
<c:import url="/WEB-INF/views/common/header.jsp" />
<body>

<div class="breadcumb-area" style="background-image: url('${pageContext.servletContext.contextPath}/resources/img/catagory-img/3.jpg');">
    <div class="container h-100">
        <div class="row h-100 align-items-center">
            <div class="col-12">
                <div class="bradcumb-title text-center">
                    <!-- h2태그에 스타일 속성을 적용하여 background-image webapp/resources/img/catagory-img/3.jpg 를 배경으로 한다. -->
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

<!-- ****** SearchBar Start ****** -->
<div style="margin-top:35px; width: 60%; height: 60%; margin-left: 0;" class="container">
    <h2>Recipe Search</h2>
    <div class="input-group mb-3">
        <input type="text" class="form-control" placeholder="Search recipe..." id="searchBar">
        <div class="input-group-append">
            <!-- search btn -->
            <button class="btn btn-outline-secondary" type="button" post="selectRecipe.do">Search</button>
            <!-- category accordion btn -->
            <button class="btn btn-outline-secondary" type="button" data-toggle="collapse" data-target="#categoryAccordion">Category</button>
            <!-- allergy checkbox btn -->
            <button class="btn btn-outline-secondary" type="button" data-toggle="collapse" data-target="#allergyAccordion">Allergy</button>
        </div>
    </div>
</div>
<!-- ****** SearchBar End ****** -->

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


</body>
</html>
<!-- ****** SearchBar End ****** -->

<!-- ****** Breadcumb Area End ****** -->



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
