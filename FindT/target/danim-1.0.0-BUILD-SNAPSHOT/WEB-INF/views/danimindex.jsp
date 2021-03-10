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
		<header id="header" class="">
			<div class="container">

				<div class="navbar-header" class="backimgs">
					<!-- Logo -->
					<div class="navbar-brand">
						<a class="logo" href="danimChange.do">
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
						<li><a href="danimChange.do">메인으로</a></li>
                        <li><a href="myPage.do?userid=${loginUser.getUserid()}">내 정보</a></li>
                        <li><a href="#">서비스 현황</a></li>
						<li><a href="#">고객센터</a></li>
						<li><a href="noticeForm.do?page=1">공지사항</a></li>
						<li><a  href="logout.do" ">로그아웃</a></li>
					</ul>
				</nav>
				<!-- /Navigation -->
				
			</div>
		</header>
		<!-- /Header -->

		<!-- Hero-area -->
		<div class="hero-area section">

			<!-- Backgound Image -->
			<div class="bg-image bg-parallax overlay" style="background-image:url(/danim/resources/img/IMG_0078.jpeg)"></div>
			<!-- /Backgound Image -->

			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 text-center">
						<ul class="hero-area-tree">
							<li>Danim:</li>
						</ul>
						<h1 class="white-text">다님이를 기다리고 있어요!</h1>
					</div>
					<a class="main-button icon-button pull-right" href="userChange.do" style="margin-bottom: -5%;">다님이에게 도움받기</a>
				</div>
			</div>

		</div>
		<!-- /Hero-area -->

		<!-- Blog -->
		<div id="blog" class="section">
			
			<!-- container -->
			<div class="container">
				<h3>내 주변 요청</h3>
				<hr style="border-color: #fcc159;">
				<br><br>
				<!-- row -->
				<div class="row">

					<!-- main blog -->
					<div id="main" class="col-md-9">

						<!-- row -->
						<div class="row">

							<!-- single blog -->
							<div class="col-md-6">
								<div class="single-blog">
									<!-- <div class="blog-img">
										<a href="#">
											<img src="/danim/resources/img/pet.png" alt="">
										</a>
									</div> -->
									<h4><a href="#">10월28일 Roiing Hall 공연하실 '드러머'</a></h4>
									<div class="blog-meta">
										<span class="blog-meta-author"><a href="#">전문가/비즈니스</a></span>
										<div class="pull-right">
											<span class="course-price course-premium uiprice">₩100,000원</span>
										</div>
									</div>
								</div>
							</div>
							<!-- /single blog -->

							<!-- single blog -->
							<div class="col-md-6">
								<div class="single-blog">
									<h4><a href="#">코드 수정해주실 FrontEnd 개발자 모십니다.</a></h4>
									<div class="blog-meta">
										<span class="blog-meta-author"><a href="#">전문가/비즈니스</a></span>
										<div class="pull-right">
											<span class="course-price course-premium uiprice">₩150,000원</span>
										</div>
									</div>
								</div>
							</div>
							<!-- /single blog -->

							<!-- single blog -->
							<div class="col-md-6">
								<div class="single-blog">
									<h4><a href="#">강아지 돌봐주실 분 구합니다!</a></h4>
									<div class="blog-meta">
										<span class="blog-meta-author"><a href="#">돌봐주기</a></span>
										<div class="pull-right">
											<span class="course-price course-premium uiprice">₩5,000원</span>
										</div>
									</div>
								</div>
							</div>
							<!-- /single blog -->

							<!-- single blog -->
							<div class="col-md-6">
								<div class="single-blog">
									<h4><a href="#">애플스토어에서 아이패드프로 대신 사다주실 분</a></h4>
									<div class="blog-meta">
										<span class="blog-meta-author"><a href="#">쇼핑하기</a></span>
										<div class="pull-right">
											<span class="course-price course-premium uiprice">₩10,000원</span>
										</div>
									</div>
								</div>
							</div>
                            <!-- /single blog -->
                            <!-- single blog -->
							<div class="col-md-6">
								<div class="single-blog">
									<h4><a href="#">택배 잠시 맡아주실 분 구합니다.</a></h4>
									<div class="blog-meta">
										<span class="blog-meta-author"><a href="#">물건 맡아주기</a></span>
										<div class="pull-right">
											<span class="course-price course-premium uiprice">₩3,000원</span>
										</div>
									</div>
								</div>
							</div>
                            <!-- /single blog -->
                            <!-- single blog -->
							<div class="col-md-6">
								<div class="single-blog">
									<h4><a href="#">감기약 사다주세요.</a></h4>
									<div class="blog-meta">
										<span class="blog-meta-author"><a href="#">사다주기</a></span>
										<div class="pull-right">
											<span class="course-price course-premium uiprice">₩3,000원</span>
										</div>
									</div>
								</div>
							</div>
                            <!-- /single blog -->
                            <!-- single blog -->
							<div class="col-md-6">
								<div class="single-blog">
									<h4><a href="#">편의점에서 과자 사다주실 분 구합니다.</a></h4>
									<div class="blog-meta">
										<span class="blog-meta-author"><a href="#">사다주기</a></span>
										<div class="pull-right">
											<span class="course-price course-premium uiprice">₩3,000원</span>
										</div>
									</div>
								</div>
							</div>
                            <!-- /single blog -->
                            <!-- single blog -->
							<div class="col-md-6">
								<div class="single-blog">
									<h4><a href="#">건대 마라쿵푸에서 마라탕 사다주세요!</a></h4>
									<div class="blog-meta">
										<span class="blog-meta-author"><a href="#">사다주기</a></span>
										<div class="pull-right">
											<span class="course-price course-premium uiprice">₩5,000원</span>
										</div>
									</div>
								</div>
							</div>
							<!-- /single blog -->

						</div>
						<!-- /row -->

						<!-- row -->
						<div class="row">

							<!-- pagination -->
							<div class="col-md-12">
								<div class="post-pagination">
									<a href="#" class="pagination-back pull-left">이전</a>
									<ul class="pages">
										<li class="active">1</li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
									</ul>
									<a href="#" class="pagination-next pull-right">다음</a>
								</div>
							</div>
							<!-- pagination -->

						</div>
						<!-- /row -->
					</div>
					<!-- /main blog -->

					<!-- aside blog -->
					<div id="aside" class="col-md-3">

						<!-- search widget -->
						<div class="widget search-widget">
							<form>
								<input class="input" type="text" name="search" placeholder="검색">
								<button><i class="fa fa-search"></i></button>
							</form><br>
							<a class="main-button icon-button pull-right" href="#" style="width: 100%; text-align: center;">다님이 등록하기</a><br>
						</div>
						<!-- /search widget -->

						<!-- category widget -->
						<div class="widget category-widget">
							<h3>카테고리</h3>
							<a class="category" href="#">전문가/비즈니스 <span>12</span></a>
							<a class="category" href="#">돌봐주기 <span>5</span></a>
							<a class="category" href="#">물건 맡아주기 <span>24</span></a>
							<a class="category" href="#">쇼핑해주기 <span>78</span></a>
                            <a class="category" href="#">사다주기 <span>36</span></a>
                            <a class="category" href="#">줄 서주기 <span>3</span></a>
						</div>
						<!-- /category widget -->

						<!-- posts widget -->
						
						<!-- /posts widget -->

						<!-- tags widget -->
						<div class="widget tags-widget">
							<h3>추천 검색 태그</h3>
							<a class="tag" href="#">Java</a>
							<a class="tag" href="#">개발자</a>
							<a class="tag" href="#">애완동물</a>
							<a class="tag" href="#">서울</a>
							<a class="tag" href="#">심부름</a>
							<a class="tag" href="#">배달</a>
							<a class="tag" href="#">대타</a>
						</div>
						<!-- /tags widget -->

					</div>
					<!-- /aside blog -->

				</div>
				<!-- row -->

			</div>
			<!-- container -->

		</div>
		<!-- /Blog -->

		<!-- Footer -->
		<footer id="footer" class="section">

			<!-- container -->
			<div class="container">

				<!-- row -->
				<div class="row">

					<!-- footer logo -->
					<div class="col-md-6">
						<div class="footer-logo">
							<a class="logo" href="danimChange.do">
								<img src="/danim/resources/img/logo.png" alt="logo">
							</a>
						</div>
					</div>
					<!-- footer logo -->

					
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
