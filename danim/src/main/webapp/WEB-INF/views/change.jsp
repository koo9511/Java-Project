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

<title>포인트 전환하기</title>

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

</head>
<body>
<!-- Header -->
<c:import url="headfoot/header.jsp" />
		<!-- /Header -->
		<!-- Hero-area -->
		<div class="hero-area section">

			<!-- Backgound Image -->
			<div class="bg-image bg-parallax overlay" style="background-image:url(/danim/resources/img/page-background.jpg)"></div>
			<!-- /Backgound Image -->
			
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 text-center">
						<ul class="hero-area-tree">
							<li><a href="userChange.do">Danim:</a></li>
						</ul>
						<h1 class="white-text">포인트 전환하기</h1>

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
					<h2>다님코인 환전하기</h2>
				</div>
				<div class="b">
					<a href="payment2.do?userid=${loginUser.getUserid()}"style="color: #fcc159">다님코인 충전하기<a>></a></a>
					<a href="paylist.do?userid=${loginUser.getUserid()}"style="color: #fcc159">나의 결제 내역 보기</a><a>></a>
					<a href="nkevent.do?userid=${loginUser.getUserid()}"style="color: #fcc159">출석 이벤트 하러가기!</a><a>></a>
					<%-- <a href="coupon.do?userid=${loginUser.getUserid()}"style="color: #fcc159">쿠폰 받으러가기</a><a>></a> --%>
				</div>
		</div>
		<!-- container/ -->
			<hr style="border-color: #fcc159; margin-top:0;">
			<br>
<div class="out" style="">
	<div class="in left" style=" width:600px;">
		<div name="frm_nk">
			<span style="font-size:20px;">보유 다님 코인
				<a style="color: #fcc159;">${loginUser.money}</a>코인
			</span><br>
				<input id="tt" class="ttt" type="number" min="5000" max="${loginUser.money }" name="name" placeholder="최소금액 5,000원 이상 가능합니다."
					style="vertical-align: bottom; width:350px;" onkeydown="javaScript:enterkey();">
				<input class="main-button icon-button pull-right" type="button" value="변환하기" onclick="namgyu()"><br>
		</div>
		<br>
		<div>
		<a style="color:red;">※금액 입력 시 숫자만 입력이 가능합니다.</a>
		</div>
	</div>
	<!--  /in left -->
</div>
<!-- /out -->

<br><br>
	<div class="ulclass" style="margin-left:0px;">
		<h4>코인 환전 시 주의사항</h4>
		
			<ul style="margin:0; padding:0;">
				<li>-코인 환전 후 에는 철회가 불가능 하오니 이점 유의하여 코인 환전을 부탁드립니다.</li>
				<li>-소지한 코인보다 많은 금액을 환전 할 수 없으며, 최소 금액은 5,000원 입니다.</li>
				<li>-다님코인을 결제하여 다님코인으로 고의적인 악욕을 할 경우 법적 책임은 본인에게 
				있으니 주의바랍니다.</li>
				<li>-서비스 이용에 필요한 다님코인은 해당 페이지에서만 거래가 가능하며, 외부 거래시 적발될 경우
					법적책임은 본인에게 있습니다.</li>
				<li style="color: red; font-weight: bold;">-다님 서비스를 이용하여 불법적인
					업무를 요청할 수 없으며, 본 서비스는 중개 플랫폼으로서 서비스 요청 시 모든 책임은 회원에게 있습니다.</li>
			</ul>
	</div>
	<!-- /ulclass -->

		<br><br>
		<br><br>		
	
</div>
<!-- /section -->
		<!-- <hr style="border-color: #fcc159"> -->
		<!-- Footer -->
	<footer id="footer" class="section">

		<!-- container -->
		<div class="container">

			<!-- row -->
			<div class="row">

				<!-- footer logo -->
				<div class="col-md-6">
					<div class="footer-logo">
						<a class="logo" href="userChange.do"> 
							<img src="/danim/resources/img/logo.png" alt="logo">
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
						<span>&copy; Copyright Koo gun mo. | This Poroject is made
							with Kim nam gyu & You young joon</a>
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
<input type="text" id="userid" value="${loginUser.getUserid() }"
		hidden="true">
<input type="text" id="money" value="${loginUser.getMoney() }"
		hidden="true">
<!-- 코인 전환 function -->		
<!-- <script>
	$(document).ready(function(){
		var a = $('#userid').val();
		location.href="change.do?userid=" + a;
	}); //documnet function
	
</script> -->
<script>
	/* //인풋 창에서 금액 입력 후 엔터 눌렀을때 발동
	$(document).ready(function(){
		$("#tt").keypress(function(e){
			if(e.which == 13){ //keycode == 13 (enter)
				namgyu(); //namgyu() function 실행
			}
		}) //keypress function
	}); //document ready
 */
	function enterkey(){
		if(event.keyCode == 13){
			namgyu();
		} //if
	} //enterkey function
 
 
	function namgyu(){
		var a = $('#userid').val();
		var b = $('#money').val();
		var input = document.getElementById('tt').value;
		var sub = b - input;
		var suc = "출금";
		
		//5000 다님코인 이상일 경우 
		if($("#tt").val() > 4999){
			alert('현재 보유하고 있는 코인은 : ' + b + '\n' +
					'입력한 코인의 값은 : ' + input + '\n' +
					'다님코인을 ' + input + '만큼 전환 중...\n전환 후 잔여 코인은 ' + sub + '입니다.');
		//확인과 취소 버튼	
		var result = confirm("정말로 코인을 전환 하시겠습니까?")
		if(result){
		if(input){
			var msg = '코인이 정상적으로 차감 되었습니다.';
			location.href="coinSuccess.do?userid="+ a + "&money="+sub+"&paymoney="+ input + "&category=" + suc;
			alert(msg);
			return history.go(0);
		
		//에러발생 시
		}else{
			var msg = '처리에 실패하였습니다.';
			alert(msg);
			return history-1;
		}

		//취소버튼 클릭시
		}else{
			alert("다님코인 전환을 취소하였습니다.");
			history.go(0);
		}

		//5000 다님코인 이상이 아닐 경우 
		}else{
			alert("5000 다님코인 이상 전환이 가능합니다.");
			history.go(0);
		}; //else
		}; //function(suc)
</script>
		
<!-- 리셋 시키는 function -->
<!-- <script type="text/javascript"> 
	var xay = 0;
	
	function sum(pull){
		xay += pull;
		$("#tt").val(xay);
	}
	
	function reset(){
		if($("#tt").val("")){ 
		
			xay = 0;
		 }
	}
	function reset2(){
		$("#tt").val("");
		xay = 0;
		}
		
		<!-- ajax 사용 -->
		<!-- $.ajax({
				url: "coinSuccess.do",
				type="POST",
				data: {userid: userid,
					   money: money
					   
					   },
				success: function(result){
					switch(result){
					case: "100" : alert("성공"); break;
					case: "900" : alert("실패!"); break;
					}
					//switch
				}
				//function(result)
			})
			//ajax -->
			
</script> -->
		
		
		
		
		
		
		
		
</body>
</html>






