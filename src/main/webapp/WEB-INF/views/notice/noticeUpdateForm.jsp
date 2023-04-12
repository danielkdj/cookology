<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8" />
  <title>Cookology FAQ  | PrepBootstrap</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <link rel="stylesheet" type="text/css" href="/cookology/resources/css/style.css" />
  <link rel="stylesheet" type="text/css" href="/cookology/resources/css/FAQService/font-awesome/css/font-awesome.min.css" />

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" crossorigin="anonymous"/>
  <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
  <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

</head>
<style>
  .event-button {
    background-color: rgba(255, 131, 87, 1);
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s;
  }

  .event-button:hover {
    background-color : rgba(255, 131, 255, 1);
  }
  .event-button i {
    margin-right: 5px;
  }

</style>
<body>
<!-- Header Start -->
<c:import url="/WEB-INF/views/common/header.jsp" />
<!-- Header End -->

<form action="nupdate.do">
  <input type="hidden" name="noticeno" value="${ notice.noticeno }">
    <input type="hidden" name="noticewriter" value="${ notice.noticewriter }">
  <div class="inquiry-section section_padding_100">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <div class="section-heading text-center">
            <h2>FAQ 수정하기</h2>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-12">
          <form action="#" method="post">
            <div class="row">
              <div class="col-12">
                <div class="form-group">
                  <label >번호 *</label>
                  <input type="text" class="form-control" value="${ notice.noticeno }" readonly>
                </div>
              </div>
              <div class="col-12">
                <div class="form-group">
                  <label>질문 *</label>
                  <input type="text" class="form-control" name="frequentlyAsked" value="${ notice.noticetitle }" required>
                </div>
              </div>
              <div class="col-12">
                <div class="form-group">
                  <label>답변 *</label>
                  <textarea class="form-control" name="questions" rows="5"  required>${ notice.noticecontent }</textarea>
                </div>
              </div>
              <div class="col-12">
                <button class="event-button" type="submit" value="수정되었습니다.">
                  <i class="fas fa-question-circle"></i>수정하기
                </button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</form>

<!-- Footer Start -->
<c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
<!-- Footer End -->
</body>

</html>