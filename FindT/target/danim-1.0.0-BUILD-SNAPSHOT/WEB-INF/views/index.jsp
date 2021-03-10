<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		

		<title>다님: 효율적인 삶의 시작</title>

		<!-- Google font -->
		<link href="https://fonts.googleapis.com/css?family=Lato:700%7CMontserrat:400,600" rel="stylesheet">

		<!-- Bootstrap -->
		<link type="text/css" rel="stylesheet" href="resources/css/bootstrap.min.css"/>

		<!-- Font Awesome Icon -->
		<link rel="stylesheet" href="resources/css/font-awesome.min.css">

		<!-- Custom stlylesheet -->
		<link type="text/css" rel="stylesheet" href="resources/css/style.css"/>

		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
		
	

    </head>
	<body>

		<!-- Header -->
		<header id="header" class="transparent-nav">
			<div class="container">

				<div class="navbar-header" class="backimgs">
					<!-- Logo -->
					<div class="navbar-brand">
						<a class="logo" href="index.do">
							<img src="resources/img/logo-alt.png" alt="logo">
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

		<!-- Home -->
		<div id="home" class="hero-area">

			<!-- Backgound Image -->
			<div class="bg-image bg-parallax overlay backimgs" style="background-image:url(resources/img/IMG_0078.jpeg)"></div>
			<!-- /Backgound Image -->

			<div class="home-wrapper">
				<div class="container">
					<div class="row">
						<div class="col-md-8">
							<h1 class="white-text">Danim:</h1>
							<p class="lead white-text">
								'다님'은 실시간 GPS 기반 서비스 플랫폼입니다.
							</p>
							<p class="lead white-text">
								여러분의 도움이 필요할 때 '다님이'들이 여러분의 니즈를 해결해 드립니다. 이젠 귀찮은 일, 힘든일 모두 안 하셔도 됩니다. '다님이'가 대신 해드릴테니까요.
						</p>
							<br>
							<a class="main-button icon-button" href="loginForm.do">지금 시작하기</a>
						</div>
					</div>
					
				</div>
			</div>

		</div>

		<!-- <div class="mbr-arrow hidden-sm-down" aria-hidden="true">
				<a href="#">
					<i class="mbri-down mbr-iconfont"></i>
				</a>
			</div> -->
		
		
		<!-- /Home -->

		<!-- About -->
		<div id="about" class="section">

			<!-- container -->
			<div class="container">

				<!-- row -->
				<div class="row">

					<div class="col-md-6">
						<div class="section-header" id="about">
							<h2>다님: 의 다짐</h2>
							<p class="lead">'다님'은 서비스를 운영함에 앞서 유저분들에게 깨끗하고 당당한 서비스를 운영할 것을 약속합니다.</p>
						</div>

						<!-- feature -->
						<div class="feature">
							<i class="feature-icon fa fa-flask"></i>
							<div class="feature-content">
								<h4>첫 번째 다짐</h4>
								<p>'다님'은 유저분들을 속이지 않습니다.</p>
							</div>
						</div>
						<!-- /feature -->

						<!-- feature -->
						<div class="feature">
							<i class="feature-icon fa fa-users"></i>
							<div class="feature-content">
								<h4>두 번째 다짐</h4>
								<p>'다님'은 유저분들의 사생활 및 개인정보를 동의없이 수집하거나 사용하지 않습니다.</p>
							</div>
						</div>
						<!-- /feature -->

						<!-- feature -->
						<div class="feature">
							<i class="feature-icon fa fa-comments"></i>
							<div class="feature-content">
								<h4>세 번째 다짐</h4>
								<p>'다님'은 유저분들에게 신뢰를 져버리지 않도록 노력하겠습니다.</p>
							</div>
						</div>
						<!-- /feature -->

					</div>

					<div class="col-md-6">
						<div class="about-img backimgs"">
							<img src="resources/img/about.png" alt="">
						</div>
					</div>

				</div>
				<!-- row -->

			</div>
			<!-- container -->
		</div>
		<!-- /About -->

		<!-- Courses -->
		<div id="courses" class="section">

			<!-- container -->
			<div class="container">

				<!-- row -->
				<div class="row">
					<div class="section-header text-center" id="service">
						<h2>주요 서비스</h2>
						<p class="lead">'다님'에서는 다른 플랫폼들과 다르게 투명한 서비스 운영을 추구합니다.</p>
					</div>
				</div>
				<!-- /row -->

				<!-- courses -->
				<div id="courses-wrapper">

					<!-- row -->
					<div class="row">

						<!-- single course -->
						<div class="col-md-3 col-sm-6 col-xs-6">
							<div class="course">
								<a href="#" class="course-img">
									<img src="resources/img/img3.jpeg" alt="">
									<!-- <i class="course-link-icon fa fa-link"></i> -->
								</a>
								<a class="course-title" href="#">전문가/비즈니스</a>
								<div class="course-details">
									<span class="course-category">Professional</span>
									<span class="course-price course-premium">₩30,000원 ~</span>
								</div>
							</div>
						</div>
						<!-- /single course -->

						<!-- single course -->
						<div class="col-md-3 col-sm-6 col-xs-6">
							<div class="course">
								<a href="#" class="course-img">
									<img src="resources/img/img1.jpeg" alt="">
									
								</a>
								<a class="course-title" href="#">하객 역할 해주기</a>
								<div class="course-details">
									<span class="course-category">Visitor</span>
									<span class="course-price course-premium">₩10,000원 ~</span>
								</div>
							</div>
						</div>
						<!-- /single course -->

						<!-- single course -->
						<div class="col-md-3 col-sm-6 col-xs-6">
							<div class="course">
								<a href="#" class="course-img">
									<img src="resources/img/img8.jpeg" alt="">
									
								</a>
								<a class="course-title" href="#">이사 도와주기</a>
								<div class="course-details">
									<span class="course-category">Help Move</span>
									<span class="course-price course-premium">₩10,000원 ~</span>
								</div>
							</div>
						</div>
						<!-- /single course -->

						<div class="col-md-3 col-sm-6 col-xs-6">
							<div class="course">
								<a href="#" class="course-img">
									<img src="resources/img/img5.jpeg" alt="">
									
								</a>
								<a class="course-title" href="#">애완동물 돌봐주기</a>
								<div class="course-details">
									<span class="course-category">Pet Care</span>
									<span class="course-price course-premium">₩10,000원 ~</span>
								</div>
							</div>
						</div>
						<!-- /single course -->

					</div>
					<!-- /row -->

					<!-- row -->
					<div class="row">

						<!-- single course -->
						<div class="col-md-3 col-sm-6 col-xs-6">
							<div class="course">
								<a href="#" class="course-img">
									<img src="resources/img/img4.jpeg" alt="">
									
								</a>
								<a class="course-title" href="#">줄 서주기</a>
								<div class="course-details">
									<span class="course-category">Waiting</span>
									<span class="course-price course-free">₩5,000원 ~</span>
								</div>
							</div>
						</div>
						<!-- /single course -->

						<!-- single course -->
						<div class="col-md-3 col-sm-6 col-xs-6">
							<div class="course">
								<a href="#" class="course-img">
									<img src="resources/img/img2.jpeg" alt="">
									
								</a>
								<a class="course-title" href="#">약 사다주기</a>
								<div class="course-details">
									<span class="course-category">Medichine</span>
									<span class="course-price course-free">₩3,000원 ~</span>
								</div>
							</div>
						</div>
						<!-- /single course -->

						<!-- single course -->
						<div class="col-md-3 col-sm-6 col-xs-6">
							<div class="course">
								<a href="#" class="course-img">
									<img src="resources/img/img6.jpeg" alt="">
									
								</a>
								<a class="course-title" href="#">물건 맡아주기 및 찾아주기</a>
								<div class="course-details">
									<span class="course-category">Leave</span>
									<span class="course-price course-free">₩3,000원 ~</span>
								</div>
							</div>
						</div>
						<!-- /single course -->


						<!-- single course -->
						<div class="col-md-3 col-sm-6 col-xs-6">
							<div class="course">
								<a href="#" class="course-img">
									<img src="resources/img/img7.jpeg" alt="">
									
								</a>
								<a class="course-title" href="#">서류 및 물건 배달</a>
								<div class="course-details">
									<span class="course-category">Delivery</span>
									<span class="course-price course-free">₩3,000원 ~</span>
								</div>
							</div>
						</div>
						<!-- /single course -->

					</div>
					<!-- /row -->

				</div>
				<!-- /courses -->

				<div class="row">
					<div class="center-btn">
						<a class="main-button icon-button" href="loginForm.do">다양한 서비스 이용하기</a>
					</div>
				</div>

			</div>
			<!-- container -->

		</div>
		<!-- /Courses -->

		<!-- Call To Action -->
		<div id="cta" class="section">

			<!-- Backgound Image -->
			<div class="bg-image bg-parallax overlay backimgs" style="background-image:url(resources/img/IMG_0067.jpeg)"></div>
			<!-- /Backgound Image -->

			<!-- container -->
			<div class="container">

				<!-- row -->
				<div class="row">

					<div class="col-md-6">
						<h2 class="white-text">나의 시간이 주변 누군가에게 당장 꼭 필요하다면!?</h2>
						<p class="lead white-text">'다님:'에서는 항상 다님의 서포터 '다님이'를 모집하고 있습니다.
							'다님이'는 부업 또는 전업으로 고객들의 니즈를 해결하여 수익을 창출하실 수 있습니다.
							간단한 심부름, 청소, 못박기부터 번역, 과외, 아이들 돌보미등 여러분이 하실 수 있는 일들은 많습니다.
						</p>
						<a class="main-button icon-button" href="loginForm.do">'다님이' 등록하기</a>
					</div>

				</div>
				<!-- /row -->

			</div>
			<!-- /container -->

		</div>
		<!-- /Call To Action -->

		<!-- Why us -->
		<div id="why-us" class="section">

			<!-- container -->
			<div class="container">

				<!-- row -->
				<div class="row">
					<div class="section-header text-center">
						<h2>왜 '다님' 인가요?</h2>
						<p class="lead">'다님'은 '사람들이 걸어 다니는'이라는 순우리말 입니다.</p>
						<p class="lead">이름의 뜻처럼 많은 사람들이 자연스럽게 본인의 시간을 할애할 수 있도록 최적의 서비스를 제공하는 것이 저희 '다님'의 모토입니다.</p>
					</div>
				</div>
			</div>
			<!-- /container -->

		</div>
		<!-- /Why us -->

		<!-- Contact CTA -->
		<div id="contact-cta" class="section">

			<!-- Backgound Image -->
			<div class="bg-image bg-parallax overlay backimgs" style="background-image:url(resources/img/IMG_1805.jpeg)"></div>
			<!-- Backgound Image -->

			<!-- container -->
			<div class="container">

				<!-- row -->
				<div class="row">

					<div class="col-md-8 col-md-offset-2 text-center">
						<h2 class="white-text">문의 하기</h2>
						<p class="lead white-text">서비스 이용에 문제가 있으시거나 궁금하신 점이 있으시다면 언제든지 연락주세요.</p>
						<a class="main-button icon-button" href="contact.jsp">개발자에게 문의 하기</a>
					</div>

				</div>
				<!-- /row -->

			</div>
			<!-- /container -->

		</div>
		<!-- /Contact CTA -->

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
		<script type="text/javascript" src="resources/js/jquery.min.js"></script>
		<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="resources/js/main.js"></script>

	</body>
</html>
