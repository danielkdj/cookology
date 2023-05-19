<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Favicon -->
    <link rel="icon" href="/cookology/resources/img/core-img/Cookology_logo.png" />
  <link rel="stylesheet" href="/cookology/resources/css/tracking.css"/>

  </head>

  <body>
    <!-- Header Start -->
    <c:import url="/WEB-INF/views/common/header.jsp"></c:import>
    <!-- Header End -->
    <!-- RecentViewPopup Start -->
    <c:import url="/WEB-INF/views/common/recentView.jsp"></c:import>
    <!-- RecentViewPopup End -->
    <!-- 스타일 속성을 적용하여 background-image webapp/resources/img/catagory-img/3.jpg 를 배경으로 한다. -->
    <div class="breadcumb-area">
      <div class="container h-100">
        <div class="row h-100 align-items-center">
          <div class="col-12">
            <div class="bradcumb-title text-center">
              <h2>배송조회</h2>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="breadcumb-nav">
      <div class="container">
        <div class="row">
          <div class="col-12">
            <nav aria-label="breadcrumb">
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="main.do"><i class="fa fa-home" aria-hidden="true"></i>Home</a></li>
                <li class="breadcrumb-item active" aria-current="page"><a href="trackingPage.do">배송조회</a></li>
              </ol>
            </nav>
          </div>
        </div>
      </div>
    </div>


    <br /><br /><br /><br /><br />
    <form
      action="trackingSearch.do"
      method="post"
      id="trackingForm"
      class="form-container"
      onsubmit="return setSelectedCompanyName();"
    >
      <div class="main-box">
        <div class="form-group">
          <input
            type="hidden"
            class="form-control"
            id="t_app_key"
            name="t_app_key"
            value="w0tFZtfXEq9lAyfsEBeffw"
          />
        </div>
        <div class="form-group">
          <input type="hidden" id="selectedCompanyName" name="selectedCompanyName" value="" />
          <select id="shippingCompanySelect" name="shippingCompanyName" onchange="setSelectedCompanyName();" required>
            <option value="" disabled selected>
              고객님의 택배 회사를 선택해주세요
            </option>
            <option value="01">우체국택배</option>
            <option value="04">CJ대한통운</option>
            <option value="05">한진택배</option>
            <option value="06">로젠택배</option>
            <option value="08">롯데택배</option>
            <option value="11">일양로지스</option>
            <option value="12">EMS</option>
            <option value="13">DHL</option>
            <option value="14">UPS</option>
            <option value="16">한의사랑택배</option>
            <option value="17">천일택배</option>
            <option value="18">건영택배</option>
            <option value="20">한덱스</option>
            <option value="21">FedEx</option>
            <option value="22">대신택배</option>
            <option value="23">경동택배</option>
            <option value="24">GS Postbox 택배</option>
            <option value="25">TNT Express</option>
            <option value="26">USPS</option>
            <option value="28">GSMNtoN</option>
            <option value="30">KGL네트웍스</option>
            <option value="32">합동택배</option>
            <option value="33">DHL Global Mail</option>
            <option value="34">i-Parcel</option>
            <option value="37">LX판토스</option>
            <option value="38">ECMS Express</option>
            <option value="40">굿투럭</option>
            <option value="41">GSI Express</option>
            <option value="42">CJ대한통운 국제특송</option>
            <option value="43">애니트랙</option>
            <option value="44">SLX택배</option>
            <option value="45">우리택배(구호남택배)</option>
            <option value="46">CU 편의점택배</option>
            <option value="47">우리한방택배</option>
            <option value="48">ACI Express</option>
            <option value="49">A.C.E EXPRESS INC</option>
            <option value="50">GPS Logix</option>
            <option value="51">성원글로벌카고</option>
            <option value="53">농협택배</option>
            <option value="54">홈픽택배</option>
            <option value="55">EuroParcel</option>
            <option value="57">Cway Express</option>
            <option value="60">YJS글로벌(영국)</option>
            <option value="63">은하쉬핑</option>
            <option value="65">YJS글로벌(월드)</option>
            <option value="66">Giant Network Group</option>
            <option value="67">디디로지스</option>
            <option value="69">대림통운</option>
            <option value="70">LOTOS CORPORATION</option>
            <option value="71">IK물류</option>
            <option value="72">성훈물류</option>
            <option value="73">CR로지텍</option>
            <option value="74">용마로지스</option>
            <option value="75">원더스퀵</option>
            <option value="77">LineExpress</option>
            <option value="79">로지스밸리택배</option>
            <option value="81">제니엘시스템</option>
            <option value="82">컬리넥스트마일</option>
            <option value="84">스마트로지스</option>
            <option value="85">풀앳홈</option>
            <option value="86">삼성전자물류</option>
            <option value="87">이투마스(ETOMARS)</option>
            <option value="88">큐런택배</option>
            <option value="89">두발히어로</option>
            <option value="90">위니아딤채</option>
            <option value="91">하이브시티</option>
            <option value="92">지니고 당일배송</option>
            <option value="93">팬스타국제특송(PIEX)</option>
            <option value="94">오늘의픽업</option>
            <option value="95">큐익스프레스</option>
            <option value="96">로지스밸리</option>
            <option value="97">에이씨티앤코아물류</option>
            <option value="99">롯데택배 해외특송</option>
            <option value="100">나은물류</option>
            <option value="101">한샘서비스원 택배</option>
            <option value="102">배송하기좋은날(SHIPNERGY)</option>
            <option value="103">NDEX KOREA</option>
            <option value="104">도도플렉스(dodoflex)</option>
            <option value="105">BRIDGE LOGIS</option>
            <option value="106">허브넷로지스틱스</option>
            <option value="107">LG전자(판토스)</option>
            <option value="108">MEXGLOBAL</option>
            <option value="109">파테크해운항공</option>
            <option value="110">부릉</option>
            <option value="111">SBGLS</option>
            <option value="112">1004홈</option>
            <option value="113">썬더히어로</option>
            <option value="114">캐나다쉬핑</option>
            <option value="116">(주)팀프레시</option>
            <option value="117">YUNDA EXPRESS</option>
            <option value="118">롯데칠성</option>
            <option value="119">핑퐁</option>
            <option value="120">발렉스 특수물류</option>
            <option value="121">바바바(bababa)</option>
            <option value="122">BAIMA EXPRESS</option>
            <option value="123">엔티엘피스</option>
            <option value="124">LTL</option>
            <option value="125">GTS로지스</option>
            <option value="126">㈜올타코리아</option>
            <option value="127">로지스팟</option>
            <option value="128">판월드로지스틱㈜</option>
            <option value="129">홈픽 오늘도착</option>
            <option value="130">UFO로지스</option>
            <option value="131">딜리래빗</option>
            <option value="132">지오피</option>
            <option value="134">에이치케이홀딩스</option>
            <option value="135">HTNS</option>
            <option value="136">케이제이티</option>
            <option value="137">더바오</option>
            <option value="138">라스트마일</option>
            <option value="139">오늘회 러쉬</option>
            <option value="140">직구문</option>
            <option value="141">인터로지스</option>
            <option value="142">탱고앤고</option>
            <option value="143">투데이</option>
            <option value="144">큐브플로우(CUBEFLOW)</option>
            <option value="145">현대글로비스</option>
            <option value="146">국제로지스틱(KSE)</option>
            <option value="147">에스더쉬핑</option>
            <option value="148">ARGO</option>
            <option value="149">골드스넵스</option>
            <option value="151">자이언트</option>
            <option value="152">(주)엠티인터내셔널</option>
            <option value="153">(주)이지로지스틱</option>
            <option value="154">KT EXPRESS(케이티익스프레스)</option>
            <option value="155">HY</option>
            <option value="156">유피로지스</option>
            <option value="157">우진인터로지스</option>
          </select>

        </div>
        <div class="form-group">
          <input
            type="text"
            class="form-control"
            name="tracking_number"
            id="tracking_number"
            placeholder="운송장 번호"
            oninput="numericOnly(this);"
            required
          />
        </div>
      </div>
      <button type="submit" id="submitBtn" class="btn">조회하기</button>
    </form>

    <br><br><br>

    <!-- Footer Start -->
    <c:import url="/WEB-INF/views/common/footer.jsp"></c:import>
    <!-- Footer End -->


    <script type="text/javascript">
      function setSelectedCompanyName() {
        const shippingCompanySelect = document.getElementById("shippingCompanySelect");
        const selectedCompanyName = shippingCompanySelect.options[shippingCompanySelect.selectedIndex].text;

        // Set the value of the hidden input field
        document.getElementById("selectedCompanyName").value = selectedCompanyName;

        // Return true to allow form submission
        return true;
      }

      /*-------------------------*/
      function numericOnly(input) {
        input.value = input.value.replace(/\D/g, "");
      }

      function validateForm() {
        const shippingCompanySelect = document.getElementById(
          "shippingCompanySelect"
        );
        const trackingNumber = document.getElementById("tracking_number").value;

        if (shippingCompanySelect.value === "") {
          alert("Please select a shipping company.");
          return false;
        }

        if (trackingNumber.trim() === "") {
          alert("Please enter a tracking number.");
          return false;
        }

        return true;
      }

    </script>

  </body>
</html>
