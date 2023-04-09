<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출 관리 orderMerchantList</title>
 
<style type="text/css">
body {
  padding:1.5em;
  background: #f5f5f5
}

table {
  border: 1px #a39485 solid;
  font-size: .9em;
  box-shadow: 0 2px 5px rgba(0,0,0,.25);
  width: 100%;
  border-collapse: collapse;
  border-radius: 5px;
  overflow: hidden;
}


th {
  text-align: left;
}
  
thead {
  font-weight: bold;
  color: #fff;
  background: #73685d;
}
  
 td, th {
  padding: 1em .5em;
  vertical-align: middle;
}
  
 td {
  border-bottom: 1px solid rgba(0,0,0,.1);
  background: #fff;
}

a {
  color: #73685d;
}
  
 @media all and (max-width: 768px) {
    
  table, thead, tbody, th, td, tr {
    display: block;
  }
  
  th {
    text-align: right;
  }
  
  table {
    position: relative; 
    padding-bottom: 0;
    border: none;
    box-shadow: 0 0 10px rgba(0,0,0,.2);
  }
  
  thead {
    float: left;
    white-space: nowrap;
  }
  
  tbody {
    overflow-x: auto;
    overflow-y: hidden;
    position: relative;
    white-space: nowrap;
  }
  
  tr {
    display: inline-block;
    vertical-align: top;
  }
  
  th {
    border-bottom: 1px solid #a39485;
  }
  
  td {
    border-bottom: 1px solid #e5e5e5;
  }
  
  
  }
  
  /**/
  #pflex {
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-wrap: wrap;
}

#pNameDiv,
#appriceDiv {
  flex-basis: 45%;
}




#pNameDiv input[type="submit"],
#appriceDiv input[type="submit"],
div button {
  padding: 5px 10px;
  border: none;
  background-color: #4CAF50;
  color: white;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin-top: 10px;
  cursor: pointer;
}

#pNameDiv input[type="search"],
#appriceDiv input[type="search"] {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 10px;
  margin-bottom: 10px;
}

@media screen and (max-width: 768px) {
  #pflex {
    flex-direction: column;
  }
  #pNameDiv,
  #appriceDiv {
    flex-basis: 100%;
  }
}
 
</style>

<script type="text/javascript" 
	src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
<script type="text/javascript">

$(function(){
	showDiv();
	
	$('input[name=item]').on('change', function(){
		showDiv();
	});
	
}); //document.ready	

function showDiv(){
	
		$('#pNameDiv').css('display', 'block');	
	}

</script>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<hr>
<div class="breadcumb-area" style="background-image: url('${pageContext.servletContext.contextPath}/resources/img/catagory-img/3.jpg');">
    <div class="container h-100">
        <div class="row h-100 align-items-center">
            <div class="col-12">
                <div class="bradcumb-title text-center">
                    <h2>order management</h2>
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
                        <li class="breadcrumb-item active" aria-current="page"><a href="movemerchant.do">merchant</a></li>
                        <li class="breadcrumb-item active" aria-current="page">order management</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>

<h1 align="center">매출 관리</h1>
<!-- 목록 출력 영역 -->

<br>

<!-- 검색 항목 영역 -->
<%-- <center>
	<div id="pflex">
		<!-- 상품명 검색 -->
		<div id="pNameDiv">
			<form action="psearchProductName.do" method="post"> <!-- nsearchPname -->
				<label>상품명 입력 : 
					<input type="search" name="keyword">
				</label>
				<input type="submit" value="검색">
			</form>
		</div>
		<!-- <div>
			<button onclick="javascript:location.href='moveProductWrite.do';">상품 등록</button>
		</div> -->
	</div>
</center>
<br> --%>
<table>
    <thead>
    <tr>
        <th>주문번호</th>
        <th>상품명</th>
        			<!-- <th>상품가격</th> -->
        <th>상품 총 금액</th>
        <th>유저이메일</th>
       				 <!-- <th>유저연락처</th> -->
        <th>취소여부</th>
        <th>주문성공여부</th>
        <th>주문시간</th>
    </tr>
    
    <!-- 갯수 -->
    <!-- 상품명 누르면 주문한 상세 페이지로 넘어가게되고, 넘어가서 출력되야하는 값은
    주문번호, 상품명, 상품가격, 상품 갯수, 상품 총 금액, 유저 이메일, 유저 연락처, 주문시간 이 필요하다
    그러면 리스트에서 상품가격, 상품갯수는 받을 필요없고, 유저연락처도 필요없고, 
    상품 이름이랑 상품 총 금액만 받으면됨 -->
    
    
    
    
    
    
    </thead>
    <tbody>
    <!-- 주문번호 -->
	<c:forEach items="${ requestScope.list }" var="k">
	
		<tr>
		<td>${ k.orders_seq_id }</td>
	
		<!-- odetail.do 아직 못만듬 -->
			<!-- 상품명 클릭시 해당 상품 주문내용 보기로 넘어가게 함 -->
			<c:url var="kdt" value="/odetail.do">
				<c:param name="orders_seq_id" value="${ k.orders_seq_id }" />
			</c:url>
		
			<!-- 상품명 -->
			<td><a href="${ kdt }">${ k.product_name }</a></td>
		
			<!-- 상품 총 금액 -->
			<td>${ k.amount }</td>
		
			<!-- 유저이메일 -->
			<td>${ k.user_email }</td>
						
			<!-- 취소여부 -->
			<td>${ k.cancellation }</td> 

			<!-- 주문 성공 여부 -->
			<td>${ k.orders_success }</td> 
						
			<!-- 주문시간 -->
			<td>
				<fmt:formatDate value="${ k.create_at }"
             	pattern="yyyy-MM-dd" /> <!-- yyyy-MM-dd HH:mm -->
			</td>	
		</tr>
	</c:forEach>
    </tbody>
</table>

<hr>
<!-- 가맹점주만
	=> 가맹점주 로그인하면 버튼이 보이게 함
 -->
<br>
<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>