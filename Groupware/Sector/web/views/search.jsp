<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Master"%>
   
<!DOCTYPE HTML>
<html>
	<head>
		<title>Find</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../resources/css/searchselect.css" />
		<script type="text/javascript" src="../resources/js/jquery.min.js"></script>
		<noscript><link rel="stylesheet" href="../resources/css/noscript.css" /></noscript>

	

	</head>
	<body class="is-preload"><img src="../images/se.png" id="bg" alt="">
			<!-- onload="document.loginfrm.userid.focus()" -->
		<!-- Wrapper --> 
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<div class="inner">

							<!-- Logo -->
							<a href="../index.jsp" class="logo">
									<span class="symbol"><img src="../images/SectorLogo.png"/></span>
									<span class="title">Sector</span>
									
							</a>

							<!-- Nav -->
								<nav>
									<ul>
										<li><a href="#menu">Menu</a></li>
									</ul>
								</nav>
						</div>
					</header>

				<!-- Menu -->
					<nav id="menu">
						<h2>Menu</h2>
						<ul>
							<li><a href="../index.jsp">Home</a></li>
							<li><a href="./login.jsp">로그인</a></li>
							<li><a href="../index.jsp#footer">문의하기</a></li>
							<li><a href="./servicecenter.html">공지사항</a></li>
						</ul>
					</nav>
				
				<!-- login -->
					<div id="login" class="login">
						<div class="inner">
							<div class="intro">
								<br><br><br>
								<h2 class="align-center">계정 찾기</h2>
							</div>
							<section class="loginsec">
							
									<div id="loginforminput"> <br>
										<button type="button" class="btn" onclick="location='member/searchId.jsp'">아이디 찾기</button> <br><br>
										<button type="button" class="btn" onclick="location='member/searchPwd.jsp'">비밀번호 찾기</button>
									</div>
									<br><br>
									<div id="btninfo">
											<a href="login.jsp" id="info1">로그인 </a>
											<a href="../index.jsp" id="info2">홈으로</a>
									</div>
									


						</section>
						</div>
					</div>
			
				<!-- Footer -->
					<footer id="footer">
						<div class="inner">
							<ul class="copyright">
								<li>&copy; 서울특별시 강남구 테헤란로 남도빌딩 2층 B</li><li>Disign by Koogunmo</li>
							</ul>
						</div>
					</footer>

			</div>
			
			
			
		


		<!-- Scripts -->
			<script src="../resources/js/jquery.min.js"></script>
			<script src="../resources/js/browser.min.js"></script>
			<script src="../resources/js/breakpoints.min.js"></script>
			<script src="../resources/js/util.js"></script>
			<script src="../resources/js/main.js"></script>
			<script type="text/javascript">
			$(function(){
				$('div#login').focus();
			});
			</script>
	</body>
</html>