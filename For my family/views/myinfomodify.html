<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		 <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<title>다님: 내 정보 수정</title>

		<!-- Google font -->
		<link href="https://fonts.googleapis.com/css?family=Lato:700%7CMontserrat:400,600" rel="stylesheet">

		<!-- Bootstrap -->
		<link type="text/css" rel="stylesheet" href="/danim/resources/css/bootstrap.min.css"/>

		<!-- Font Awesome Icon -->
		<link rel="stylesheet" href="/danim/resources/css/font-awesome.min.css">

		<!-- Custom stlylesheet -->
		<link type="text/css" rel="stylesheet" href="/danim/resources/css/style.css"/>

		<link rel="stylesheet" type="text/css" href="https://unpkg.com/magic-input/dist/magic-input.min.css">

		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
		<!-- <script>
			window.addEventListener('popstate', function () {
			console.log('popstate', history.state);
			document.querySelector('boty').innerHTML = JSON.stringify(history.state);
		}); -->
		</script>

		<script type="text/javascript">

			$('html').bind('keypress', function(e){
				if(e.keyCode == 13)
					return false;
			});

			var checkcnt = 0;
	   
			var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
			var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
			var getPwd = RegExp(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,12}$/);
			
	   
   
			var fmt = RegExp(/^\d{6}[1234]\d{6}$/); //형식 설정
		   //  var buf = new Array(13); //주민등록번호 배열
			   function validate() {
				
				
					 if($('#nickname').val() == ""){
						 alert("닉네임을 입력해주세요.");
						 $("#nickname").focus();
						 return false;
					 }
				
					 if($("#phone").val() == ""){
					   alert("전화번호를 입력해주세요.");
					   $("#phone").focus();
					   return false;
					 }

				


					 alert("변경되었습니다.");
					 return true;
					 	
				 }
				   function nicknameCheck(){
   
					   var getNickName= RegExp(/^[가-힣]{2,}$/);
					   if (!getNickName.test($("#nickname").val()) && $("#nickname").val() != "") {
						   alert("별명을 올바르게 입력해주세요. (한글만 가능)");
						   $("#nickname").val("");
						   $("#nickname").focus();
						   return false;
					   } else {
						   document.getElementById("nickname").style.border="3px solid #fcc159";
						   document.getElementById("nickname").style.backgroundColor="#ebebeb";
					   }
					   
					   if($("#nickname").val() == ""){
						   document.getElementById("nickname").style.border="1px solid #ebebeb";
						   document.getElementById("nickname").style.backgroundColor="white";
					   return false;
					   }

					   $.ajax({
							type : 'POST',
							data : {nickname : $("#nickname").val(), userid : $("#userid").val()},
							url : "nicknameCheck.do",
							success : function(code){
								switch(code){
									case "900" : alert("이미 사용중인 닉네임 입니다.");
												 $("#nickname").val("");
												 $("#nickname").focus();
												 return false;
												 break;
								}
							}
					   });
				   
				   }
   
				   function phoneCheck(){
					   var getPhone= RegExp(/^010\d{4}\d{4}$/);
					   var phone =  $("#phone").val();
					   
						 if(!getPhone.test($("#phone").val()) && $("#phone").val() != ""){
						   alert("전화번호 형식에 맞게 작성해주세요. ex) 01025653871");
						   $("#phone").val("");
						   $("#phone").focus();
						   return false;
						 }
						 else {
						   document.getElementById("phone").style.border="3px solid #fcc159";
						   document.getElementById("phone").style.backgroundColor="#ebebeb";
						 }
						 if($("#phone").val() == ""){
						   document.getElementById("phone").style.border="1px solid #ebebeb";
						   document.getElementById("phone").style.backgroundColor="white";
					   return false;
					   }
					   $.ajax({
							type : 'POST',
							data : {phone : $("#phone").val()},
							url : "phoneCheck.do",
							success : function(code)	{
								switch(code){
									case "900" : alert("이미 등록된 전화번호 입니다.");
												 $("#phone").val("");
												 $("#phone").focus();
												 return false;
												 break;
								}
							}
					   });
				   }
				 
		   </script>
    </head>
	<!-- <body onload="history.replaceState({}, null, location.pathname);"> -->
		<body>

		<c:import url="headfoot/header.jsp" />

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
						<h1 class="white-text">수정하기</h1>
						
					</div>
				</div>
			</div>

		</div>
		<!-- /Hero-area -->

		<!-- My Info -->
		<div id="information" class="section" >

			<!-- container -->
			<div class="container" >
				<h2>내 정보 수정</h2>
				<h3 align="right">다님코인 : <a style="color: #fcc159;" href="#">${requestScope.user.money}</a>&nbsp; coin </h3>
				<hr style="border-color: #fcc159">
				<br><br>
				<!-- row -->
				<form action="userUpdate.do" method="POST" onsubmit="return validate();">
				<div class="row">
					
					<div class="col-md-6 row-md-6">
				
					 <table class="myinfo-table" cellpadding="30px" >
						<tr>
							<td><span class="myinfo">아이디</span></td>
							<td><span>${requestScope.user.userid}</span></td>
							<input type="text" name="userid" id="userid" value="${requestScope.user.userid}" hidden>
					   </tr>
					   <tr>
						   <td><span class="myinfo">이 름</span></td>
						   <td><span>${requestScope.user.username}</span></td>
						   <input type="text" name="username" value="${requestScope.user.username}" hidden>
						   <input type="password" name="userpwd" value="${requestScope.user.userpwd}" hidden>
					   </tr>
					   <tr>
						   <td><span class="myinfo">별 명</span></td>
						   <td><input class="myinfo-modify-input" type="text" value="${requestScope.user.nickname}" id="nickname" name="nickname" onblur="nicknameCheck();"></td>

					   </tr>
					   <tr>
						   <td><span class="myinfo">계좌번호</span></td>
						   <td>
								<c:if test="${requestScope.user.accountname eq '우리'}">
									<c:set var="selected0" value="selected" />
								</c:if>
								<c:if test="${requestScope.user.accountname eq '기업'}">
									<c:set var="selected1" value="selected" />
								</c:if>
								<c:if test="${requestScope.user.accountname eq '하나'}">
									<c:set var="selected2" value="selected" />
								</c:if>
								<c:if test="${requestScope.user.accountname eq '국민'}">
									<c:set var="selected3" value="selected" />
								</c:if>
								<c:if test="${requestScope.user.accountname eq '신한'}">
									<c:set var="selected4" value="selected" />
								</c:if>
								<c:if test="${requestScope.user.accountname eq '농협'}">
									<c:set var="selected5" value="selected" />
								</c:if>
								<c:if test="${requestScope.user.accountname eq '신협'}">
									<c:set var="selected6" value="selected" />
								</c:if>	
								<c:if test="${requestScope.user.accountname eq '카카오뱅크'}">
									<c:set var="selected7" value="selected" />
								</c:if>	
								<select name="accountname" id="accountname">
									
									<option value="카카오뱅크" ${selected7}>카카오뱅크</option>
									<option value="우리" ${selected0}>우리은행</option>
									<option value="기업" ${selected1}>IBK기업은행</option>
									<option value="하나" ${selected2}>KEB하나은행</option>
									<option value="국민" ${selected3}>국민은행</option>
									<option value="신한" ${selected4}>신한은행</option>
									<option value="농협" ${selected5}>농협은행</option>
									<option value="신협" ${selected6}>신협</option>
								</select> &nbsp;
							<input class="myinfo-modify-input" type="text" name="account" id="account" value="${requestScope.user.account}" style="width: 65%;" placeholder="'-' 생략">
						</td>
					   </tr>
					   <tr>
						   <td><span class="myinfo">전화번호</span></td>
						   <td><input class="myinfo-modify-input" type="text" name="phone" id="phone" value="${requestScope.user.phone}" onblur="phoneCheck();"></td>
					   </tr>
					   <tr>
						   <td><span class="myinfo">활동지역</span></td>
						   <td>
								<c:forTokens var="ground" items="${requestScope.user.ground }" delims=",">
										<c:if test="${ground eq '서울' }">
											<c:set var="checked0" value="checked" />
										</c:if>
										<c:if test="${ground eq '경기' }">
											<c:set var="checked1" value="checked" />
										</c:if>
										<c:if test="${ground eq '강원' }">
											<c:set var="checked2" value="checked" />
										</c:if>
										<c:if test="${ground eq '충북' }">
											<c:set var="checked3" value="checked" />
										</c:if>
										<c:if test="${ground eq '충남' }">
											<c:set var="checked4" value="checked" />
										</c:if>
										<c:if test="${ground eq '전북' }">
											<c:set var="checked5" value="checked" />
										</c:if>
										<c:if test="${ground eq '전남' }">
											<c:set var="checked6" value="checked" />
										</c:if>
										<c:if test="${ground eq '경북' }">
											<c:set var="checked7" value="checked" />
										</c:if>
										<c:if test="${ground eq '경남' }">
											<c:set var="checked8" value="checked" />
										</c:if>
										<c:if test="${ground eq '제주' }">
											<c:set var="checked9" value="checked" />
										</c:if>
									</c:forTokens>
										<input class="mgc mgc-warning" type="checkbox" name="ground" id="seoul" value="서울" ${checked0}> 서울 &nbsp;
										<input class="mgc mgc-warning" type="checkbox" name="ground" id="gyunggi" value="경기" ${checked1}> 경기 &nbsp;
										<input class="mgc mgc-warning" type="checkbox" name="ground" id="gangwon" value="강원" ${checked2}> 강원 &nbsp;
										<input class="mgc mgc-warning" type="checkbox" name="ground" id="choongbook" value="충북" ${checked3}> 충북 &nbsp;
										<input class="mgc mgc-warning" type="checkbox" name="ground" id="choongnam" value="충남" ${checked4}> 충남 &nbsp;
										<br>
										<input class="mgc mgc-warning" type="checkbox" name="ground" id="jeonbook" value="전북" ${checked5}> 전북 &nbsp;
										<input class="mgc mgc-warning" type="checkbox" name="ground" id="jeonnam" value="전남" ${checked6}> 전남 &nbsp;
										<input class="mgc mgc-warning" type="checkbox" name="ground" id="gyungbook" value="경북" ${checked7}> 경북 &nbsp;
										<input class="mgc mgc-warning" type="checkbox" name="ground" id="gyungnam" value="경남" ${checked8}> 경남 &nbsp;
										<input class="mgc mgc-warning" type="checkbox" name="ground" id="jeju" value="제주" ${checked9}> 제주	
						   </td>
					   </tr>
					   <!-- <tr>
						   <td><span class="myinfo">다님이 횟수</span></td>
						   <td><span>${requestScope.user.danimcount} 회</span></td> -->
						   <input type="text" name="danimcount" value="${requestScope.user.danimcount}" hidden>
					   <!-- </tr> -->
					   <tr>
						   <td><span class="myinfo">가입날짜</span></td>
						   <td><span>${requestScope.user.enrolldate}</span></td>
						   <input type="text" name="enrolldate" value="${requestScope.user.enrolldate}" hidden>
					   </tr>
					 </table>
					</div>
				</div>
				<br><br>
				<!-- /row -->
				<input class="main-button icon-button pull-left" type="reset" value="취소하기" onclick="javascript:history.back();">
				<input class="main-button icon-button pull-right" type="submit" id="ok" value="저장하기">
				<c:if test="${requestScope.user.userpwd ne 'kakao'}">
						&nbsp;<a class="main-button icon-button pull-right" href="userPassUpdateView.do?userid=${requestScope.user.userid}" style="margin-right: 2%;">비밀번호 변경하기</a>
				</c:if>
			</form>
			
			</div>
			<!-- /container -->

		</div>
		<!-- /Contact -->

		<!-- Footer -->
		<c:import url="headfoot/footer.jsp" />
		<!-- /Footer -->

		<!-- preloader -->
		<div id='preloader'><div class='preloader'></div></div>
		<!-- /preloader -->


		<!-- jQuery Plugins -->
		<script type="text/javascript" src="/danim/resources/js/jquery.min.js"></script>
		<script type="text/javascript" src="/danim/resources/js/bootstrap.min.js"></script>
		<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=true"></script>
		<script type="text/javascript" src="/danim/resources/js/google-map.js"></script>
		<script type="text/javascript" src="/danim/resources/js/main.js"></script>

	</body>
</html>
