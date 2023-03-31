<%--
  Created by IntelliJ IDEA.
  User: ICT02-30
  Date: 2023-03-31
  Time: 오후 2:33
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

    <script>
        document.addEventListener('DOMContentLoaded', function () {

            function hasDate() {
                let found = attendanceMonthly.find(e => e.start === '2023-03-31');
                // console.log(found);
                if(found === undefined) {
                    return true;
                } else { //출석 존재
                    return false;
                }
            }

            let calendarEl = document.getElementById('event-calendar');
            let attendanceMonthly = [
                {
                    title: '출석',
                    start: '2023-03-01',
                    overlap: false,
                    color: '#fc6c3f'
                },
                {
                    title: '출석',
                    start: '2023-03-03',
                    overlap: false,
                    color: '#fc6c3f'
                }
            ];
            // attendanceMonthly.push()
            let calendar = new FullCalendar.Calendar(calendarEl, {
                headerToolbar: {
                    left: 'addEventButton',
                    center: 'title',
                    right: ''
                },
                locale: 'kr',
                customButtons: {
                    addEventButton: {
                        text:"출석하기",
                        click : () => {
                            const date = new Date('2023-03-31');
                            if (!isNaN(date.valueOf())&&hasDate()) {// valid?
                                const today = {
                                    title: '출석',
                                    start: '2023-03-31',
                                    color: '#fc6c3f'
                                }
                                calendar.addEvent(today);
                                attendanceMonthly.push(today);
                                console.log(attendanceMonthly);
                                alert('출석 성공');
                            } else {
                                alert('출석 실패');
                            }
                        }
                    }
                },
                // initialDate: '2023-01-12',
                // navLinks: true, // can click day/week names to navigate views
                businessHours: true, // display business hours
                // editable: true,
                selectable: true,
                events: attendanceMonthly

            });
            calendar.render();
        });
    </script>

<%--    명언 --%>
    <script>
       window.onload = () => {
           let quote_data;
           fetch("https://api.adviceslip.com/advice")
               .then((response) => response.json())
               .then((data) => {
                   quote_data = data.slip.advice;
               });
            setInterval(()=>{
                document.getElementById("quote").innerHTML = quote_data;
            },300);

       }
    </script>


    <style>
        #event-calendar {
            max-width: 800px;
            margin: 0 auto;
            font-size: 20px;
            text-align: center;
            /*max-height: 70%;*/
            /*padding: 30px;*/
            /*margin: 30px;*/
            /*display: flex;*/
            /*justify-content: center;*/
        }

        /*#quote {*/
        /*    text-align: center;*/
        /*    font-size: 30px;*/
        /*    font-weight: bolder;*/
        /*    !*max-width: 70%;*!*/
        /*    display: flex;*/
        /*    justify-content: center;*/
        /*}*/

        #div-quote {
            display: flex;
            justify-content: center;
        }
    </style>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;800&display=swap');
        /* demo setup */
        *, *::before, *::after { margin: 0; padding: 0; box-sizing: border-box }
        body { min-height: 100vh; padding: 2rem; background-color: #EBEBEB; font-family: 'Open Sans', sans-serif; }
        body > * + *  { margin-top: 1.5em }
        h1{ text-align: center; font-weight: 800; color: rgb(6 6 6); text-transform: uppercase }
        blockquote { max-width: 25rem; margin-inline: auto }

        /* blockquote card colors */
        blockquote.q-card-color-1{
            --accent-color: rgb(32 32 54);
            --bg-color: rgb(30 145 254);
            --dot-color: rgb(255 255 255 / .35);
            --text-color: rgb(243 243 243);
            --text-color-author: rgb(243 243 243);
        }
        /* blockquote card setup*/
        blockquote.q-card{
            --padding: 1rem;
            padding: var(--padding);
            color: var(--text-color, black);
            font-weight: 600;
            background-color: var(--bg-color, white);
            display: grid;
            gap: 1rem;
            background-image: radial-gradient( circle, var(--dot-color, rgb(0 0 0 / .125)) calc(25% - 1px), transparent 25% );
            background-size: 0.5rem 0.5rem;
            border-radius: 0.25rem;
            box-shadow: 0.5rem 0.5rem 2rem rgb(0 0 0 / .5)

        }
        blockquote.q-card::before{
            --qHeight: 4rem;
            content: "";
            margin-left: calc(var(--padding) * -1);
            margin-top: calc(var(--padding) * -1);
            height: var(--qHeight);
            width: calc(var(--qHeight) * 1.1);
            background-image:
                    radial-gradient(
                            circle at bottom right,
                            transparent calc(var(--qHeight) / 4 - 1px),
                            var(--accent-color, black) calc(var(--qHeight) / 4) calc(var(--qHeight) / 2),
                            transparent calc(var(--qHeight) / 2 + 1px)
                    ),
                    linear-gradient(var(--accent-color, black), var(--accent-color, black));
            background-size: calc(var(--qHeight) / 2) calc(var(--qHeight) / 2);
            background-position: top left, bottom left;
            background-repeat: space no-repeat
        }


    </style>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp"/>
<div id="event-calendar">
    <%--        <full-calendar shadow options='{--%>
    <%--            "headerToolbar": {--%>
    <%--            "left": "",--%>
    <%--            "center": "title",--%>
    <%--            "right": ""--%>
    <%--            }--%>
    <%--        }' />--%>
</div>
<%--<button onclick="">출석하기</button>--%>
<br>
<%--<div class="q-card q-card-color-1">--%>
<%--&lt;%&ndash;    <div class="content" id="quote"></div>&ndash;%&gt;--%>
<%--</div>--%>

<div  id="div-quote">
    <blockquote class="q-card q-card-color-1">
        <div class="content" id="quote"></div>
    </blockquote>
</div>




<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
