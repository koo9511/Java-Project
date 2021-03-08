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

		<title>다님: 비밀번호 변경</title>

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

		<script>

			$('html').bind('keypress', function(e){
							if(e.keyCode == 13)
								return false;
			});

			function validate(){
				if($("#originalpass").val() == ""){
					alert("기존 비밀번호를 입력해주세요.");
					$("#originalpass").focus();
					return false;
				}
				

				if($("#userpwd").val() == "" || $("#userpwd2").val() == ""){
						alert("변경할 비밀번호를 입력해주세요.");
						$("#userpwd").val("");
						$("#userpwd2").val("");
						$("#userpwd").focus();
						return false;
					  }

					  
				alert("성공적으로 변경되었습니다.");
				return true;
			}
			var getPwd = RegExp(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,12}$/);
			function passCheck(){
				
						if ($("#userid").val()==($("#userpwd").val()) && $("#userpwd").val() != "") {
					  alert("아이디와 비밀번호를 갖게 만들 수 없습니다.");
					  $("#userpwd").val("");
					  $("#userpwd").focus();
					  document.getElementById("userpwd").style.border="1px solid #ebebeb";
							document.getElementById("userpwd").style.backgroundColor="white";
					  return false;
					  
						}
						if(!getPwd.test($("#userpwd").val()) && $("#userpwd").val() != "") {
					  alert("비밀번호 형식에 맞게 작성해주세요. (소문자 6~12자 이내 및 숫자 포함)");
					  $("#userpwd").val("");
					  $("#userpwd").focus();
					  document.getElementById("userpwd").style.border="1px solid #ebebeb";
							document.getElementById("userpwd").style.backgroundColor="white";
					  return false;
						}
						else {
							document.getElementById("userpwd").style.border="3px solid #fcc159";
							document.getElementById("userpwd").style.backgroundColor="#ebebeb";
						}
						if($("#userpwd").val() == ""){
							document.getElementById("userpwd").style.border="1px solid #ebebeb";
							document.getElementById("userpwd").style.backgroundColor="white";
						return false;
						}
						
					}
	
					function passCheck2(){
						if($("#userpwd").val() != ($("#userpwd2").val()) && $("#userpwd2").val() != ""){ 
					  alert("비밀번호가 서로 일치하지 않습니다.");
					  $("#userpwd2").val("");
					  $("#userpwd2").focus();
					  return false;
						}
						else {
							document.getElementById("userpwd2").style.border="3px solid #fcc159";
							document.getElementById("userpwd2").style.backgroundColor="#ebebeb";
						}
						if($("#userpwd2").val() == ""){
							document.getElementById("userpwd2").style.border="1px solid #ebebeb";
							document.getElementById("userpwd2").style.backgroundColor="white";
						return false;
						}
						
					}

					function originalCheck(){
						if($("#originalpass").val() == ""){
							document.getElementById("originalpass").style.border="1px solid #ebebeb";
							document.getElementById("originalpass").style.backgroundColor="white";
						return false;
						}
						$.ajax({
							type : 'POST',
							data : {originalpass : $("#originalpass").val(),
									userid : $("#userid").val()},
							url : "originalPassCheck.do",
							success : function(code){
								switch(code){
									case "900" : alert("등록된 정보가 일치하지 않습니다. 기존 비밀번호를 확인해주세요.");
												$("#originalpass").val("");
												$("#originalpass").focus();
												return false;
												break; 
									case "100" : document.getElementById("originalpass").style.border="3px solid #fcc159";
												document.getElementById("originalpass").style.backgroundColor="#ebebeb";
												break;
						}
					}
				});
					}
				
		</script>
    </head>
	<!-- <body onload="history.replaceState({}, null, location.pathname);"> -->
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
						<h1 class="white-text">비밀번호 변경</h1>

					</div>
				</div>
			</div>

		</div>
		<!-- /Hero-area -->

		<!-- My Info -->
		<div id="information" class="section" >

			<!-- container -->
			<div class="container" >
				<h2>비밀번호 변경하기</h2>
				<hr style="border-color: #fcc159">
				<br><br>
				<!-- row -->
				<form action="userPassUpdate.do" method="POST" onsubmit="return validate();">
				<div class="row">
					
					<div class="col-md-6 row-md-6">
				
					 <table class="myinfo-table" cellpadding="30px" >
						<tr>
							<td><span class="myinfo">아이디</span></td>
							<td><span>${requestScope.user.userid}</span></td>
							<input type="text" id="userid" name="userid" value="${requestScope.user.userid}" hidden>
					   </tr>
					   <tr>
						   <td><span class="myinfo">이 름</span></td>
						   <td><span>${requestScope.user.username}</span></td>
						   <input type="text" name="username" value="${requestScope.user.username}" hidden>
					   </tr>
					   <tr>
                           <td><span class="myinfo">기존 비밀번호</span></td>
                           <td><input type="password" name="originalpass" id="originalpass" placeholder="기존 비밀번호" onblur="originalCheck();"></td>
                       </tr>
                       <tr>
                            <td><span class="myinfo">변경할 비밀번호</span></td>
                            <td><input type="password" name="renamepass" id="userpwd" placeholder="변경할 비밀번호" onblur="passCheck();"></td>
                       </tr>
                       <tr>
                           <td><span class="myinfo">비밀번호 확인</span></td>
                           <td><input type="password" id="userpwd2" placeholder="비밀번호 확인" onblur="passCheck2();"></td>
                       </tr>
					 </table>
					</div>
				</div>
				<br><br>
				<!-- /row -->
				<input class="main-button icon-button pull-left" type="reset" value="취소하기" onclick="javascript:history.back();">
				<input class="main-button icon-button pull-right" type="submit" value="저장하기">&nbsp;
				<a class="main-button icon-button pull-right" href="myPageModify.do?userid=${requestScope.user.userid}" style="margin-right: 2%;">다른 정보 수정하기</a>
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
