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
    <style>
<%--        table--%>
        .rankTable {
            /*float: left;*/
            margin: 10px;
            padding: 10px;
            display: inline-block;

        }
        body {
            font-family: 'Lato', Arial, sans-serif;
            color: #989c9b;
        }

        .rankTable > header {
            margin: 0 auto;
            padding: 1em;
            /*text-align: center;*/

        }

        .rankTable > header h1 {
            font-weight: 600;
            font-size: 2em;
            margin: 0;
        }

        .wrapper {
            line-height: 1.5em;
            margin: 0 auto;
            padding: 2em 0 3em;
            /*width: 90%;*/
            max-width: 2000px;
            overflow: hidden;
        }

        table {
            border-collapse: collapse;
            width: 50%;
            background: #fff;
            display: inline;
            margin-left:auto;
            margin-right:auto;
            /*float: right;*/
        }

        /*billboard*/
        th {
            background-color: #326295;
            font-weight: bold;
            color: #fff;
            white-space: nowrap;
        }

        td, th {
            padding: 1em 1.5em;
            text-align: left;
        }

        tbody th {
            background-color: #2ea879;
        }

        tbody tr:nth-child(2n-1) {
            background-color: #f5f5f5;
            transition: all .125s ease-in-out;
        }

        tbody tr:hover {
            background-color: rgba(50, 98, 149, .3);
        }

        td.rank {
            text-transform: capitalize;
        }

        .animated-title {
            font-size:60px;
            font-family:'Raleway',Sans-serif;
            font-weight:300;
            position: relative;
            width: 100%;
            max-width:100%;
            height: auto;
            padding:100px 0; overflow-x: hidden; overflow-y: hidden; }
        .animated-title .track {position: absolute; white-space: nowrap;will-change: transform;animation: marquee 60s linear infinite; }
        @keyframes marquee {
            from { transform: translateX(0); }
            to { transform: translateX(-50%); }
        }
        @media (hover: hover) and (min-width: 700px){
            .animated-title .content {-webkit-transform: translateY(calc(100% - 8rem)); transform: translateY(calc(100% - 8rem));}
        }

    </style>

</head>

<body>

<!-- Header Start -->
<c:import url="/WEB-INF/views/common/header.jsp"/>
<!-- Header End -->


<%--billboard--%>

<div class="animated-title">
    <div class="track">
        <div class="content">[USER01] : TEST-MSG [USER01] : TEST-MSG [USER01] : TEST-MSG [USER01] : TEST-MSG</div>
    </div>
</div>


<%--rainking table--%>
<div style="display: flex;">
    <div class="rankTable">
        <header>
            <h1>USER-POINT-TOP5</h1>
        </header>
        <div class="wrapper">
            <table>
                <thead>
                <tr>
                    <th>Rank</th>
                    <th>NAME</th>
                    <th>Points</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="rank">1</td>
                    <td class="name">user01</td>
                    <td class="points">1460</td>
                </tr>
                <tr>
                    <td class="rank">2</td>
                    <td class="name">user02</td>
                    <td class="points">1340</td>
                </tr>
                <tr>
                    <td class="rank">3</td>
                    <td class="name">user03</td>
                    <td class="points">1245</td>
                </tr>
                <tr>
                    <td class="rank">4</td>
                    <td class="name">user04</td>
                    <td class="points">1210</td>
                </tr>
                <tr>
                    <td class="rank">5</td>
                    <td class="name">user05</td>
                    <td class="points">1186</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
<%--    RECIE RANK--%>
    <div class="rankTable" >
        <header>
            <h1>RECIPE-VIEW-TOP5</h1>
        </header>
        <div class="wrapper">
            <table>
                <thead>
                <tr>
                    <th>Rank</th>
                    <th>TITLE</th>
                    <th>VIEWS</th>
                </tr>
                </thead>
                <tbody>
                <tr onclick="location.href='${pageContext.servletContext.contextPath}/main.do'">
                    <td class="rank">1</td>
                    <td class="title">title01</td>
                    <td class="views">1460</td>
                </tr>
                <tr onclick="location.href='${pageContext.servletContext.contextPath}/main.do'">
                    <td class="rank">2</td>
                    <td class="title">title02</td>
                    <td class="views">1340</td>
                </tr>
                <tr onclick="location.href='${pageContext.servletContext.contextPath}/main.do'">
                    <td class="rank">3</td>
                    <td class="title">title03</td>
                    <td class="views">1245</td>
                </tr>
                <tr onclick="location.href='${pageContext.servletContext.contextPath}/main.do'">
                    <td class="rank">4</td>
                    <td class="title">title04</td>
                    <td class="views">1210</td>
                </tr>
                <tr onclick="location.href='${pageContext.servletContext.contextPath}/main.do'">
                    <td class="rank">5</td>
                    <td class="title">title05</td>
                    <td class="views">1186</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<br>
<br>
<br>

<%--bill board input--%>
<div>
    <form method="post">
        <input type="number" size="2" min="100" value="100"/>
        <input type="text"

        >
        <input type="submit" value="send">
    </form>
</div>

<div>
    test msg
</div>
<!-- Footer Start -->
<%--<c:import url="/WEB-INF/views/common/footer.jsp"/>--%>
<!-- Footer End -->
</body>
</html>