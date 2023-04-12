<%--
  Created by IntelliJ IDEA.
  User: ICT02-30
  Date: 2023-04-11
  Time: 오후 4:00
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
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script>

        function addVisitor(page) {
            $.ajax({
                url: "visitorLogs.do",
                type: "get",
                dataType: "json",
                data: {
                    page: page
                }
            });
        }

        $(document).ready(function() {
            const page = "${param.page}";
            addVisitor(page);
        });
    </script>
</head>
<body>

</body>
</html>
