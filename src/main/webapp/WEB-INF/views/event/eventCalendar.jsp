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

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
                headerToolbar: {
                },
                locale: 'kr',
                // initialView: 'dayGridMonth',
                eventDidMount: function(info) {
                    var tooltip = new Tooltip(info.el, {
                        title: info.event.extendedProps.description,
                        placement: 'top',
                        trigger: 'hover',
                        container: 'body'
                    });
                },

                events: [
                    // {
                    //     id: 'data',
                    //     title: 'All Day Event resrt',
                    //     description: 'description for All Day Event',
                    //     start: '2023-04-03T16:00:00',
                    //     end: '2023-04-04T24:00:00'
                    // },
                    // {
                    //     title: 'Long Event',
                    //     description: 'description for Long Event',
                    //     start: '2023-04-07',
                    //     end: '2023-04-10'
                    // },
                    // {
                    //     title: 'Lunch',
                    //     description: 'description for Lunch',
                    //     start: '2023-03-12T12:00:00'
                    // },
                    // {
                    //     title: 'Meeting',
                    //     description: 'description for Meeting',
                    //     start: '2023-03-12T14:30:00'
                    // },
                    // {
                    //     title: 'Birthday Party',
                    //     description: 'description for Birthday Party',
                    //     start: '2023-03-13T07:00:00'
                    // },
                    // {
                    //     title: 'Click for Google',
                    //     description: 'description for Click for Google',
                    //     url: 'http://google.com/',
                    //     start: '2023-04-28'
                    // }
                ],
            });
            calendar.render();
        });
    </script>
</head>
<body>
    <div id="calendar"></div>

    <button onclick="goAddEvent()">이벤트 추가하러 가기</button>
    <script>
        function goAddEvent() {
            let windowOption = 'width=500, height=800, left=100, top=100,resizable=false';
            window.open("${pageContext.servletContext.contextPath}/adminAddEvent.do", "newWindow", windowOption);
        }
    </script>
</body>
</html>

