<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		 <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<title>다님: 로그인</title>

		<!-- Google font -->
		<link href="https://fonts.googleapis.com/css?family=Lato:700%7CMontserrat:400,600" rel="stylesheet">

		<!-- Bootstrap -->
		<link type="text/css" rel="stylesheet" href="/danim/resources/css/bootstrap.min.css"/>

		<!-- Font Awesome Icon -->
		<link rel="stylesheet" href="/danim/resources/css/font-awesome.min.css">

		<!-- Custom stlylesheet -->
		<link type="text/css" rel="stylesheet" href="/danim/resources/css/style.css"/>

		<!-- Kakao Login -->
		<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
		<script>
			function logincheck(){
				
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
						<a class="logo" href="index.do">
							<img src="/danim/resources/img/logo.png" alt="logo">
						</a>
					</div>
					<!-- /Logo -->

					<!-- Mobile toggle -->
					<button class="navbar-toggle">
						<span></span>
					</button>
					<!-- /Mobile toggle -->
				</div>

				<!-- Navigation -->
				<nav id="nav">
					<ul class="main-menu nav navbar-nav navbar-right">
						<li><a href="index.do">메인으로</a></li>
						<li><a href="loginForm.do">로그인</a></li>
						<li><a href="enrollForm.do">회원가입</a></li>
						<li><a href="contactForm.do">문의하기</a></li>
						<li><a href="noticeForm.do?page=1">공지사항</a></li>
					</ul>
				</nav>
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
						<h1 class="white-text">로그인</h1>

					</div>
				</div>
			</div>

		</div>
		<!-- /Hero-area -->

		<!-- Contact -->
		<div id="contact" class="section" >

			<!-- container -->
			<div class="container">

				<!-- row -->
				<div class="row">

					<!-- login form -->
					<br><br>
					<div class="col-md-5 col-md-offset-4">
						<div class="contact-form">
							<h4>Login</h4>
							<form action="login.do" method="post">
								<input class="input login" type="text" name="userid" placeholder="아이디">
								<input class="input login" type="password" name="userpwd" placeholder="비밀번호">	
								<button class="main-button icon-button pull-right loginbutton">로그인</button>
								<!-- kakao  -->
											
							</form>
				
							<div class="text-center login-a">
							<a class="logintext la">아이디 또는 비밀번호를 잊으셨나요? <a href="#" class="login">계정찾기</a></a><br>
							<a class="logintext la">아직 회원이 아니신가요? <a href="enrollForm.do" class="login">회원가입</a></a>
							<br><hr style="border-color: #fcc159;">
							<a id="kakao-login-btn"></a>
							<script type='text/javascript'>
							// 나의 키
							  Kakao.init('c606ec502db7878d6bf6ba8ddc7c6d71');
							  // 카카오 로그인 버튼
							  Kakao.Auth.createLoginButton({
								container: '#kakao-login-btn',
								success: function(authObj) {
								  // 로그인 성공시, API를 호출
								  Kakao.API.request({
									url: '/v1/user/me',
									success: function(res) {
									// console.log(res);
									  alert(res.properties.nickname+'님 환영합니다!');
									  // 이미 등록된 회원인지 조회
									  $.ajax({
										  type : 'POST',
										  data : {userid : res.kaccount_email},
										  url : "kakaoLogin.do",
										  success: function(result){
											switch(result){
												case "100": location.href="userChange.do";// 등록된 회원이면 메인으로
															break;
												case "900": alert("추가 정보 등록 페이지로 이동합니다.");
															$.ajax({
																type : 'POST',
																data : {userid : res.kaccount_email, nickname : res.properties.nickname},
																url : "kakaoEnroll.do", // email과 nickname을 k.login 전용 양식에 전송
																success : function(result){
																			console.log(result);
																}
															});
															break;
											} // code
										  }, // success
									  }); //select
									},
									fail: function(error) {
									  alert("실패하였습니다.");
									}
								  });
								},
								fail: function(err) {
								  alert(JSON.stringify(err));
								}
							  });
							 </script>

						</div><br>
						
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
							<a class="logo" href="index.do">
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
		<script type="text/javascript" src="/danim/resources/js/main.js"></script>

	</body>
</html>
