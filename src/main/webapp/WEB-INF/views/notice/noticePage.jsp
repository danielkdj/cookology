<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ICT02-30
  Date: 2023-03-27
  Time: 오후 2:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <title>Cookology FAQ | PrepBootstrap</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/cookology/resources/css/FAQService/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css"
          href="/cookology/resources/css/FAQService/font-awesome/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="/resources/css/style.css" rel="stylesheet">
    <link href="/resources/css/responsive/responsive.css" rel="stylesheet">


    <script>

        $(document).ready(function () {
            $('.panel-heading a').on('click', function () {
                var currentPanel = $(this).attr('href');
                var currentPanelState = $(currentPanel).hasClass('in');

                if (currentPanelState) {
                    $('.panel-collapse').collapse('hide');
                    return;
                }

                $('.panel-collapse').collapse('hide');
                setTimeout(function () {
                    $(currentPanel).collapse('show');
                }, 150);
            });
        });
        function search() {
            var search = document.getElementById("searchBar").value;
            var searchType = "";
            if (document.getElementById("noticeAllRadio").checked) {
                searchType = "All";
            } else if (document.getElementById("noticeContentRadio").checked) {
                searchType = "Content";
            } else if (document.getElementById("noticeTitleRadio").checked) {
                searchType = "Title";
            }
            location.href = "nsearch"+searchType+".do?keyword=" + search; method="post";
        }


    </script>

</head>

</head>
<body>
<!-- Header Start -->
<c:import url="/WEB-INF/views/common/header.jsp"></c:import>
<!-- Header End -->


<!-- ****** QnA Start ****** -->
<div class="container">

    <div class="page-header">
        <a href="FAQPage.do"><h1>자주하는 질문(FAQ)</h1></a>&nbsp; &nbsp;
        <c:url var="qna" value="QNAPage.do">
            <c:param name="user_email" value="${ loginUser.user_email }"/>
        </c:url>
        <a href="${ qna }"><h1>질문하기(QNA)</h1></a>&nbsp; &nbsp;
        <a href="blist.do"><h1>공지사항</h1></a>
    </div>

    <!-- Bootstrap org.oaoc.cookology.FAQ - START -->
    <div class="container">
        <br/>
        <br/>
        <br/>

        <div class="alert alert-warning alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span
                    class="sr-only">Close</span></button>
            자주하는 질문 모아놨어요. 이곳에서 해결하지 못하면<strong>*질문하기를 이용해주세요*</strong>나머진 알아서해 ㅡㅡ
        </div>

        <br/>

        <!-- ****** QnA Start ****** -->


        <!-- ****** SearchBar Start ****** -->
        <style>
            #btn-brand {
                background-color: #FC6C3F;
                border-color: #FC6C3F;
                color: #FFFFFF;
            }

            #btn-brand:hover {
                background-color: #E95627;
                border-color: #E95627;
                color: #FFFFFF;
            }

            .input-group-prepend .input-group-text {
                display: flex;
                align-items: center;
                padding: 0 12px;
            }

            .input-group-prepend input[type="checkbox"] {
                height: 100%;
                margin: 0;
            }

            .input-group-prepend label {
                margin-left: 5px;
            }

            .form-control {
                height: auto;
            }
        </style>


        <c:if test="${ loginUser.is_admin  eq 'Y'}">

            <button class="event-button" onclick="javascript:location.href='movewrite.do';">
                공지하기
            </button>

        </c:if>
        <!-- ****** SearchBar Start ****** -->
        <div style="margin-top:35px;" class="container">
            <h2>NOTICE search</h2>
            <div class="input-group mb-15">
                <div class="input-group-prepend">
                    <div class="input-group-text">
                        <input class="radio143241" type="radio" id="noticeAllRadio" name="noticesearch"
                               aria-label="Radio for filtering by all" checked>
                        <label for="noticeAllRadio">All</label>
                    </div>
                    <div class="input-group-text">
                        <input class="radio143241" type="radio" id="noticeContentRadio" name="noticesearch"
                               aria-label="Radio for filtering by content">
                        <label for="noticeContentRadio">Content</label>
                    </div>
                    <div class="input-group-text">
                        <input type="radio" id="noticeTitleRadio" name="noticesearch"
                               aria-label="Radio for filtering by title">
                        <label for="noticeTitleRadio">Title</label>
                    </div>
                </div>
                <input type="text" class="form-control" placeholder="Search" id="searchBar">
                <div class="input-group-append">
                    <!-- search btn -->
                    <button id="btn-brand" class="btn btn-outline-secondary" type="button" onclick="search()">
                        Search
                    </button>
                    <!-- category accordion btn -->
                </div>
            </div>
        </div>
        <!-- ****** SearchBar End ****** -->
        <div class="panel-group" id="accordion">
            <div class="faqHeader"></div>
            <!-- "list" 변수 설정 -->


            <!-- Loop through the FAQ list and set an index variable -->
            <c:if test="${ loginUser.is_admin ne 'Y'}">
                <c:set var="list" value="${list}"/>
                <c:forEach items="${list}" var="L" varStatus="index">

                    <div class="panel panel-default" data-wow-delay=".(${ index }*2)s">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <!-- Change the href attribute to use an index to make it unique for each FAQ entry. -->
                                <!-- href 속성을 인덱스를 사용하도록 변경하여 각 FAQ 항목에 대해 고유하게 만듭니다. -->
                                <a id="toggle-link" class="accordion-toggle collapsed" data-toggle="collapse"
                                   data-parent="#accordion" href="#collapse${index.count}">${ L.noticetitle }</a>
                            </h4>
                        </div>
                        <!-- Change the id attribute to use an index to make it unique for each FAQ entry. -->
                        <!-- id 속성을 인덱스를 사용하도록 변경하여 각 FAQ 항목에 대해 고유하게 만듭니다. -->
                        <div id="collapse${index.count}" class="panel-collapse collapse">
                            <div class="panel-body">
                                    ${ L.noticecontent }
                            </div>
                        </div>

                    </div>
                    <%-- <c:url var="adminok" value="admincheck.do">
                       <c:param name="adminok" value="${ index }" />
                     </c:url>--%>

                </c:forEach>

            </c:if>


            <c:if test="${ loginUser.is_admin  eq 'Y'}">
                <c:set var="list" value="${list}"/>
                <c:forEach items="${list}" var="L" varStatus="index">

                    <div class="panel panel-default" data-wow-delay=".(${ index }*2)s">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <!-- Change the href attribute to use an index to make it unique for each FAQ entry. -->
                                <!-- href 속성을 인덱스를 사용하도록 변경하여 각 FAQ 항목에 대해 고유하게 만듭니다. -->
                                <a  <%--id="toggle-link"--%> class="accordion-toggle collapsed" data-toggle="collapse"
                                                             data-parent="#accordion"
                                                             href="#collapse${index.count}">${ L.noticetitle }</a>
                            </h4>
                        </div>
                        <!-- Change the id attribute to use an index to make it unique for each FAQ entry. -->
                        <!-- id 속성을 인덱스를 사용하도록 변경하여 각 FAQ 항목에 대해 고유하게 만듭니다. -->
                        <div id="collapse${index.count}" class="panel-collapse collapse">
                            <div class="panel-body">

                                    ${ L.noticecontent }
                                <c:url var="nmoveup" value="nmoveup.do">
                                    <c:param name="noticeno" value="${ L.noticeno }"/>
                                </c:url>
                                <button style="float: right" class="event-button"
                                        onclick="javascript:location.href='${ ndel }';">
                                    <i class="fas fa-question-circle"></i>X
                                </button>
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                <button style="float: right" class="event-button"
                                        onclick="javascript:location.href='${ nmoveup }';">
                                    <i class="fas fa-question-circle"></i>FAQ수정하기
                                </button>
                                <c:url var="ndel" value="ndel.do">
                                    <c:param name="noticeno" value="${ L.noticeno }"/>
                                </c:url>

                            </div>
                        </div>

                    </div>

                </c:forEach>

            </c:if>
        </div>
    </div>


    <!-- Bootstrap org.oaoc.cookology.FAQ - END -->

</div>
<c:import url="/WEB-INF/views/common/paging.jsp"></c:import>


<!-- Footer Start -->
<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
<!-- Footer End -->

</body>
</html>