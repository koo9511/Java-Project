<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		 <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<title>다님: 문의 사항</title>

		<!-- Google font -->
		<link href="https://fonts.googleapis.com/css?family=Lato:700%7CMontserrat:400,600" rel="stylesheet">

		<!-- Bootstrap -->
		<link type="text/css" rel="stylesheet" href="resources/css/bootstrap.min.css"/>

		<!-- Font Awesome Icon -->
		<link rel="stylesheet" href="resources/css/font-awesome.min.css">

		<!-- Custom stlylesheet -->
		<link type="text/css" rel="stylesheet" href="resources/css/style.css"/>

		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
		<script>
			$('html').bind('keypress', function(e){
			if(e.keyCode == 13)
				return false;
			});

			function send(){
				 
				 if(!$("#name").val()){
					alert("이름을 입력해 주세요.");
					$("#name").focus();
					return false;
					  }
				 
				 if(!$("#email").val()){
					alert("답변 받을 이메일을 입력해주세요.");
					$("#email").focus();
					return false;
					  }
				var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
					if (!regExp.test($('#email').val())){
						alert("이메일 형식을 맞게 작성해주세요.");
						$("#email").focus();
						return false;
					} 

				 if(!$("#title").val()){
					alert("문의 제목을 작성해주세요.");
					$("#userid").focus();
					return false;
					 }
				 if(!$("#content").val()){
					alert("문의 내용을 작성해주세요.");
					$("#content").focus();
					return false;
					 }
					
				alert("문의가 성공적으로 전송되었습니다. 답변은 2일이내 작성하신 이메일로 전송됩니다.");
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
							<img src="resources/img/logo.png" alt="logo">
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
			<div class="bg-image bg-parallax overlay" style="background-image:url(resources/img/page-background.jpg)"></div>
			<!-- /Backgound Image -->

			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 text-center">
						<ul class="hero-area-tree">
							<li><a href="#">Danim:</a></li>
							
						</ul>
						<h1 class="white-text">문의하기</h1>

					</div>
				</div>
			</div>

		</div>
		<!-- /Hero-area -->

		<!-- Contact -->
		<div id="contact" class="section">

			<!-- container -->
			<div class="container">

				<!-- row -->
				<div class="row">
				
					<!-- contact form -->
					<div class="col-md-6">
						<div class="contact-form">
							<h4>작성하기</h4>
							<form action="contact.do" method="POST">
								<input class="input" type="text" name="writername" id="name" placeholder="이름">
								<input class="input" type="email" name="writeremail" id="email" placeholder="이메일" >
								<input class="input" type="text" name="contacttitle" id="title" placeholder="제목">
								<textarea class="input" name="contactcontent" id="content" placeholder="문의 내용"></textarea>
								<button class="main-button icon-button pull-right" type="submit" onclick="return send();">전송하기</button>
							</form>
						</div>
					</div>
					<!-- /contact form -->

					<!-- contact information -->
					<div class="col-md-5 col-md-offset-1">
						<h4>담당자 연락처</h4>
						<ul class="contact-details">
							<li><i class="fa fa-envelope"></i><a href="mailto:gunmo9511@gmail.com"> gunmo9511@gmail.com</a></li>
							<li><i class="fa fa-phone"></i><a href="tel:+821025653871"> +82-10-2565-3871</a></li>
							<li><i class="fa fa-map-marker"></i><a href="">강남구 테헤란로 남도빌딩 2F B Class</a></li>
						</ul>

						<!-- contact map -->
						<div id="contact-map"></div>
						<!-- /contact map -->

					</div>
					<!-- contact information -->

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
		<script type="text/javascript" src="resources/js/jquery.min.js"></script>
		<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
		<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=true"></script>
		<script type="text/javascript" src="resources/js/google-map.js"></script>
		<script type="text/javascript" src="resources/js/main.js"></script>

	</body>
</html>
