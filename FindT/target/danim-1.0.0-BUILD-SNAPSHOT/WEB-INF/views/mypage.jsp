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

		<title>다님: 내 정보</title>

		<!-- Google font -->
		<link href="https://fonts.googleapis.com/css?family=Lato:700%7CMontserrat:400,600" rel="stylesheet">

		<!-- Bootstrap -->
		<link type="text/css" rel="stylesheet" href="/danim/resources/css/bootstrap.min.css"/>

		<!-- Font Awesome Icon -->
		<link rel="stylesheet" href="/danim/resources/css/font-awesome.min.css">

		<!-- Custom stlylesheet -->
		<link type="text/css" rel="stylesheet" href="/danim/resources/css/style.css"/>

		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
		<script>
				function logout(){
					alert="로그아웃 되었습니다.";
				}
		</script>
    </head>
	<body>

		<!-- Header -->
		<header id="header">
			<div class="container">

				<div class="navbar-header">
					<!-- Logo -->
					<div class="navbar-brand">
						<c:if test="${loginUser == null}">
							<a class="logo" href="userChange.do">
								<img src="/danim/resources/img/logo.png" alt="logo">
							</a>
						</c:if>
						<c:if test="${loginUser != null}">
							<a class="logo" href="userChange.do">
								<img src="/danim/resources/img/logo.png" alt="logo">
							</a>
						</c:if>
					</div>
					<!-- /Logo -->

					<!-- Mobile toggle -->
					<button class="navbar-toggle">
						<span></span>
					</button>
					<!-- /Mobile toggle -->
				</div>

				<!-- Navigation -->
			<c:if test="${loginUser != null}">
				<nav id="nav">
					<ul class="main-menu nav navbar-nav navbar-right">
						<li><a href="danimChange.do">메인으로</a></li>
						<li><a href="myPage.do?userid=${loginUser.getUserid()}">내 정보</a></li>
						<li><a href="#">서비스 현황</a></li>
						<li><a href="#">고객센터</a></li>
						<li><a href="noticeForm.do?page=1">공지사항</a></li>
						<li><a onclick="logout();" href="logout.do">로그아웃</a></li>
					</ul>
				</nav>
			</c:if>
				<!-- /Navigation -->

			</div>
		</header>
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
						<h1 class="white-text">내 정보</h1>

					</div>
				</div>
			</div>

		</div>
		<!-- /Hero-area -->

		<!-- My Info -->
		<div id="information" class="section" >

			<!-- container -->
			<div class="container" >
				<h2>내 정보</h2>
				<h3 align="right">다님코인 : <a style="color: #fcc159;" href="#">${requestScope.user.money}</a>&nbsp; coin </h3>
				<hr style="border-color: #fcc159;">
				<br><br>
				<!-- row -->
				<div class="row">
					
					<div class="col-md-6 row-md-6 ">
						
					 <table class="myinfo-table" cellpadding="30px">
						<tr>
							 <td><span class="myinfo">아이디</span></td>
							 <td><span>${requestScope.user.userid}</span></td>
						</tr>
						<tr>
							<td><span class="myinfo">이 름</span></td>
							<td><span>${requestScope.user.username}</span></td>
						</tr>
						<tr>
							<td><span class="myinfo">닉네임</span></td>
							<td><span>${requestScope.user.nickname}</span></td>
						</tr>
						<tr>
							<td><span class="myinfo">계좌번호</span></td>
							<td><span>${requestScope.user.accountname} &nbsp; ${requestScope.user.account}</span></td>
						</tr>
						<tr>
							<td><span class="myinfo">전화번호</span></td>
							<td><span>${requestScope.user.phone}</span></td>
						</tr>
						<tr>
							<td><span class="myinfo">활동지역</span></td>
							<td></td>
								
						</tr>
						<tr>
							<td><span class="myinfo">다님이 횟수</span></td>
							<td><span>${requestScope.user.danimcount} 회</span></td>
						</tr>
						<tr>
							<td><span class="myinfo">가입날짜</span></td>
							<td><span>${requestScope.user.enrolldate}</span></td>
						</tr>
					 </table>
					</div>
					<div style="float: right; text-align: center;">
						<img src="/danim/resources/img/rank.png" alt="" style=" width: 70%; height: 70%;"><br>
						<a style="color: #f8b645; font-size: 30px; text-align: center;">${requestScope.user.review}</a><br>
						<img src="/danim/resources/img/star.png" alt="" style=" width: 50%; height: 50%; margin-top: -20%;">
						<h3 style="margin-top: -10%;"> 내 등급 : A+</h3>
					</div>
				</div>
				<br><br>
				<!-- /row -->
				<a class="main-button icon-button pull-right" href="myPageModify.do?userid=${requestScope.user.userid}">내 정보 수정하기</a>
				<a class="main-button icon-button pull-right" href="myinfomodify.do?userid=${requestScope.user.userid}" style="margin-right: 2%;">비밀번호 변경하기</a>
			</div>
			<!-- /container -->

		</div>
		<!-- /Contact -->

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
							<li><a href="#" class="facebook"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#" class="instagram"><i class="fa fa-instagram"></i></a></li>
							<li><a href="#" class="github"><i class="fa fa-github"></i></a></li>
						</ul>
					</div>
					<!-- /social -->

					<!-- copyright -->
					<div class="col-md-8 col-md-pull-4">
						<div class="footer-copyright">
							<span>&copy; Copyright Koo gun mo. | This Poroject is made with Kim nam gyu & You young joon</a></span>
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
