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
    <%--button--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" crossorigin="anonymous"/> <%--referrerpolicy="no-referrer--%>
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/event/event-button.css"/>
    <!-- Core Stylesheet -->
    <link href="${ pageContext.servletContext.contextPath }/resources/css/style.css" rel="stylesheet"/>
    <link href="${ pageContext.servletContext.contextPath }/resources/css/responsive/reponsive.css" rel="stylesheet"/>
    <!-- Step 1) Load D3.js -->
    <script src="https://d3js.org/d3.v6.min.js"></script>
    <!-- Step 2) Load billboard.js with style -->
    <script src="${ pageContext.servletContext.contextPath }/resources/js/billboard/billboard.js"></script>
    <!-- Load with base style -->
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/billboard/billboard.css">
    <!-- Or load different theme style -->
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/billboard/insight.min.css">



    <style>
        /* 테이블 스타일 */
        .rankTable {
            margin: 10px;
            padding: 10px;
            display: inline-block;
        }
        .rankTable:nth-child(2) {
            margin-left: 20px;
        }
        body {
            font-family: 'Lato', Arial, sans-serif;
            color: #989c9b;
            text-align: center;
        }

        .rankTable > header {
            margin: 0 auto;
            padding: 1em;
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
        }
        th {
            /*background-color: #326295;*/
            background-color: #fc6c3f;
            font-weight: bold;
            color: #fff;
            white-space: nowrap;
        }

        td, th {
            padding: 1em 1.5em;
            text-align: left;
        }

        tbody th {
            background-color: #fc6c3f;
            /*background-color: #2ea879;*/
        }

        tbody tr:nth-child(2n-1) {
            background-color: #f5f5f5;
            transition: all .125s ease-in-out;
        }

        tbody tr:hover {
            /*background-color: rgba(50, 98, 149, .3);*/
            background-color: rgba(252, 108, 63, .3);
        }

        td.rank {
            text-transform: capitalize;
        }
        /*table end*/

        /*bill board*/
        @font-face {
            font-family: 'bill';
            src: url("${pageContext.servletContext.contextPath}/resources/fonts/PFStardust.ttf") format('truetype');
            <%--src: url("${pageContext.servletContext.contextPath}/resources/fonts/LEDBOARD.TTF") format('truetype');--%>
            font-weight: normal;
            font-style: normal;
        }
        .animated-title {
            font-size:60px;
            /*font-family:'Raleway',Sans-serif;*/
            font-family: 'bill';
            /*display: table-cell;*/
            color: #FFFFFF;
            font-weight:300;
            position: relative;
            width: 100%;
            max-width:100%;
            height: auto;
            padding:100px 0;
            overflow-x: hidden;
            overflow-y: hidden;

        }
        .billboard-container {
            display: flex;
            justify-content: center;
        }

        .animated-title .bill-track {
            position: absolute;
            white-space: nowrap;
            will-change: transform;
            animation: marquee 10s linear infinite;
        }
        @keyframes marquee {
            from { transform: translateX(0); }
            to { transform: translateX(-150%); }
        }
        @media (hover: hover) and (min-width: 700px){
            .animated-title .bill-content {
                -webkit-transform: translateY(calc(100% - 8rem));
                transform: translateY(calc(100% - 8rem));
            }
        }

        .billboard {
            /*background-color: #326295;*/
            background-color: #fc6c3f;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            /*margin: 0 auto;*/
            margin: 10px;
            max-width: 80%;
            height: 80px;
            padding: 10px;

        }

        .bill-content {
            margin-top: 30px;
        }
        /*bill board end*/

        /*input form */
        form input[type="number"],
        form input[type="text"] {
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            margin: 5px 0;
            padding: 6px 12px;
            width: 100%;
            max-width: 200px;
        }

        form input[type="submit"] {
            /*background-color: #326295;*/
            background-color: #fc6c3f;
            border: none;
            border-radius: 4px;
            color: #fff;
            cursor: pointer;
            font-size: 14px;
            margin-top: 10px;
            padding: 6px 12px;
            text-transform: uppercase;
        }

        form input[type="submit"]:hover {
            /*background-color: #2ea879;*/
            background-color: #ff8357;
        }
        /*input form end*/

    /*    button css*/
    /*    .event-button {*/
    /*        background-color: rgba(255, 131, 87, 1);*/
    /*        color: white;*/
    /*        border: none;*/
    /*        padding: 10px 20px;*/
    /*        border-radius: 5px;*/
    /*        font-size: 16px;*/
    /*        cursor: pointer;*/
    /*        transition: background-color 0.3s;*/
    /*    }*/

    /*    .event-button:hover {*/
    /*    background-color : rgba(255, 131, 255, 1);*/
    /*    }*/
    /*    .event-button i {*/
    /*        margin-right: 5px;*/
    /*    }*/

        #timeseriesChart {
            max-width: 70%;
        }
    </style>
</head>

<body>

<!-- Header Start -->
<c:import url="/WEB-INF/views/common/header.jsp"/>
<!-- Header End -->


<%--billboard--%>

<div class="billboard-container">
    <div class="animated-title billboard">
        <div class="bill-track">
            <div class="bill-content">[USER01] : TEST-MSG 데스와</div>
        </div>
    </div>
</div>

<%--rainking table--%>
<div style="display: flex; justify-content: center;">
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
    <div class="rankTable">
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
    <%--    RECIE RANK2--%>
    <div class="rankTable" >
        <header>
            <h1>RECIPE-GOOD-TOP5</h1>
        </header>
        <div class="wrapper">
            <table>
                <thead>
                <tr>
                    <th>Rank</th>
                    <th>TITLE</th>
                    <th>GOOD</th>
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
<%--bill board input--%>
<div>
    <form method="post">
        <input type="number" size="2" min="100" value="100"/>
        <input type="text">
        <input type="submit" value="send">
    </form>
</div>

<div>
    <p class="test-msg">test msg</p>
</div>

<br>
<div style="display:flex;justify-content: center;">
    <div id="timeseriesChart" style=""></div>
</div>
<script>
    // for ESM environment, need to import modules as:
    // import bb, {line} from "billboard.js";
    const chart = bb.generate({
        data: {
            x: "x",
            columns: [
                ["x", "2013-01-01", "2013-01-02", "2013-01-03", "2013-01-04", "2013-01-05", "2013-01-06"],
                ["data1", 30, 200, 100, 400, 150, 250],
                ["data2", 130, 340, 200, 500, 250, 350]
            ],
            type: "line", // for ESM specify as: line()
        },
        axis: {
            x: {
                type: "timeseries",
                tick: {
                    format: "%Y-%m-%d"
                }
            }
        },
        bindto: "#timeseriesChart"
    });

    setTimeout(function() {
        chart.load({
            columns: [
                ["data3", 400, 500, 450, 700, 600, 500]
            ]
        });
    }, 1000);
</script>
<br>
<button class="event-button" onclick="location.href='${pageContext.servletContext.contextPath}/attendance.do'">
    <i class="fas fa-calendar-alt"></i> 출석부
</button>
<button class="event-button" onclick="location.href='${pageContext.servletContext.contextPath}/attendance.do'">
    <i class="fas fa-puzzle-piece"></i> 미니 게임
</button>
<button class="event-button" onclick="location.href='${pageContext.servletContext.contextPath}/attendance.do'">
    <i class="fas fa-question-circle"></i> ???
</button>

<!-- Footer Start -->
<c:import url="/WEB-INF/views/common/footer.jsp"/>
<!-- Footer End -->
</body>
</html>