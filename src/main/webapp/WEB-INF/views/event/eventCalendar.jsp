<%--
  Created by IntelliJ IDEA.
  User: KimDongjun
  Date: 2023-04-06
  Time: 오후 8:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="/WEB-INF/views/common/error.jsp"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.5/index.global.min.js"></script>
    <script src='https://cdn.jsdelivr.net/npm/@fullcalendar/web-component@6.1.5/index.global.min.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@6.1.5/index.global.min.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/@fullcalendar/core@6.1.5/locales-all.global.min.js'></script>
    <script src="https://unpkg.com/popper.js/dist/umd/popper.min.js"></script>
    <script src="https://unpkg.com/tooltip.js/dist/umd/tooltip.min.js"></script>
    <script
            src="https://code.jquery.com/jquery-3.6.4.js"
            integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
            crossorigin="anonymous"></script>

    <%--button--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" crossorigin="anonymous"/>
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/event/event-button.css"/>

    <style>
        html, body {
            margin: 0;
            padding: 0;
            font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
            font-size: 14px;
        }

        #calendar {
            max-width: 1100px;
            margin: 40px auto;
        }

        /*
        i wish this required CSS was better documented :(
        https://github.com/FezVrasta/popper.js/issues/674
        derived from this CSS on this page: https://popper.js.org/tooltip-examples.html
        */

        .popper,
        .tooltip {
            position: absolute;
            z-index: 9999;
            background: #FFC107;
            color: black;
            width: 150px;
            border-radius: 3px;
            box-shadow: 0 0 2px rgba(0,0,0,0.5);
            padding: 10px;
            text-align: center;
        }
        .style5 .tooltip {
            background: #1E252B;
            color: #FFFFFF;
            max-width: 200px;
            width: auto;
            font-size: .8rem;
            padding: .5em 1em;
        }
        .popper .popper__arrow,
        .tooltip .tooltip-arrow {
            width: 0;
            height: 0;
            border-style: solid;
            position: absolute;
            margin: 5px;
        }

        .tooltip .tooltip-arrow,
        .popper .popper__arrow {
            border-color: #FFC107;
        }
        .style5 .tooltip .tooltip-arrow {
            border-color: #1E252B;
        }
        .popper[x-placement^="top"],
        .tooltip[x-placement^="top"] {
            margin-bottom: 5px;
        }
        .popper[x-placement^="top"] .popper__arrow,
        .tooltip[x-placement^="top"] .tooltip-arrow {
            border-width: 5px 5px 0 5px;
            border-left-color: transparent;
            border-right-color: transparent;
            border-bottom-color: transparent;
            bottom: -5px;
            left: calc(50% - 5px);
            margin-top: 0;
            margin-bottom: 0;
        }
        .popper[x-placement^="bottom"],
        .tooltip[x-placement^="bottom"] {
            margin-top: 5px;
        }
        .tooltip[x-placement^="bottom"] .tooltip-arrow,
        .popper[x-placement^="bottom"] .popper__arrow {
            border-width: 0 5px 5px 5px;
            border-left-color: transparent;
            border-right-color: transparent;
            border-top-color: transparent;
            top: -5px;
            left: calc(50% - 5px);
            margin-top: 0;
            margin-bottom: 0;
        }
        .tooltip[x-placement^="right"],
        .popper[x-placement^="right"] {
            margin-left: 5px;
        }
        .popper[x-placement^="right"] .popper__arrow,
        .tooltip[x-placement^="right"] .tooltip-arrow {
            border-width: 5px 5px 5px 0;
            border-left-color: transparent;
            border-top-color: transparent;
            border-bottom-color: transparent;
            left: -5px;
            top: calc(50% - 5px);
            margin-left: 0;
            margin-right: 0;
        }
        .popper[x-placement^="left"],
        .tooltip[x-placement^="left"] {
            margin-right: 5px;
        }
        .popper[x-placement^="left"] .popper__arrow,
        .tooltip[x-placement^="left"] .tooltip-arrow {
            border-width: 5px 0 5px 5px;
            border-top-color: transparent;
            border-right-color: transparent;
            border-bottom-color: transparent;
            right: -5px;
            top: calc(50% - 5px);
            margin-left: 0;
            margin-right: 0;
        }
    </style>

    <link rel="icon" href="/cookology/resources/img/core-img/Cookology_logo.png" />

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            let eventList = [];
            function getEventCalendar() {
                $.ajax({
                    url: "getEventCalendar.do",
                    type: "POST",
                    <%--data: {user_email: "${user}"},--%>
                    dataType: "json",
                    success: function(response) {
                        // console.log("[requestPostBodyJson] : [response] : " + response);
                        let jsonData = response;
                        for (let i = 0; i < jsonData.list.length; i++) {
                            let item = jsonData.list[i];
                            let eventItem = {
                                id: item.eventcalendar_uuid,
                                title: item.title,
                                start: item.start.toString(),
                                end: item.end.toString(),
                                overlap: false,
                                color: item.backgroundcolor,
                                description: item.description
                            };
                            eventList.push(eventItem);
                            calendar.addEvent(eventItem);
                        }
                        console.log(eventList);
                        calendar.render();
                    },
                    error: function(xhr) {
                        console.log("[requestPostBodyJson] : [error] : " + JSON.stringify(xhr));
                    },
                });
            }
            getEventCalendar();
            let calendarEl = document.getElementById('calendar');

            let calendar = new FullCalendar.Calendar(calendarEl, {
                headerToolbar: {
                },
                locale: 'kr',
                eventDidMount: function(info) {
                    let tooltip = new Tooltip(info.el, {
                        title: info.event.extendedProps.description,
                        placement: 'top',
                        trigger: 'hover',
                        container: 'body'
                    });
                },
                eventClick: function(info) {
                    let eventObj = info.event;
                    goEventDetail();
                    function goEventDetail() {
                        const windowOption = "toolbar=no, width=500, height=800, left=100, top=100, directories=no, status=no,scrollorbars=no,resizable=no";
                        let url = "${pageContext.servletContext.contextPath}/eventDetail.do?uuid=" + eventObj.id;
                        window.open(url, "newWindow", windowOption);
                        <%--const windowOption = "toolbar=no, width=500, height=800, left=100, top=100, directories=no, status=no,scrollorbars=no,resizable=no";--%>
                        <%--let url = "${pageContext.servletContext.contextPath}/eventDetail.do";--%>
                        <%--// newWindow = window.open("", "newWindow", windowOption);--%>
                        <%--$.ajax({--%>
                        <%--    url:window.open(url, "newWindow", windowOption),--%>
                        <%--    type : "get",--%>
                        <%--    data: {uuid : eventObj.id},--%>
                        <%--    async: false,--%>
                        <%--    success:(result) => {--%>
                        <%--        console.log(eventObj.id);--%>
                        <%--        // window.open(url, "newWindow", windowOption);--%>
                        <%--        &lt;%&ndash;newWindow.location.href = "${pageContext.servletContext.contextPath}/eventDetail.do";&ndash;%&gt;--%>
                        <%--    },--%>
                        <%--    error: function(request, status, errorData){--%>
                        <%--        console.log("error code : " + request.status--%>
                        <%--            + "\nMessage : " + request.responseText--%>
                        <%--            + "\nError : " + errorData);--%>
                        <%--    }--%>
                        <%--});--%>
                    }
                },
                events: [
                ],
            });
            calendar.render();
        });
    </script>
</head>
<body>
<%--<c:import url="/WEB-INF/views/common/header.jsp"></c:import>--%>


<div id="calendar"></div>

    <button class="event-button" onclick="goAddEvent()" >
        <i class="fas fa-plus-circle"></i> 이벤트 추가
    </button>
    <script>
        function goAddEvent() {
            let windowOption = 'width=500, height=800, left=100, top=100,resizable=false';
            window.open("${pageContext.servletContext.contextPath}/adminAddEvent.do", "newWindow", windowOption);
        }
    </script>
<%--    <c:import url="/WEB-INF/views/common/footer.jsp"></c:import>--%>
</body>
</html>

