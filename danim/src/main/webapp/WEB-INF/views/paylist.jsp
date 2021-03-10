<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>


<style type="text/css">
/* 보유다님코인 나의결제내역 포인트전환 */
.area_navigation {
	position: relative;
	margin: 0 auto;
	width: 1080px;
	zoom: 1;
}

.area_navigation .an_l li {
	position: relative;
	float: left;
	padding-top: 16px;
	padding-right: 114px;
	zoom: 1;
}

.area_navigation .an_item {
	float: left;
}

li {
	display: list-item;
	text-align: -webkit-match-parent;
}
/* 보유다님코인 나의결제내역 포인트전환 */
</style>


<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<title>다님코인 충전소</title>

<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Lato:700%7CMontserrat:400,600"
	rel="stylesheet">

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet"
	href="/danim/resources/css/bootstrap.min.css" />

<!-- Font Awesome Icon -->
<link rel="stylesheet" href="/danim/resources/css/font-awesome.min.css">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet"
	href="/danim/resources/css/style.css" />

<link type="text/css" rel="stylesheet"
	href="/danim/resources/css/nkstyle.css" />

<link rel="stylesheet" type="text/css"
	href="https://unpkg.com/magic-input/dist/magic-input.min.css">

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	function logout() {
		alert = "로그아웃 되었습니다.";
	}
</script>

<script type="text/javascript">
	function fontcolor(){
		/* alert("aaa");
		if($('#cate').val == '출금'){
			alert(czxczxc);
		$('#cate').css({
            'color': red;
          });
		}; */
		
		/* alert("tlqkf");
		var str = ${paylist.category };
		var result = str.fontcolor("red");
		document.getElemnetById("cate").innerHTML = result; */
		
}
</script>

</head>
<body>
	<c:import url="headfoot/header.jsp" />
	<!-- Hero-area -->
	<div class="hero-area section">

		<!-- Backgound Image -->
		<div class="bg-image bg-parallax overlay"
			style="background-image: url(/danim/resources/img/page-background.jpg)"></div>
		<!-- /Backgound Image -->

		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-offset-1 text-center">
					<ul class="hero-area-tree">
						<li><a href="userChange.do">Danim:</a></li>
					</ul>
					<h1 class="white-text">나의 결제내역 보기</h1>
				</div>
			</div>
		</div>

	</div>
	<!-- /Hero-area -->

	<!-- My Info -->
	<div id="information" class="section">

		<!-- container -->
		<div class="container">
			<div class="area_navigation" role="navigation" style="margin:0;">
				<div class="a">
					<h2>나의 결제 내역 보기</h2>
				</div>
				<div class="b">
					<a href="payment2.do?userid=${loginUser.getUserid()}"style="color: #fcc159">다님코인 충전하기<a>></a></a>
					<a href="change.do?userid=${loginUser.getUserid()}"style="color: #fcc159">포인트 전환하기</a><a>></a>
					<a href="nkevent.do?userid=${loginUser.getUserid()}"style="color: #fcc159">출석 이벤트 하러가기!</a><a>></a>
					<%-- <a href="coupon.do?userid=${loginUser.getUserid()}"style="color: #fcc159">쿠폰 받으러가기</a><a>></a> --%>
				</div>
		</div>
		<!-- container/ -->
			<hr style="border-color: #fcc159; margin-top:0;">
			<br><br>
	<!-- 게시판 -->
	<div class="container">
		<div class = "row">
			<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
				
				<thead>
					<tr>
						<!-- <th style="background-color: #ffffff; text-align: center;">번호</th> -->
						<th style="background-color: #eeeeee; text-align: center;">충전금액</th>
						<th style="background-color: #ffffff; text-align: center;">카테고리</th>
						<th style="background-color: #eeeeee; text-align: center;">충전날짜</th>
						<th style="background-color: #ffffff; text-align: center;">결제상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="paylist" items="${paymentboardlist }" varStatus="status">
					    <c:if test="${paylist.paymoney != null}">
					    	<tr>
					    	  <!-- 결제 금액 및 환전 금액 출력 -->
					    	  <c:if test="${paylist.category eq '충전'}">
					    	  	<!-- 금액 콤마 없는거 -->
					    	  	<%-- <td class="course-price course-free" align="center" style="color: green;">￦ ${paylist.paymoney }원</td> --%>
					    	  	
					    	  	<!-- 금액 콤마 넣은거 -->
					    	  	<td class="course-price course-free" align="center" style="color: green;"><fmt:formatNumber value="${paylist.paymoney }" pattern="#,###.##"/>원</td>
					    	  </c:if>
					    	  <c:if test="${paylist.category eq '출금'}">
					    	  	<!-- 금액 콤마 없는거 -->
					    	  	<%-- <td class="course-price course-premium" align="center" style="color: #f26622;">-￦ ${paylist.paymoney }원</td> --%>
					    	  	
					    	  	<!-- 금액 콤마 넣은거 -->
					    	  	<td class="course-price course-premium" align="center" style="color: #f26622;">-<fmt:formatNumber value="${paylist.paymoney }" pattern="#,###.##"/>원</td>
					    	  </c:if>
					    	  <!-- 카테고리 (충전, 환전)-->
					    	  <td id="cate" align="center" onclick="fontcolor()">${paylist.category }</td>
					    	  <!-- 결제 및 환전 일자 -->
					    	  <td align="center">${paylist.paymentdate }</td>
					    	  <!-- 충전 및 출금 출력 -->
					    	  <td align="center">${paylist.division }</td>
					    	</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
			<div class="row">
			
			<!-- pagination -->
							<div class="col-md-12">
								<div class="post-pagination">
									<c:if test="${paging.currentpage gt 1 }">
										<a href="paylist.do" class="pagination-back pull-left">처음으로</a>
									</c:if>
									<!-- 이전 버튼 -->
									<ul class="pages">
										<c:forEach var="p" begin="${paging.startpage }" end="${paging.endpage }" step="1">
											<c:if test="${p eq paging.currentpage }">
													<li class="active">${ p }</li>
											</c:if>
											<c:if test="${p ne paging.currentpage }">
												<li><a href="paylist.do?page=${ p }&userid=${loginUser.getUserid()}">${p}</a></li>
											</c:if>
										</c:forEach>
										
									</ul>
									<a href="paylist.do?page=${page+1}&userid=${loginUser.userid}" class="pagination-next pull-right">다음</a>
								</div>
							</div>
							<br><br><br>
							<!-- pagination -->
						</div>
						<!-- /row -->			
				<br><br>
				<a class="main-button icon-button pull-left"
				onclick="javascript:history.back()" style="margin-right: 2%;">뒤로가기</a>&nbsp;
				<!-- <a class="main-button icon-button pull-right"
				onclick="selectDelete()" style="margin-right: 2%;">선택 환불 신청하기</a>&nbsp; -->
		</div>
	</div>
	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>

			<!-- Footer -->
			<footer id="footer" class="section">

				<!-- container -->
				<div class="container">

					<!-- row -->
					<div class="row">

						<!-- footer logo -->
						<div class="col-md-6">
							<div class="footer-logo">
								<a class="logo" href="userChange.do"> <img
									src="/danim/resources/img/logo.png" alt="logo">
								</a>
							</div>
						</div>


					</div>
					<!-- /row -->

					<!-- row -->
					<div id="bottom-footer" class="row">

						<!-- social -->
						<div class="col-md-4 col-md-push-8">
							<ul class="footer-social">
								<li><a href="#" class="facebook"><i
										class="fa fa-facebook"></i></a></li>
								<li><a href="#" class="instagram"><i
										class="fa fa-instagram"></i></a></li>
								<li><a href="#" class="github"><i class="fa fa-github"></i></a></li>
							</ul>
						</div>
						<!-- /social -->

						<!-- copyright -->
						<div class="col-md-8 col-md-pull-4">
							<div class="footer-copyright">
								<span>&copy; Copyright Koo gun mo. | This Poroject is
									made with Kim nam gyu & You young joon</a>
								</span>
							</div>
						</div>
						<!-- /copyright -->

					</div>
					<!-- row -->

				</div>
				<!-- /container -->

			</footer>
			<!-- /Footer -->
	<script type="text/javascript">
		function selectDelete(){}
	</script>
	
	<%-- <input type="text" id="username" value="${loginUser.getUsername() }" hidden="true">
	<input type="text" id="userid" value="${loginUser.getUserid() }" hidden="true">
	<input type="text" id="userphone" value="${loginUser.getPhone() }" hidden="true">
	<input type="text" id="account" value="${loginUser.getAccount() }" hidden="true">
	<input type="text" id="accountname" value="${loginUser.getAccountname() }" hidden="true"> --%>	
	
	
	<!-- <!-- 환불 api 작성중
	<script
    src="https://code.jquery.com/jquery-3.3.1.min.js"
    integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>jQuery CDN -
  <script>
    function cancelPay() {
      jQuery.ajax({
        "url": "http://www.myservice.com/payments/cancel",
        "type": "POST",
        "contentType": "application/json",
        "data": JSON.stringify({
          "merchant_uid": "mid_" + new Date().getTime(), // 주문번호
          "cancel_request_amount": 2000, // 환불금액
          "reason": "테스트 결제 환불" // 환불사유
          "refund_holder": "홍길동", // [가상계좌 환불시 필수입력] 환불 가상계좌 예금주
          "refund_bank": "88" // [가상계좌 환불시 필수입력] 환불 가상계좌 은행코드(ex. KG이니시스의 경우 신한은행은 88번)
          "refund_account": "56211105948400" // [가상계좌 환불시 필수입력] 환불 가상계좌 번호
        }),
        "dataType": "json"
      });
    }
  </script> -->
	
	
	
	
</body>
</html>