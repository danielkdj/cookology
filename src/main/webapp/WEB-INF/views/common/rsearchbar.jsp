<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="description" content="">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- Title -->
  <title>Cookology - 레시피</title>
  <!-- Favicon -->
  <link rel="icon" href="img/core-img/favicon.ico">
  <!-- Add Bootstrap and other stylesheets -->
  <script src="js/active.js"></script>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper-cjs"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <style>
    .blog_area .container .justify-content-left {
      display: flex;
      justify-content: flex-start;
    }

    .form-check recipe {
      background-color: #FC6C3F;
      border-color: #FC6C3F;
      color: #FFFFFF;
    }

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

    #btn-brand1 {
      background-color: #FC6C3F;
      border-color: #FC6C3F;
      color: #FFFFFF;
    }

    #btn-brand1:hover {
      background-color: #E95627;
      border-color: #E95627;
      color: #FFFFFF;
    }

    #btn-brand2 {
      background-color: #FC6C3F;
      border-color: #FC6C3F;
      color: #FFFFFF;
    }

    #btn-brand2:hover {
      background-color: #E95627;
      border-color: #E95627;
      color: #FFFFFF;
    }

    #sbtn-brand2 {
      background-color: #FC6C3F;
      border-color: #FC6C3F;
      color: #FFFFFF;
    }

    #sbtn-brand2:hover {
      background-color: #E95627;
      border-color: #E95627;
      color: #FFFFFF;
    }

    #btn-brand3 {
      background-color: #FC6C3F;
      border-color: #FC6C3F;
      color: #FFFFFF;
    }

    #btn-brand3:hover {
      background-color: #E95627;
      border-color: #E95627;
      color: #FFFFFF;
    }
  </style>
  <script>
    $(document).ready(function() {
      $('#btn-brand1').click(function() {
        $('#allergyAccordion').collapse('toggle');
      });
    });
  </script>

    </head>
</html>
<body>
<!-- ****** SearchBar Start ****** -->
<div class="container">
  <h4>Search</h4>
  <c:choose>
  <c:when test="${not empty sessionScope.user_email}">
  <form action="optionsearch.do" method="post">
    </c:when>
    <c:otherwise>
    <form action="rsearchlist.do" method="post">
      </c:otherwise>
      </c:choose>
      <div class="input-group mb-3">
        <input type="text" class="form-control" placeholder="Search recipe..." id="searchBar" name="keyword">
        <div class="input-group-append">
          <!-- search btn -->
          <button id="btn-brand" class="btn btn-outline-secondary" type="submit">Search</button>
          <!-- allergy checkbox btn -->
          <button id="btn-brand1" class="btn btn-outline-secondary" type="button">Allergy</button>
        </div>
      </div>
    </form>
</div>
<!-- ****** SearchBar End ****** -->

<!-- ****** Allergy Checkboxes Start ****** -->
<div class="container">
  <div id="allergyAccordion" class="collapse">
    <h6 style="margin-top:50px;">Remove allergies</h6>
    <div class="row">
      <div class="col-md-6">
        <div class="form-check recipe">
          <input type="checkbox" class="form-check-input" id="10">
          <label class="form-check-label" for="10">알류</label>
        </div>
        <div class="form-check recipe">
          <input type="checkbox" class="form-check-input" id="20">
          <label class="form-check-label" for="20">유제품</label>
        </div>
        <div class="form-check recipe">
          <input type="checkbox" class="form-check-input" id="30">
          <label class="form-check-label" for="30">땅콩</label>
        </div>
        <div class="form-check recipe">
          <input type="checkbox" class="form-check-input" id="40">
          <label class="form-check-label" for="40">견과류</label>
        </div>
        <div class="form-check recipe">
          <input type="checkbox" class="form-check-input" id="50">
          <label class="form-check-label" for="50">밀</label>
        </div>
      </div>
      <div class="col-md-6">
        <div class="form-check recipe">
          <input type="checkbox" class="form-check-input" id="60">
          <label class="form-check-label" for="60">참깨</label>
        </div>
        <div class="form-check recipe">
          <input type="checkbox" class="form-check-input" id="70">
          <label class="form-check-label" for="70">콩(대두)</label>
        </div>
        <div class="form-check recipe">
          <input type="checkbox" class="form-check-input" id="80">
          <label class="form-check-label" for="80">과일 및 채소</label>
        </div>
        <div class="form-check recipe">
          <input type="checkbox" class="form-check-input" id="90">
          <label class="form-check-label" for="90">해산물 및 조개류</label>
        </div>
        <div class="form-check recipe">
          <input type="checkbox" class="form-check-input" id="100">
          <label class="form-check-label" for="100">육류</label>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- ****** Allergy Checkboxes End ****** -->
</body>
</html>
