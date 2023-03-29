<%--
  Created by IntelliJ IDEA.
  User: ICT02-30
  Date: 2023-03-29
  Time: 오전 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         errorPage="/WEB-INF/views/common/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <title>Cookology - Home</title>
    <!-- Favicon -->
    <link rel="icon" href="${ pageContext.servletContext.contextPath }/resources/img/core-img/Cookology_logo.png"/>
    <!-- Core Stylesheet -->
    <link href="${ pageContext.servletContext.contextPath }/resources/css/style.css" rel="stylesheet"/>
    <link href="${ pageContext.servletContext.contextPath }/resources/css/responsive/reponsive.css" rel="stylesheet"/>
</head>
<body>

<!-- Header Start -->
<c:import url="/WEB-INF/views/common/header.jsp"/>
<!-- Header End -->

<!-- ****** Welcome Post Area Start ****** -->

<!-- ****** Welcome Area End ****** -->

<!-- ****** Categories Area Start ****** -->

<!-- ****** Blog Area Start ****** -->

<!-- ****** Instagram Area Start ****** -->
<div>

</div>

<!-- Footer Start -->
<c:import url="/WEB-INF/views/common/footer.jsp"/>
<!-- Footer End -->
</body>
</html>