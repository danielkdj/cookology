<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<hr>


<div class="breadcumb-area" style="background-image: url('${pageContext.servletContext.contextPath}/resources/img/catagory-img/3.jpg');">
    <div class="container h-100">
        <div class="row h-100 align-items-center">
            <div class="col-12">
                <div class="bradcumb-title text-center">
                    <h2>merchant</h2>
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
                        <li class="breadcrumb-item active" aria-current="page">merchant</a></li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>

<h1>merchant 메인</h1>
<h3><a href="${ pageContext.servletContext.contextPath }/productList.do">상품관리</a></h3>
<h3><a href="${ pageContext.servletContext.contextPath }/merOrderList.do">매출관리</a></h3>


<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>