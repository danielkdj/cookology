<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 세션 세팅 -->
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <link rel="shortcut icon" href="/front_mo/images/favicon.png" />

    <title id="forDisplayIdTitle">Cookology : LoginPage</title>

    <link rel="stylesheet" type="text/css" href="/cookology/resources/css/login/mainStyle.css" />
    <link rel="stylesheet" type="text/css" href="/cookology/resources/css/login/jquery-ui.css" />
    <script src="/cookology/resources/js/login//main.js"></script>
    <script src="/cookology/resources/js/login/vendor.js"></script>
    <!-- sso 로그인 -->
    <script
      src="/pc/greating/js/etc_js/SsoHttpRequest.js?dt=20210705"
      type="text/javascript"
    ></script>
    <script
      src="/pc/greating/js/etc_js/SsoAjax.js"
      type="text/javascript"
    ></script>
    <!-- <script src="/pc/greating/js/etc_js/SsoHttpRequest2.js" type="text/javascript"></script> -->
    <script>
      var IS_SESSION = "N";
      var S_APP_TYPE = "";
      var S_APP_DEVICE_ID = "";
      var S_USER_AGENT_TYPE = "pc";
      var NAME_AUTO_LOGIN = "";
      var COMMENT_AUTO_LOGIN = "";
      var AUTO_LOGIN_TYPE = "";

      var SS_KAKAO_ID = "3ee3b3c91fa6a9e9be6b05253143a90b";
      var SS_GOOGLE_ID =
        "283629689379-jah2npvrit3jlp62lia82drph2vrgfru.apps.googleusercontent.com";
      var SS_SITE_DOMAIN = "https://www.greating.co.kr:443";

      var SS_LOGIN_ID = "";
      var SS_LOGIN_NM = "";
      var SS_PW_CHANGE_YN = "";
      var SS_MCUST_NO = "";
      var SS_BL_USER_YN = "";
      var SS_FS_CODE = "";
      var SS_LOGIN_TYPE = "";
      var SS_BAND_ID = "";
      var SS_SOCIAL_TYPE = "";
      var SS_HPOINT_JOIN_CODE = "";
      var SS_MCUST_NO_ENCRYPT = "";
      var SS_IS_HM_BUYER = "false";
      var SS_UR_USER_ID = "";
      var SS_GROUP_ID = "";
      var SS_B2C_CODE = "";
      var SS_B2B_CODE = "";
      var REQUEST_PATH_NAME = window.location.pathname;

      var SS_BAND_NAME = "";
      switch (SS_BAND_ID) {
        case "1":
          SS_BAND_NAME = "일반";
          break;
        case "2":
          SS_BAND_NAME = "사업자";
          break;
        case "3":
          SS_BAND_NAME = "임직원";
          break;
        case "4":
          SS_BAND_NAME = "특수";
          break;
        case "5":
          SS_BAND_NAME = "B2B제휴";
          break;
        case "6":
          SS_BAND_NAME = "B2C제휴";
          break;
        case "7":
          SS_BAND_NAME = "CS";
          break;
        default:
          "";
      }

      var SS_GROUP_NAME = "";
      switch (SS_GROUP_ID) {
        case "4":
          SS_GROUP_NAME = "Green";
          break;
        case "5":
          SS_GROUP_NAME = "White";
          break;
        case "6":
          SS_GROUP_NAME = "Friends";
          break;
        case "7":
          SS_GROUP_NAME = "Black";
          break;
        default:
          "";
      }

      window.addEventListener(
        "focus",
        function () {
          //console.log('homepage in');
        },
        false
      );


      // 통합회원 로그아웃 체크
      if (
        IS_SESSION == "Y" &&
        SS_LOGIN_TYPE == "1" &&
        sessionStorage.getItem("LOGIN_MCUST_NO") == null
      ) {
        if (location.host.indexOf("localhost") != 0) {
          gfnSsoReqHttp(fnSsoLogoutReqCallback);
        }
      }

      // SSO요청 처리 callback
      function fnSsoReqCallback(data) {
        console.log(data);
        if (data.succYn == "Y") {
          gfnSsoLogin(data.mcustNo);
        }
        if (
          sessionStorage.getItem("POPUP_YN") != "Y" &&
          data.mcustNo != null &&
          SS_HPOINT_JOIN_CODE == ""
        ) {
          sessionStorage.setItem("POPUP_YN", "Y");

          setTimeout(
            fnConfirm(
              "현재 고객님은 H.Point 회원입니다.\nH.Point 통합회원 정보로 그리팅에 회원가입이 가능합니다. 진행하시겠습니까?",
              function (e) {
                if (gfnServerCheck() == "REAL") {
                  // todo : carrot sso로그인 운영쪽으로 확정되면 주석 해제요망
                  HMEMBERSHIP_API_HOST = "https://www.h-point.co.kr"; //운영 - https
                } else {
                  HMEMBERSHIP_API_HOST = "https://dev.h-point.co.kr:29835"; //개발
                }

                var popTitle = "hpoint_popup";
                var action =
                  HMEMBERSHIP_API_HOST + "/cu/join/simpJoinStart.nhd";

                var hpointForm = document.createElement("form");
                hpointForm.setAttribute("method", "post");
                hpointForm.setAttribute("name", "hpointForm");
                hpointForm.setAttribute("id", "hpointForm");
                hpointForm.setAttribute("action", action);

                var prtnrId = document.createElement("input");
                prtnrId.setAttribute("type", "hidden");
                prtnrId.setAttribute("name", "prtnrId");
                prtnrId.setAttribute("value", "D050");
                hpointForm.appendChild(prtnrId);

                var chnnlId = document.createElement("input");
                chnnlId.setAttribute("type", "hidden");
                chnnlId.setAttribute("name", "chnnlId");
                chnnlId.setAttribute("value", "1402");
                hpointForm.appendChild(chnnlId);

                var ssoMcustNo = document.createElement("input");
                ssoMcustNo.setAttribute("type", "hidden");
                ssoMcustNo.setAttribute("name", "ssoMcustNo");
                ssoMcustNo.setAttribute("value", data.mcustNo);
                hpointForm.appendChild(ssoMcustNo);

                document.body.appendChild(hpointForm);

                console.log("SS_MCUST_NO_ENCRYPT: " + SS_MCUST_NO_ENCRYPT);
                console.log("SS_MCUST_NO:         " + data.mcustNo);

                var param =
                  "&prtnrId=" + $("#hpointForm").find("[name=prtnrId]").val();
                param +=
                  "&chnnlId=" + $("#hpointForm").find("[name=chnnlId]").val();
                param +=
                  "&ssoMcustNo=" +
                  $("#hpointForm").find("[name=ssoMcustNo]").val();
                param += "&ptcoReqnMdalInf=&ptcoReqnOnoflnGb=";
                console.log("param =====> : " + param);

                window.open("", popTitle); //팝업 창으로 띄우기. 원치 않으면 주석.

                hpointForm.target = popTitle;

                hpointForm.submit();
              }
            ),
            2
          );
        }
      }

      // sso로그아웃시 callback
      function fnSsoLogoutReqCallback(data) {
        if (data.succYn == "N") {
          gfnHLogout();
        }
      }
    </script>

    <style>
      .pop_wrap {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.6);
      }

      .pop_wrap__inner {
        position: absolute;
        top: 50%;
        left: 50%;
        min-width: 400px;
        padding: 30px;
        background: #fff;
        transform: translate3d(-50%, -50%, 0);
      }

      .pop_wrap__inner .pop_content {
        margin-bottom: 30px;
        text-align: center;
        font-size: 18px;
        line-height: 1.3;
      }

      .pop_content .btn_close {
        position: absolute;
        top: 30px;
        right: 20px;
        width: 30px;
        height: 20px;
        font: 0/0 a;
      }

      .pop_wrap__inner .btn.alert {
        width: 220px;
      }

      .pop_wrap__inner .btn.confirm {
        width: 440px;
      }

      .pop_wrap__inner .btn .btn-init {
        height: 60px;
        line-height: 60px;
        font-size: 20px;
        font-weight: 600;
      }

      .pop_wrap__inner .txt_link {
        display: block;
        margin-top: 20px;
        text-align: center;
        font-size: 16px;
        color: #555;
      }

      .pop_wrap__inner .txt_link span {
        display: inline-block;
        border-bottom: 1px solid #aaa;
        padding-bottom: 3px;
      }
    </style>
  </head>


 

  <!-- 2021.08.12 YSC Braze 솔루션 SDK 추가 -->
  <script type="text/javascript">
    var BRAZE_WEB_APP_ID = "7733d22e-db3b-44a4-aefb-ab3af50339d7";
    var BRAZE_SDK_BASE_URL = "sdk.iad-05.braze.com";
    var BRAZE_SDK_APPBOY_URL =
      "https://js.appboycdn.com/web-sdk/3.3/appboy.min.js";

    +(function (a, p, P, b, y) {
      a.appboy = {};
      a.appboyQueue = [];
      for (
        var s =
            "DeviceProperties Card Card.prototype.dismissCard Card.prototype.removeAllSubscriptions Card.prototype.removeSubscription Card.prototype.subscribeToClickedEvent Card.prototype.subscribeToDismissedEvent Banner CaptionedImage ClassicCard ControlCard ContentCards ContentCards.prototype.getUnviewedCardCount Feed Feed.prototype.getUnreadCardCount ControlMessage InAppMessage InAppMessage.SlideFrom InAppMessage.ClickAction InAppMessage.DismissType InAppMessage.OpenTarget InAppMessage.ImageStyle InAppMessage.Orientation InAppMessage.TextAlignment InAppMessage.CropType InAppMessage.prototype.closeMessage InAppMessage.prototype.removeAllSubscriptions InAppMessage.prototype.removeSubscription InAppMessage.prototype.subscribeToClickedEvent InAppMessage.prototype.subscribeToDismissedEvent FullScreenMessage ModalMessage HtmlMessage SlideUpMessage User User.Genders User.NotificationSubscriptionTypes User.prototype.addAlias User.prototype.addToCustomAttributeArray User.prototype.getUserId User.prototype.incrementCustomUserAttribute User.prototype.removeFromCustomAttributeArray User.prototype.setAvatarImageUrl User.prototype.setCountry User.prototype.setCustomLocationAttribute User.prototype.setCustomUserAttribute User.prototype.setDateOfBirth User.prototype.setEmail User.prototype.setEmailNotificationSubscriptionType User.prototype.setFirstName User.prototype.setGender User.prototype.setHomeCity User.prototype.setLanguage User.prototype.setLastKnownLocation User.prototype.setLastName User.prototype.setPhoneNumber User.prototype.setPushNotificationSubscriptionType InAppMessageButton InAppMessageButton.prototype.removeAllSubscriptions InAppMessageButton.prototype.removeSubscription InAppMessageButton.prototype.subscribeToClickedEvent display display.automaticallyShowNewInAppMessages display.destroyFeed display.hideContentCards display.showContentCards display.showFeed display.showInAppMessage display.toggleContentCards display.toggleFeed changeUser destroy getDeviceId initialize isPushBlocked isPushGranted isPushPermissionGranted isPushSupported logCardClick logCardDismissal logCardImpressions logContentCardsDisplayed logCustomEvent logFeedDisplayed logInAppMessageButtonClick logInAppMessageClick logInAppMessageHtmlClick logInAppMessageImpression logPurchase openSession registerAppboyPushMessages removeAllSubscriptions removeSubscription requestContentCardsRefresh requestFeedRefresh requestImmediateDataFlush resumeWebTracking setLogger setSdkAuthenticationSignature stopWebTracking subscribeToContentCardsUpdates subscribeToFeedUpdates subscribeToInAppMessage subscribeToNewInAppMessages subscribeToSdkAuthenticationFailures toggleAppboyLogging trackLocation unregisterAppboyPushMessages wipeData".split(
              " "
            ),
          i = 0;
        i < s.length;
        i++
      ) {
        for (
          var m = s[i], k = a.appboy, l = m.split("."), j = 0;
          j < l.length - 1;
          j++
        )
          k = k[l[j]];
        k[l[j]] = new Function(
          "return function " +
            m.replace(/\./g, "_") +
            "(){window.appboyQueue.push(arguments); return true}"
        )();
      }
      window.appboy.getCachedContentCards = function () {
        return new window.appboy.ContentCards();
      };
      window.appboy.getCachedFeed = function () {
        return new window.appboy.Feed();
      };
      window.appboy.getUser = function () {
        return new window.appboy.User();
      };
      (y = p.createElement(P)).type = "text/javascript";
      y.src = BRAZE_SDK_APPBOY_URL;
      y.async = 1;
      (b = p.getElementsByTagName(P)[0]).parentNode.insertBefore(y, b);
    })(window, document, "script");
    //initialize the SDK
    appboy.initialize(BRAZE_WEB_APP_ID, {
      baseUrl: BRAZE_SDK_BASE_URL,
    });

    appboy.registerAppboyPushMessages();
    appboy.display.automaticallyShowNewInAppMessages();

    //optionally set the current user's External ID
    if (
      SS_UR_USER_ID != "" &&
      SS_UR_USER_ID != null &&
      SS_UR_USER_ID != undefined
    ) {
      console.log("external_id set");
      appboy.changeUser(SS_UR_USER_ID);
    }

    if (SS_HPOINT_JOIN_CODE != 0) {
      appboy.getUser().setCustomUserAttribute("HMEMBER_YN", "Y");
    } // 통합회원여부
    if (SS_IS_HM_BUYER == "true") {
      appboy.getUser().setCustomUserAttribute("HM_MARKET_YN", "Y");
    } // 현대장터회원여부
    //if(AMORE_YN == "Y")			{ appboy.getUser().setCustomUserAttribute("AMORE_YN", "Y"); } 		// 아모레회원여부

    if (IS_SESSION == "Y") {
      appboy.getUser().setCustomUserAttribute("MEMBER_GRADE", SS_GROUP_NAME);

      var memberGroup;
      if (SS_BAND_ID == 5) {
        memberGroup = SS_BAND_NAME + "_" + SS_B2B_CODE;
      } else if (SS_BAND_ID == 6) {
        memberGroup = SS_BAND_NAME + "_" + SS_B2C_CODE;
      } else {
        memberGroup = SS_BAND_NAME;
      }
      appboy.getUser().setCustomUserAttribute("MEMBER_GROUP", memberGroup);

      if (document.referrer.indexOf("/login/login") > -1) {
        appboy.logCustomEvent("loginSuccess");
      }
    }

    // start (or continue) a session
    appboy.openSession();
    //appboy.logCustomEvent("prime-for-push");

    window.onload = function () {
      if (document.referrer.indexOf("/login/login") > -1) {
        fnAjax({
          url: "/biz/join/joinCompleteData",
          async: false,
          success: function (data) {
            // var userName = data.USER_NAME;
            var joinDate = data.JOIN_DATE;
            // var bday = data.BDAY;
            var healthInfoArr = data.HEALTH_INFO;
            var SMS_YN = data.SMS_YN;
            var PUSH_YN = data.PUSH_YN;

            appboy.logCustomEvent("changeSubscribe", {
              SMS_YN: SMS_YN,
              PUSH_YN: PUSH_YN,
            });

          },
        });
      }

      fnAjax({
        url: "/comn/st/getCodeList",
        params: { ST_COMN_CODE_MST_ID: "1504", USE_YN: "Y" },
        async: true,
        success: function (data) {
          var curUrl = document.location.href;
          var brazeContsYN = "";
          for (var i = 0; i < data.rows.length; i++) {
            var obj = data.rows[i];
            console.log("obj.CODE = " + obj.CODE);
            if (curUrl.indexOf(obj.CODE) > -1) {
              brazeContsYN = obj.CODE;
            }
          }
          if (
            brazeContsYN != null &&
            brazeContsYN != undefined &&
            brazeContsYN != ""
          ) {
            //call Braze
            console.log("brazeContsYN = " + brazeContsYN);
            appboy.logCustomEvent("showContentsView", {
              CONTENTS_NAME: brazeContsYN,
            });
          }
        },
      });
    };
  </script>


  <body id="login" class="hd">


 		<c:import url="/WEB-INF/views/common/header.jsp"/>

        <div class="login hd__inner450">
          <h2 class="hd__page-title">로그인</h2>
          <span class="hd__page-desc"
            >로그인을 하시면 다양한 혜택을 누리실 수 있습니다.</span
          >

          <!-- 일반회원 및 가맹점주 로그인 -->
          <div class="member-login">
            <form name="reqLoginForm" method="post" action="#">
              <input type="hidden" name="PW_CHANGE" id="pwChange" value="N" />
            </form>
            <ul class="tab-menu clearfix">
              <li
                class="tab-menu__list tab-menu__list--on"
                data-tab="hPointMember"
              >
                <a href="#">일반회원</a>
              </li>
              <li class="tab-menu__list" data-tab="greatingMember">
                <a href="#">가맹점주</a>
              </li>
            </ul>

            <!-- 일반회원 탭 -->
            <section class="tab-content tab-content--show" id="hPointMember">
              <form action="">
                <div class="input-area">
                  <div class="input-box">
                    <input
                      type="text"
                      class="input__text"
                      id="h_id"
                      title="아이디"
                      placeholder="아이디"
                      value=""
                      onkeyup="this.value=this.value.replace(/ /g, '')"
                      onchange="this.value=this.value.replace(/ /g, '')"
                    />
                  </div>

                  <div class="input-box">
                    <input
                      type="password"
                      class="input__text"
                      id="h_pw"
                      title="비밀번호"
                      placeholder="비밀번호"
                    />
                  </div>
                </div>

                <div class="checkbox-area clearfix">
                  <!-- 
                                <div class="hd-checkbox">
                                    <input type="checkbox" id="chk1" class="hidden" data-check="n">
                                    <label for="chk1">자동 로그인</label>
                                </div>
                                 -->

                  <div class="hd-checkbox">
                  </div>
                </div>

                <div class="member-btn btn">
                  <button type="button" class="btn-init green" id="h_loginBtn">
                    로그인
                  </button>
                </div>
              </form>
            </section>
            <!-- //일반회원 탭 -->

            <!-- 가맹점주 탭 -->
            <section class="box tab-content" id="greatingMember">
              <form action="">
                <div class="input-area">
                  <div class="input-box">
                    <input
                      type="text"
                      class="input__text"
                      id="id"
                      title="아이디"
                      placeholder="아이디"
                      value=""
                      onkeyup="this.value=this.value.replace(/ /g, '')"
                      onchange="this.value=this.value.replace(/ /g, '')"
                    />
                  </div>

                  <div class="input-box">
                    <input
                      type="password"
                      class="input__text"
                      id="pw"
                      title="비밀번호"
                      placeholder="비밀번호"
                    />
                  </div>
                </div>

                <div class="checkbox-area clearfix">

                <div class="member-btn btn">
                  <button type="button" class="btn-init green" id="loginBtn">
                    로그인
                  </button>
                </div>
              </form>
            </section>
            <!-- //가맹점주 탭 -->
            <ul class="login_link_box">
              <li><a href="/login/memberAccount/idFind">아이디 찾기</a></li>
              <li><a href="/login/memberAccount/pwFind">비밀번호 찾기</a></li>
              <li><a href="javascript:goMemberJoin();">회원가입</a></li>
            </ul>
          </div>
          <!-- //일반회원 밑 가맹점주 로그인 -->

          <div class="member-sns">
            <strong class="member-sns__title">SNS 로그인</strong>

            <ul class="box">
              <li class="box__list">
                <a href="javascript:goNaver();" class="sns-login-naver">
                  <img src="images/ico_member_naver.png" alt="" />
                  <span class="box__list__txt">네이버</span>
                </a>
              </li>
              <li class="box__list">
                <a href="javascript:loginWithKakao();" class="sns-login-kakao">
                  <img src="images/ico_member_kakao.png" alt="" />
                  <span class="box__list__txt">카카오</span>
                </a>
              </li>
              <li class="box__list">
                <a
                  href="javascript:;"
                  class="sns-login-google"
                  id="googleLoginBtn"
                >
                  <img src="images/ico_member_google.png" alt="" />
                  <span class="box__list__txt">구글</span>
                </a>

            </ul>
          </div>





    <!-- 공통 alert -->
    <div class="pop_wrap" id="alert-layer">
      <script type="text/x-handlebars-template" id="dvAlertLayerTemplate">
        <div class="pop_wrap__inner">
          <h2 class="pop_header hidden">alert</h2>

          <div class="pop_content">
            <div class="text">
              {{{MSG}}}
            </div>
          </div>

          <div class="btn_area btn alert">
            <button
              type="button"
              class="btn-init green"
              id="dvAlertOk"
            >확인</button>
          </div>
        </div>
      </script>
    </div>
    <!-- // 공통 alert -->

    <!-- 공통 confirm -->
    <div class="pop_wrap" id="confirm-layer">
      <script type="text/x-handlebars-template" id="dvConfirmLayerTemplate">
        <div class="pop_wrap__inner">
          <h2 class="pop_header hidden">confirm</h2>

          <div class="pop_content">
            <div class="text">
              {{{MSG}}}
            </div>
            <button
              type="button"
              class="btn_close btn--delete"
              style="visibility:hidden;"
            ></button>
          </div>

          <div class="btn_area btn confirm">
            <button
              type="button"
              class="btn-init white"
              id="dvConfirmCancel"
            >취소</button>
            <button
              type="button"
              class="btn-init green"
              id="dvConfirmOk"
            >확인</button>
          </div>
        </div>
      </script>
    </div>

    <!-- // 공통 confirm -->
    <div class="mask"></div>

    <!-- <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> -->
    <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
    <script src="/pc/greating/js/controller/common/controller-d0aab365ad8004854f721c39ec59ca40.js"></script>
    <script src="/pc/greating/js/controller/common/cmContollerUI-352a47a90f497cf85a798105fad0fb28.js"></script>
    <script src="/pc/greating/js/controller/common/cmHandlebars-6b38aec6d643390f5714a375f64d50a0.js"></script>
    <!-- 공통 Handlebars -->
    <script src="/pc/greating/js/controller/common/header-87cd46587f94c7afe9c9e64a5b1ac724.js"></script>
    <script src="/pc/greating/js/controller/common/pageController-4b5ae49e600026938d539f9134fa46ff.js"></script>
    <script src="/pc/greating/js/controller/search/searchController-eca20fd8a625f8d007c02d1ccc2cc7ba.js"></script>

    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script src="https://apis.google.com/js/api:client.js"></script>
   
   <c:import url="/WEB-INF/views/common/footer.jsp"/>
  </body>
</html>
