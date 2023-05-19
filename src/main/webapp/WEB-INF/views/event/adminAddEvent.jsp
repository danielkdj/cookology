<%--
  Created by IntelliJ IDEA.
  User: KimDongjun
  Date: 2023-04-07
  Time: 오전 12:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script
            src="https://code.jquery.com/jquery-3.6.4.js"
            integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
            crossorigin="anonymous"></script>
    <%--        map--%>
       <title>Insert</title>

    <script>
        window.onload = function() {
            // 최대 창 너비
            let maxWidth = 500;
            let maxheight  = 800;
            // let currentHeight = window.innerHeight;
            window.addEventListener("resize", () => { if (window.innerWidth != maxWidth) window.resizeTo(maxWidth, maxheight);});
        }
    </script>

    <%--button--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" crossorigin="anonymous"/>
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/event/event-button.css"/>

    <style>
        .event-button {
            margin-top: 10px;
            display: block;
            margin-left: auto;
            margin-right: auto;
            color: white;
        }

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
    $(function () {
        console.log($('#addCalendarForm').serialize());
        $('#addCalendarButton').on('click', () => {
            const form = $('form').serializeArray();
            $.ajax({
                url:"addCalenderEvent.do",
                type : "post",
                data: form,
                success:(result) => {
                    console.log(result.status);
                    opener.parent.location.reload();
                    window.close();
                },
                error: function(request, status, errorData){
                    console.log("error code : " + request.status
                        + "\nMessage : " + request.responseText
                        + "\nError : " + errorData);
                    alert("error!다시 입력");
                }
            })
        })
    })
</script>

<div class="container">
        <form method="post" id="addCalendarForm">
            <table>
                <tr>
                    <td>시작일</td>
                    <td><input type="date" id="start" name="start"></td>
                </tr>
                <tr>
                    <td>종료일</td>
                    <td><input type="date" id="end" name="end"></td>
                </tr>
                <tr>
                    <td>제목</td>
                    <td><input type="text" id="title" name="title"></td>
                </tr>
                <tr>
                    <td>URL</td>
                    <td><input type="text" id="url" name="url"></td>
                </tr>
                <tr>
                    <td>배경색</td>
                    <td><input type="color" id="backgroundcolor" name="backgroundcolor" value="#fc6c3f"></td>
                </tr>
                <tr>
                    <td>설명</td>
                    <td><textarea id="description" name="description"></textarea></td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td><textarea id="content" name="content"></textarea></td>
                </tr>
                <tr>
                    <td><input type="hidden" id="longitude" name="longitude"></td>
                    <td><input type="hidden" id="latitude" name="latitude"></td>
                </tr>
                    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1228e92de83ae956c2778e75d8f9a2b4"></script>
                    <div id="map" style="width:100%;height:350px;"></div>
                    <script>
                        let mapContainer = document.getElementById('map'), // 지도를 표시할 div
                            mapOption = {
                                center: new kakao.maps.LatLng(37.5524219, 126.937533), // 지도의 중심좌표
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

                        $('#longitude').val("126.937533");
                        $('#latitude').val("37.5524219");
                        // 지도에 클릭 이벤트를 등록합니다
                        // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
                        kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

                            // 클릭한 위도, 경도 정보를 가져옵니다
                            let latlng = mouseEvent.latLng;

                            // 마커 위치를 클릭한 위치로 옮깁니다
                            marker.setPosition(latlng);
                            $('#longitude').val(latlng.getLng().toString());
                            $('#latitude').val(latlng.getLat().toString());
                            console.log()
                        });
                    </script>
            </table>
        </form>


    </div>




<%--        <input type="submit" value="추가" class="event-button" onclick="submitForm();">--%>
<button type="button" class="event-button" id="addCalendarButton">
    <i class="fas fa-paper-plane"></i> 추가
</button>
</body>
</html>
