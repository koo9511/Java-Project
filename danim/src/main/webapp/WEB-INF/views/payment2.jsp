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
	/* width: 1080px; */
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
<link href="https://fonts.googleapis.com/css?family=Lato:700%7CMontserrat:400,600" rel="stylesheet">

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet" href="/danim/resources/css/bootstrap.min.css" />

<!-- Font Awesome Icon -->
<link rel="stylesheet" href="/danim/resources/css/font-awesome.min.css">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="/danim/resources/css/style.css" />

<link type="text/css" rel="stylesheet" href="/danim/resources/css/nkstyle.css" />

<link rel="stylesheet" type="text/css" href="https://unpkg.com/magic-input/dist/magic-input.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script> 
	
</head>
<body>
	<!-- Header -->
	<c:import url="headfoot/header.jsp" />
	<!-- /Header -->
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
					<h1 class="white-text">다님코인 충전소</h1>

				</div>
			</div>
		</div>

	</div>
	<!-- /Hero-area -->

	<!-- My Info -->
	<div id="information" class="section">

		<!-- container -->
		<div class="container">
			<div class="area_navigation" role="navigation" style="margin: 0;">
				<div class="a">
					<h2>다님코인 충전하기</h2>
				</div>
				<div class="b">
					<a href="paylist.do?userid=${loginUser.getUserid()}" style="color: #fcc159">나의 결제내역 보기<a>></a></a>
					<a href="change.do?userid=${loginUser.getUserid()}" style="color: #fcc159">포인트 전환하기</a><a>></a>
					<a href="nkevent.do?userid=${loginUser.getUserid()}" style="color: #fcc159">출석 이벤트 하러가기!</a><a>></a>
					<%-- <a href="coupon.do?userid=${loginUser.getUserid()}" style="color: #fcc159">쿠폰 받으러가기</a><a>></a> --%>
				</div>
			</div>
			<!-- container/ -->
			<hr style="border-color: #fcc159; margin-top: 0;">
			<br>
		

			<script>
	function sum(p1, p2){
			if(this.value != "none")
				return p1 + p2;
			}
</script>

			<!-- 결제 버튼 -->
			<div class="row" >
				<div class="col-md-4 row-md-4">
					<table class="myinfo-table selectcheck" cellpadding="30px">
						<!-- select box -->
						<tr class="selectcheck">
							<select name="selectbox" id="selectbox" class="selectnk" style="width: 300px; height: 40px; margin-bottom: 40px;">
								<option class="selectval" value="none">구매 할 코인을 선택해주세요.</option>
								<option class="selectval" value="1000">1000코인 충전</option>
								<option class="selectval" value="20000">20000코인 충전</option>
								<option class="selectval" value="30000">30000코인 충전</option>
								<option class="selectval" value="40000">40000코인 충전</option>
								<option class="selectval" value="50000">50000코인 충전</option>
								<option class="selectval" value="100000">100000코인 충전</option>
								<option class="selectval" value="direct">==직접 입력==</option>
							</select>
						</tr>
						
						
					</table>
					<!-- myinfo-table selectcheck / -->
					<br>
					
				</div>
				
				<div class="col-md-4 row-md-4">
				<input class="hiddeninput" type="text" id="selfdirect" name="selfdirect" placeholder="숫자만 입력해 주세요." 
					style="width:300px; margin-bottom:40px;" onkeydown="javaScript:enterkey(self);">
				</div>
				<div class="col-md-4 row-md-4">
					<div class="hiddenclass" style="margin-bottom: 40px;">
							<tr class="tdnk"><span style="font-size: 20px; font-weight: 400;">충전 전 보유코인</span></tr>
							<%-- <tr class="tdnk"><span style="font-size: 25px; color: green">
							<fmt:formatNumber value="${loginUser.money}" pattern="#,###,###"/></span><span> Coin</span>
							</tr> --%>
							<tr class="tdnk"><span style="font-size: 25px; color: green">${loginUser.money}</span><span> Coin</span>
							</tr>
							<br><br>
							<tr class="tdnk"><span style="font-size:20px; font-weight: 400;">충전 후 보유코인</span>
							</tr>
							<tr class="tdnk"><span id="demo" style="font-size: 25px; color: green"></span><span> Coin</span>
							</tr>
					</div>
				</div>
				<!-- col-md-6 row-md-6 / -->
					<br><br><br>
					<br> <br> <br> <br>
					<div class="ulclass col-md-12" style="margin-top:60px;">
					<h4>다님코인 결제 시 주의사항</h4>
					<ul style="margin:0; padding:0;">
						<li>-결제는 신중히 생각하여 결제를 부탁드리며, 결제 후 환불은 불가능 하오니 명심하여 진행을
							부탁드립니다..</li>
						<li>-결제 후 30분간 포인트가 지급되지 않을 경우, 관리자 문의사항에 문의를 남겨주시면 결제 내역을
							확인하여 빠른 시일 내에 조치를 취해드립니다.</li>
						<li>-다님코인을 결제하여 다님코인으로 고의적인 악욕을 할 경우 법적 책임은 본인에게 있으니 주의바랍니다.</li>
						<li>-서비스 이용에 필요한 다님코인은 해당 페이지에서만 거래가 가능하며, 외부 거래시 적발될 경우
							법적책임은 본인에게 있습니다.</li>
						<li style="color: red; font-weight: bold;">-다님 서비스를 이용하여 불법적인
							업무를 요청할 수 없으며, 본 서비스는 중개 플랫폼으로서 서비스 요청 시 모든 책임은 회원에게 있습니다.</li>
					</ul>
				</div>
				<!-- /ulclass -->
				
				<!-- col-md-12 / -->
			</div>
			<!-- row / -->
			<br>
			<a class="main-button icon-button pull-right" onclick="payTest(document.getElementById('selectbox').value)"
				style="margin-right: 15px;">결제하기</a>&nbsp;
		</div>
		<!-- container / -->
	</div>
	<!-- /information -->


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

	<!-- preloader -->
	<div id='preloader'>
		<div class='preloader'></div>
	</div>
	<!-- /preloader -->


	<!-- jQuery Plugins -->
	<script type="text/javascript" src="/danim/resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="/danim/resources/js/bootstrap.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=true"></script>
	<script type="text/javascript" src="/danim/resources/js/google-map.js"></script>
	<script type="text/javascript" src="/danim/resources/js/main.js"></script>

	<!-- ---------------------------------------------------------------------------------------------------------- -->
	<input type="text" id="username" value="${loginUser.getUsername() }"
		hidden="true">
	<input type="text" id="userid" value="${loginUser.getUserid() }"
		hidden="true">
	<input type="text" id="userphone" value="${loginUser.getPhone() }"
		hidden="true">

	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

	<!-- 결제 api -->
	<script type="text/javascript">
	//아임포트 개인 고유번호
	IMP.init('imp95683146');
	
	function payTest(payamount){
	
	var username = $('#username').val();
	var userid = $('#userid').val();
	var userphone = $('#userphone').val();
	var money = payamount;
	var division = "정상";
	var scharge = "카카오페이";
	var category = "충전";
	/* var minusmoney = ""; */
	
	
	   IMP.request_pay({
	       pg : 'inicis',
	       pay_method : 'card',
	       merchant_uid : 'merchant_' + new Date().getTime(),
	       name : '다님코인',
	       amount : payamount,
	       buyer_email : userid,
	       buyer_name : username,
	       buyer_tel : userphone
	   }, function(rsp) {
	       if ( rsp.success ) {
	    	   var msg = '결제가 완료되었습니다.';
               msg += '\n고객 성함 : ' + username;
               msg += '\n고객 아이디 : ' + userid;
               /* msg += '\n상점 거래ID : ' + rsp.merchant_uid; */
               msg += '\n결제한 금액 : ' + payamount; + '원 입니다.';
               msg += '\n결제해 주셔서 감사합니다.';
               alert(msg);
	         $.ajax({
	          	url: "paySuccess.do",
	          	type: "POST",
	          	data: {
	          			userid: userid,
	          			money: money,
	          			division: division,
	          			scharge: scharge,
	          			category: category
	          			},
	          	success: function(result){
	          		switch(result){
	          		case "100" : alert("success"); break;
	          		case "900" :alert("fail"); break;
	          		}
	          	}
	         });
	       } else if(payamount == 0){
	    	   /* var division = "취소"; */
	    	   var msg = '결제에 실패하였습니다.\n';
	    	   var msg2 = '결제 금액이 0원 입니다.\n결제금액 확인 후 결제요청을 부탁립니다.';
	           msg += '결제 취소 내용 : ' + msg2;
	           /* msg += '결제 취소 내용 : ' + rsp.error_msg; */
	           /* location.href="payFail.do?division=" + division; */
	           alert(msg);
	           return history-2;
	           
	       }else{
	    	   var msg = '결제에 실패하였습니다.\n';
	    	   msg += '결제 취소 내용 : ' + msg;
	           alert(msg);
	           
	           return history-2;
	       }
	   });
	}
	</script>
	
<!-- 직접입력시 인풋 엔터키 입력시 -->
<script>
function enterkey(self){
	if(event.keyCode == 13){
		payTest(document.getElementById('selfdirect').value);
	} //if
} //enterkey function
</script>

<script type="text/javascript">
var a = ${loginUser.money};
$(document).ready(function(){
	$("#selectbox").on('change', function(){
      if(this.value == "direct"){
    	  $(".hiddeninput").css('display', 'block');
    	  $(".hiddenclass").css('display', 'block');
    	  var tt = parseInt(this.value);
    	  document.getElementById("demo").innerHTML = a;
          document.getElementById("paydemo").innerHTML = tt;
      }else{
        if (this.value != "none") {
        	/* 선택값 int 형변환 */
        	var tt = parseInt(this.value);
            $(".hiddenclass").css('display', 'block');
            $(".hiddeninput").css('display', 'none');
            document.getElementById("demo").innerHTML = sum(a, tt);
            document.getElementById("paydemo").innerHTML = tt;
        } else {
            $(".hiddenclass").css('display', 'none');
            $(".hiddeninput").css('display', 'none');
        }
    }
    });
});
</script>


<!-- 충전 후 보유코인 입력하는 숫자랑 더한 값 나오게함 -->
<script type="text/javascript">
	var a = ${loginUser.money};
	$(document).ready(function(){
		$("#selfdirect").keyup(function(){
			$("#demo").text(Number(a) + Number($("#selfdirect").val()));
		});
	});
</script>


<script type="text/javascript">
    function inNumber(){
        if(event.keyCode<48 || event.keyCode>57){
           event.returnValue=false;
        }
    }
    </script>


</body>
</html>
