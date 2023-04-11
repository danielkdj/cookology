<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 위의 4개의 메타 태그는 헤더에 *반드시* 와야 합니다. 다른 헤더 콘텐츠는 이 태그 *뒤에* 와야 합니다 -->
    <!-- Title -->
    <title>Cookology - 레시피</title>
    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">
    <!-- Add Bootstrap and other stylesheets -->
    <script src="js/active.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper-cjs"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
</html>
<body>
    <!-- header.jsp include -->
    <c:import url="/WEB-INF/views/common/header.jsp" />

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

    <!-- ****** 사이트내 경로 Area Start ****** -->
    <div class="breadcumb-nav">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol style="margin-bottom: 75px" class="breadcrumb">
                            <li class="breadcrumb-item"><a href="main.do"><i class="fa fa-home" aria-hidden="true"></i>Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">recipe</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ****** 사이트내 경로 Area End ****** -->

    <!-- rsearchbar.jsp include -->
    <c:import url="/WEB-INF/views/common/rsearchbar.jsp" />
    <!-- ****** Recipe Previews Start ****** -->
    <div class="container">
        <h5 style="margin-top:50px;">Recipe Previews</h5>
        <c:out value="${searchresult}" />
        <c:set var="recipe" value="${requestScope.recipe}"/>
        <div class="row">
            <!-- 최근 레시피 또는 검색 결과를 출력합니다. -->
            <c:choose>
                <c:when test="${not empty searchresult}">
                    <c:forEach var="rc" items="${searchresult}">
                        <!-- 검색 결과를 출력합니다. -->
                        <div style="margin-top: 20px; position:relative;" class="col-md-4">
                            <div class="card" style="border-color:white; width: 18rem;">
                                <img style="border-radius: 12%" src="${rc.thumb_url}" class="card-img-top" alt="Recipe Image">
                                <div class="card-body">
                                    <h6 class="card-title">${rc.recipe_title}</h6>
                                    <p class="card-text">${rc.recipe_description}</p>
                                    <a href="rlistpage.do?recipe_seq_id=${rc.recipe_seq_id}" id="sbtn-brand2" class="btn btn-outline-secondary">View Recipe</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <c:forEach var="r" items="${recipe}">
                        <!-- 최근순 레시피 목록을 출력합니다. -->
                        <div style="margin-top: 20px; position:relative;" class="col-md-4">
                            <div class="card" style="border-color:white; width: 18rem;">
                                <img style="border-radius: 12%" src="${r.thumb_url}" class="card-img-top" alt="Recipe Image">
                                <div class="card-body">
                                    <h6 class="card-title">${r.recipe_title}</h6>
                                    <p class="card-text">${r.recipe_description}</p>
                                    <a href="rlistpage.do?recipe_seq_id=${r.recipe_seq_id}" id="btn-brand2" class="btn btn-outline-secondary">View Recipe</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <!-- ****** Recipe Previews End ****** -->

    <!-- ****** Blog Sidebar ****** -->
    <div class="col-md-3">
        <div class="row">
            <div class="blog-sidebar mt-5 mt-lg-0">
                <!-- Single Widget Area -->
                <div class="single-widget-area about-me-widget text-center">
                    <div class="widget-title">
                        <h6>이달의 레시피</h6>
                    </div>
                    <h4 class="font-shadow-into-light">Shopia Bernard</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                        sed do eiusmod tempor incididunt</p>
                </div>

                <!-- Most Viewed Recipes start -->
                <div class="single-widget-area popular-post-widget">
                    <div class="widget-title text-center">
                        <h6>추천 레시피</h6>
                        <!-- Display the top 5 most viewed recipes -->
                        <c:set var="rlist" value="${mvrecipe}"/>
                    </div>
                    <c:if test="${not empty rlist}">
                        <c:forEach var="mvrl" items="${mvrecipe}">
                            <div class="single-populer-post d-flex">
                                <img src="${mvrl.thumb_url}" alt=""/>
                                <div class="post-content">
                                    <a href="rlistpage.do?recipe_seq_id=${mvrl.recipe_seq_id}">
                                        <h6>${mvrl.recipe_description}</h6>
                                    </a>
                                    <p>${mvrl.created_at}</p>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
                <!-- Most Viewed Recipes end -->
            </div>
        </div>
    </div>
    <!-- 페이지가 허술하게 작성되고 있어서 페이징 처리와 추가 실험중인 코드들 -->
<%--    <div class="container">
        <h1>Recipes</h1>
        <div id="recipeList"></div>
        <div id="pagination"></div>
    </div>

    <script>
        let currentPage = 1;
        let pageSize = 10;

        function loadRecipes(page) {
            $.ajax({
                url: `/api/recipe?page=${page}&size=${pageSize}`,
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    renderRecipes(data.content);
                    renderPagination(data.totalPages, data.number);
                },
                error: function () {
                    alert('Error loading recipes');
                }
            });
        }

        function renderRecipes(recipe) {
            let html = '<div class="row">';
            recipe.forEach(recipe => {
                html += `
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        <img src="${recipe.thumb_url}" class="card-img-top" alt="${recipe.recipe_title}">
                        <div class="card-body">
                            <h5 class="card-title">${recipe.recipe_title}</h5>
                            <p class="card-text">${recipe.content.substring(0, 100)}...</p>
                            <p class="card-text"><small class="text-muted">Created on ${recipe.created_at}</small></p>
                            <a href="/recipes/${recipe.recipe_seq_id}" class="btn btn-primary">View Recipe</a>
                        </div>
                    </div>
                </div>`;
            });
            html += '</div>';
            $('#recipeList').html(html);
        }

        function renderPagination(totalPages, currentPage) {
            let html = '<nav><ul class="pagination">';
            for (let i = 1; i <= totalPages; i++) {
                if (i === currentPage + 1) {
                    html += `<li class="page-item active"><a class="page-link" href="#" onclick="loadRecipes(${i})">${i}</a></li>`;
                } else {
                    html += `<li class="page-item"><a class="page-link" href="#" onclick="loadRecipes(${i})">${i}</a></li>`;
                }
            }
            html += '</ul></nav>';
            $('#pagination').html(html);
        }

        $(document).ready(function () {
            loadRecipes(currentPage);
        });
    </script>--%>

    <!-- ****** footer.jsp include ****** -->
    <c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>


