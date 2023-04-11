<%--
  Created by IntelliJ IDEA.
  User: KimDongjun
  Date: 2023-04-07
  Time: 오전 3:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <link rel="icon" href="/cookology/resources/img/core-img/Cookology_logo.png"/>
    <script
            src="https://code.jquery.com/jquery-3.6.4.js"
            integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
            crossorigin="anonymous"></script>
    <title>Detail</title>
    <%--button--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" crossorigin="anonymous"/>
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/event/event-button.css"/>
    <script>
        window.onload = function () {
            // 최대 창 너비
            let maxWidth = 500;
            let maxheight = 800;
            // let currentHeight = window.innerHeight;
            window.addEventListener("resize", () => {
                if (window.innerWidth != maxWidth) window.resizeTo(maxWidth, maxheight);
            });
        }


    </script>

    <%--button--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
          crossorigin="anonymous"/>
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/event/event-button.css"/>

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
            overflow-x: hidden;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        a {
            color: #4b9fea;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .container {
            max-width: 700px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }

        h1 {
            font-size: 24px;
            font-weight: 500;
            margin-bottom: 20px;
        }

        input[type='date'],
        input[type='number'],
        input[type='text'],
        textarea {
            display: block;
            margin-top: 5px;
            margin-bottom: 5px;
            width: 100%;
            padding: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-shadow: 1px 1px 5px gray;
            margin-left: auto;
            margin-right: auto;
        }

        input[type='color'] {
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
    const urlParams = new URLSearchParams(window.location.search);6
    const uuid = urlParams.get('uuid');
    let eventdetail;
    $(document).ready(() => {
        console.log("${uuid}".toString());
        $.ajax({
            url: "getEventCalendarDetail.do",
            type: "post",
            dataType: "json",
            data: {uuid: uuid},
            success: (jsonData) => {
                console.log("[requestPostBodyJson] : [response] : " + jsonData);
                // let item = jsonData.list;
                console.log(jsonData.description);
                eventdetail = {
                    uuid: jsonData.eventcalendar_uuid,
                    title: decodeURIComponent(jsonData.title).replace(/\+/gi, ' '),
                    start: jsonData.start,
                    end: jsonData.end,
                    url: decodeURIComponent(jsonData.url).replace(/\+/gi, ' '),
                    description: decodeURIComponent(jsonData.description).replace(/\+/gi, ' '),
                    content: decodeURIComponent(jsonData.content).replace(/\+/gi, ' '),
                    longitude: jsonData.longitude,
                    latitude: jsonData.latitude,
                };
                $('#title').text(eventdetail.title);
                $('#start').text(eventdetail.start);
                $('#end').text(eventdetail.end);
                $('#content').text(eventdetail.content);
                $('#description').text(eventdetail.description);
                $('#url').val(eventdetail.url);
                // $('#url').prop("href",eventdetail.url);


            },
            error: function (request, status, errorData) {
                console.log("error code : " + request.status
                    + "\nMessage : " + request.responseText
                    + "\nError : " + errorData);
            }
        });
    });
</script>

<div class="container">
    <table>
        <tr>
            <td>시작일</td>
            <td><div id="start" name="start"></div></td>
        </tr>
        <tr>
            <td>종료일</td>
            <td><div id="end" name="end"></div></td>
        </tr>
        <tr>
            <td>제목</td>
            <td><div id="title" name="title"></div></td>
        </tr>
        <tr>
            <td>URL</td>
            <td><a onclick="urlNewWindow()">페이지로 가기</a></td>
            <input type="hidden"  id="url" name="url" href="#">
            <script>
                function urlNewWindow() {
                    let url = $('#url').val(); // Replace this with the URL you want to open
                    window.open(url, "_blank");
                }
            </script>
        </tr>
        <tr>
            <td>설명</td>
            <td>
                <div id="description" name="description"></div>
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                <div id="content" name="content"></div>
            </td>
        </tr>
        <tr>
            <script type="text/javascript"
                    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1228e92de83ae956c2778e75d8f9a2b4"></script>
            <div id="map" style="width:100%;height:350px;"></div>
            <script>
                setTimeout(() => {
                    let mapContainer = document.getElementById('map'), // 지도를 표시할 div
                        mapOption = {
                            center: new kakao.maps.LatLng(eventdetail.latitude, eventdetail.longitude), // 지도의 중심좌표
                            level: 3 // 지도의 확대 레벨
                        };
                    let map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

                    // 지도를 클릭한 위치에 표출할 마커입니다
                    let marker = new kakao.maps.Marker({
                        // 지도 중심좌표에 마커를 생성합니다
                        position: map.getCenter()
                    });
                    // 지도에 마커를 표시합니다
                    marker.setMap(map);
                },500);
            </script>
        </tr>
    </table>
</div>
<div>
    <button class="event-button" onclick="deleteEvent();">
        <i class="fas fa-calendar-minus"></i> 삭제하기
    </button>
    <script>
        function deleteEvent() {
            $.ajax({
                url: "deleteEventCalendar.do",
                type: "post",
                // dataType: "json",
                data: {uuid: uuid},
                success: (data) => {
                    console.log(data);
                    if(data == "ok"){
                        alert("삭제 성공");
                        opener.parent.location.reload();
                        window.close();
                    } else if (data.toString() == "fail") {
                        alert("이미 삭제되었거나, 없는 페이지입니다.");
                    }

                    // window.close();
                },
                error: () => {alert("error!");}
            });
        }
    </script>


    <button class="event-button" onclick="location.href='${pageContext.servletContext.contextPath}/attendance.do'">
        <i class="fas fa-edit"></i> 수정하기
    </button>
    <script>


    </script>
</div>
</body>
</html>