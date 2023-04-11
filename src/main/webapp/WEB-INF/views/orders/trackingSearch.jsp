<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Cookology</title>
  <!-- Favicon -->
  <link rel="icon" href="/cookology/resources/img/core-img/Cookology_logo.png" />
  <link rel="stylesheet" href="/cookology/resources/css/tracking/bootstrap_tracking.css" />
  <link rel="stylesheet" href="/cookology/resources/css/tracking/tracking.css" />
<style>
  body {
    width: 40vw;
    margin: 0 auto;
  }
  a:link {
    color: black;
    text-decoration: none;
  }
  a:visited {
    color: black;
    text-decoration: none;
  }
  a:hover {
    color: black;
    text-decoration: none;
  }
  a:active {
    color: black;
    text-decoration: none;

  }

</style>
</head>
<body>
<div class="header-area"><a href="main.do">메인페이지로 이동</a></div>
<div class="title-content">
  <div class="title-notice">운송장 번호</div>
  <div class="title-invoice">${param.tracking_number}</div>
  <div class="title-company">${param.selectedCompanyName}</div>
</div>

<div class="col-xs-12 info-area no-padding">
  <div class="info-back-line">
    <div class="col-xs-15 text-center">
      <img
              src="/cookology/resources/img/tracking/ic_tropical_delivery_step1_off.png"
              class="parcel-img"
      />
      <div class="info-parcel-text-none">상품인수</div>
    </div>
    <div class="col-xs-15 text-center">
      <img
              src="/cookology/resources/img/tracking/ic_tropical_delivery_step2_off.png"
              class="parcel-img"
      />
      <div class="info-parcel-text-none">상품이동중</div>
    </div>

    <div class="col-xs-15 text-center">
      <img
              src="/cookology/resources/img/tracking/ic_tropical_delivery_step3_off.png"
              class="parcel-img"
      />
      <div class="info-parcel-text-none">배송지도착</div>
    </div>
    <div class="col-xs-15 text-center">
      <img
              src="/cookology/resources/img/tracking/ic_tropical_delivery_step4_off.png"
              class="parcel-img"
      />
      <div class="info-parcel-text-none">배송출발</div>
    </div>

    <div class="col-xs-15 text-center">
      <img src="/cookology/resources/img/tracking/ic_tropical_delivery_step5_on.png" class="parcel-img" />
      <div class="info-parcel-text-active">배송완료</div>
    </div>
  </div>
</div>

<div
        class="col-xs-12 tracking-status-item-list"
        style="padding-left: 0px; padding-right: 0px"
>
  <div class="tracking-status-item">
    <div class="list-circle"></div>
    <span class="location-text">서울 마포구 백범로 23</span> |
    <span class="status-text">배송완료</span>
    <div class="time-text">2023-04-14 12:30:55</div>
    <div class="vertical-line"></div>
  </div>

  <div class="tracking-status-item">
    <div class="list-circle"></div>
    <span class="location-text">서울 남대문</span> |
    <span class="status-text">배송출발</span>
    <div class="time-text">2023-04-14 07:30:20</div>
    <div class="vertical-line"></div>
  </div>

  <div class="tracking-status-item">
    <div class="list-circle"></div>
    <span class="location-text">남서울터미널</span> |
    <span class="status-text">배달전</span>
    <div class="time-text">2023-04-13 20:45:20</div>
    <div class="vertical-line"></div>
  </div>
  <div class="tracking-status-item">
    <div class="list-circle"></div>
    <span class="location-text">대전HUB</span> |
    <span class="status-text">간선상차</span>
    <div class="time-text">2023-04-13 08:57:10</div>
    <div class="vertical-line"></div>
  </div>
  <div class="tracking-status-item">
    <div class="list-circle"></div>
    <span class="location-text">성북직영</span> |
    <span class="status-text">집하처리</span>
    <div class="time-text">2023-04-12 11:30:00</div>
    <div class="vertical-line"></div>
  </div>
  <div class="tracking-status-item">
    <div class="list-circle"></div>
    <span class="location-text">고객</span> |
    <span class="status-text">인수자등록</span>
    <div class="time-text">2023-04-12 10:42:50</div>
    <div class="vertical-line"></div>
  </div>
</div>
<div class="col-xs-12 notice-area">
  <img src="/cookology/resources/img/tracking/ic_info-24px.png" style="width: 20px; margin-right: 5px" />
  <span class="template-notice">
        배송 정보 제공 : 스윗트래커 스마트택배API
      </span>
</div>
<div class="col-xs-12 banner-area" style="text-align: center">
  <img
          src="/cookology/resources/img/tracking/banner_tropical.png"
          style="width: 100%; max-width: 450px; cursor: pointer"
  />
</div>
<script src="/cookology/resources/js/jquery-3.6.3.min.js"></script>
<script src="/cookology/resources/js/bootstrap.min.js"></script>

</body>
</html>
