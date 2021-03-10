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

		<title>다님: 내 문의함</title>

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
					alert("로그아웃 되었습니다.");
				}
		</script>
    </head>
	<body>

		<!-- Header -->
		<header id="header">
				<div class="container">
				
						<div class="navbar-header" class="backimgs">
							<!-- Logo -->
							<div class="navbar-brand">
								<c:if test="${loginUser == null}">
									<a class="logo" href="index.do">
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
						<c:if test="${loginUser == null}">
							<nav id="nav">
								<ul class="main-menu nav navbar-nav navbar-right">
									<li><a href="index.do">메인으로</a></li>
									<li><a href="loginForm.do">로그인</a></li>
									<li><a href="enrollForm.do">회원가입</a></li>
									<li><a href="contactForm.do">문의하기</a></li>
									<li><a href="noticeForm.do?page=1">공지사항</a></li>
									<!-- <li><a id="dark" class="btn" onclick="darkModeSwitch(true);">Dark Mode</a></li>
									<li><a id="white" class="btn" onclick="darkModeSwitch(false);">Light Mode</a></li> -->
								</ul>
							</nav>
						</c:if>
						<c:if test="${loginUser != null}">
							<nav id="nav">
								<ul class="main-menu nav navbar-nav navbar-right">
									<li><a href="userChange.do">메인으로</a></li>
									<li><a href="myPage.do?userid=${loginUser.getUserid()}">내 정보</a></li>
									<li><a href="#">서비스 현황</a></li>
									<li><a href="serviceCenter.do">고객센터</a></li>
									<li><a href="mycenter.do?userid=${loginUser.userid}&page=1">내 문의함</a></li>
									<li><a href="noticeForm.do?page=1">공지사항</a></li>
									<!-- <li><a id="dark" class="btn" onclick="darkModeSwitch(true);">Dark Mode</a></li>
									<li><a id="white" class="btn" onclick="darkModeSwitch(false);">Light Mode</a></li> -->
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
							<li><a href="#">Danim:</a></li>
						</ul>
						<h1 class="white-text">내 문의함</h1>

					</div>
				</div>
			</div>

		</div>
		<!-- /Hero-area -->

		<!-- Contact -->
		<div id="contact" class="section" >

			<!-- container -->
			<div class="container" >

				<!-- row -->
				<div class="row">

					<!-- login form -->
					<br><br>
					<div class="col-md-12">
						<div class="">
							<h2 style="border-bottom: 2px solid #fcc159; padding-bottom: 30px; padding-left: 2%">내 문의함</h2>
							<h3 style="text-align: center;">비어 있습니다.</h3>
						</div>
					</div>
				</div>
				<!-- /row -->
				
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
								<a class="logo">
									<img src="resources/img/logo.png" alt="logo">
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
									<span>&copy; Copyright <a href="admin.do">Koo gun mo. </a>| This Poroject is made with Kim nam gyu & You young joon</a></span>
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
