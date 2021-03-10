<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Master"%>
    <%
		Master loginMaster = (Master)session.getAttribute("loginMaster");
    %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Welcome to SECTOR !!</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		
		<link rel="stylesheet" href="resources/css/main.css" />
		<script type="text/javascript" src="resources/js/jquery.min.js"></script>
		<noscript><link rel="stylesheet" href="resources/css/noscript.css" /></noscript>
		<!-- <style type="text/css">
			div {
				border: 1px solid red;
		</style>
			} -->
	</head>
	<body class="is-preload" ><img src="images/se.png" id="bg" alt=""/><audio src="images/hello mother f_cker sound effect.mp3" autoplay></audio>
		<!-- onload="document.fadeIn();" -->
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<div class="inner">

							<!-- Logo -->
							<a href="index.jsp" class="logo">
									<span class="symbol"><img src="images/SectorLogo.png"/></span>
									<span class="title">Sector</span>
							</a>
									<!-- <a href="#main" class="introduce">
										<span>기능 소개</span>
									</a>  &nbsp;&nbsp;
									<a href="#footer" class="introduce2">문의 하기</a> -->
							<!-- Nav -->
								<nav>
									<ul>
										<li><a href="#menu">Menu</a></li>
									</ul>
								</nav>
						</div>
					</header>
				
<% if(loginMaster == null){ // 로그인 안 했을 때 %>
	

				<!-- Menu -->
				<nav id="menu">
						<h2 style="text-align: center;">Menu</h2>
						<ul>
							<li><a href="index.jsp">Home</a></li>
							<li><a href="views/login.jsp">로그인</a></li>
							<li><a href="#footer">문의하기</a></li>
							<li><a href="#">공지사항</a></li>
						</ul>
					</nav>
					
<% } else if(loginMaster.getMasterId().equals("admin")) { %>
	<!-- <script type="text/javascript">
		$(function(){
			alert("관리자 계정으로 로그인 했습니다.");
		});
	</script> -->
					<nav id="menu">
						<br>
						<ul>
							<li id="loginmenu"><a href="views/member/DetailView.jsp"><%= loginMaster.getMasterName() %> 님</a></li>
							<li><a href="index.jsp">Home</a></li>
							<li><a href="views/member/DetailView.jsp">관리자 정보</a></li>
							<li><a href="views/Admin/memberList.jsp">회원 관리</a></li>
							<li><a href="#">서비스 신청 현황</a></li>
							<li><a href="#">문의함</a></li>
							<li><a href="#">공지사항 등록</a></li>
							<li><a href="/Sector/logout" id="logout" name="logout" onclick="logoutm();">로그아웃</a></li>
						</ul>
					</nav>
<% } else if(loginMaster.getMasterName() != null){ %>
					<nav id="menu">
						<br>
						<ul>
							<li id="loginmenu"><a href="views/member/DetailView.jsp"><%= loginMaster.getMasterName() %> 님</a></li>
							<li><a href="index.jsp">Home</a></li>
							<li><a href="views/member/DetailView.jsp">내 정보</a></li>
							<li><a href="#footer">문의하기</a></li>
							<li><a href="views/servicecenter.html">공지사항</a></li>
							<li><a href="/Sector/logout" id="logout" name="logout" onclick="logoutm();">로그아웃</a></li>
						</ul>
					</nav>

<% } %>
					<script type="text/javascript">
						function logoutm(){
							alert("로그아웃 되었습니다.");
						}
					</script>
				<!-- banner -->
					
					<div id="banner">
						<img src="images/sample1.png" />
						<img src="images/sample2.png" />
						<img src="images/sample3.png" />
					</div>
					
						<p></p>
				<!-- Main -->
					<div id="main">
						<div class="inner">
							<header>	
								<br><br>
								<div class="intro">
									<p id="i1">전자결재, 메일, 게시판, 일정관리, 스케줄러 등</p>
									<p id="i2">업무 효율을 높여주는 Sector 그룹웨어, <span class="point-txt">무료</span>로 이용하세요!</p>
								</div>
								<p/>
							</header>
							<section class="tiles" id="tiles">
								<article class="style1">
									<span class="image">
										<img src="images/addressbook.png" onclick="change(1)"/>
									</span>
									<a class="#tiles" onclick="change(1)" ;">
										<div class="content">
											<p>주소록</p>
										</div>
									</a>
								</article>
								<article class="style2">
									<span class="image">
										<img src="images/calander.png" onclick="change(2);" />
									</span>
									<a class="#tiles" onclick="change(2)">
										<div class="content">
											<p>캘린더</p>
										</div>
									</a>
								</article>
								<article class="style3">
									<span class="image">
										<img src="images/hr.png" onclick="change(3)"/>
									</span>
									<a class="#tiles" onclick="change(3)">
										<div class="content">
											<p>인사관리</p>
										</div>
									</a>
								</article>
								<article class="style4">
									<span class="image">
										<img src="images/email.png" onclick="change(4)"/>
									</span>
									<a class="#tiles" onclick="change(4)">
										<div class="content">
											<p>전자메일</p>
										</div>
									</a>
								</article>
								<article class="style5">
									<span class="image">
										<img src="images/board.png" onclick="change(5)"/>
									</span>
									<a class="#tiles" onclick="change(5)">
										<div class="content">
											<p>게시판</p>
										</div>
									</a>
								</article>
								<article class="style6">
									<span class="image">
										<img src="images/Ap.png" onclick="change(6)"/>
									</span>
									<a class="#tiles" onclick="change(6)">
										<div class="content">
											<p>전자결재</p>
										</div>
									</a>
								</article>
							</section>
						</div>
					</div>
				<!-- information -->
				<div id="info">
					<div class="inner">
									<img class="infoimg" id="infoimage" src="images/info01.png"> &nbsp;
									<div class="infotext" id="infotext">
											<h2>주소록</h2><br><h6>비즈니스 필수템</h6><br><h6>보다 효율적인 인맥관리가 가능합니다.</h6>
									</div>
					</div>
				</div>
				<br><br><br>
				<!-- Footer -->
					<footer id="footer">
						<div class="inner">
							<section>
								<h2>문의 하기</h2>
								<form method="post" action="#">
									<div class="fields">
										<div class="field half">
											<input type="text" name="name" id="name" placeholder="이름" />
										</div>
										<div class="field half">
											<input type="email" name="email" id="email" placeholder="이메일" />
										</div>
										<div class="field">
											<textarea name="message" id="message" placeholder="문의 내용"></textarea>
										</div>
									</div>
									<ul class="actions">
										<li><input type="submit" value="보내기" class="primary" /></li>
									</ul>
								</form>
							</section>
							<section>
								<h2>SNS</h2>
								<ul class="icons">
									<li><a href="#" class="icon brands style2 fa-github"><span class="label">GitHub</span></a></li>
									<li><a href="#" class="icon brands style2 fa-facebook-f"><span class="label">Facebook</span></a></li>
									<li><a href="#" class="icon brands style2 fa-instagram"><span class="label">Instagram</span></a></li>
									<br>
									<li><a href="#" class="icon solid style2 fa-phone"><span class="label">Phone</span></a></li>
									<li><a href="#" class="icon solid style2 fa-envelope"><span class="label">Email</span></a></li>
								</ul>
							</section>
							<ul class="copyright">
								<li>&copy; 서울특별시 강남구 테헤란로 남도빌딩 2층 B Class</li><li>Disign by Koogunmo</li>
							</ul>
						</div>
					</footer>

			</div>

		<!-- Scripts -->
			<script src="resources/js/jquery.min.js"></script>
			<script src="resources/js/browser.min.js"></script>
			<script src="resources/js/breakpoints.min.js"></script>
			<script src="resources/js/util.js"></script>
			<script src="resources/js/main.js"></script>
			<script>
				$(function(){
					$('#banner img').hide();
					$('#banner img').first().show();
					setInterval(function(){
						$('#banner').append($('#banner img').first());
						$('#banner img').last().hide();
						$('#banner img').first().fadeIn('slow').show(); // 페이드인
					}, 5000);

				});

				function change(input) {
					var num = input;
					var num2 = input;

					var $infotext = document.getElementById('infotext');

					if(input < 10) 
						num = "0"+input;
					var imageSrc = "images/info"+num+".png";

					document.getElementById('infoimage').src = imageSrc;
					
					if(num2==1){
						$infotext.innerHTML = "<h2>주소록</h2><br><h6>비즈니스 필수템</h6><br><h6>보다 효율적인 인맥관리가 가능합니다.</h6>";
					}else if(num2==2){
						$infotext.innerHTML = "<h2>캘린더</h2><br><h6>우리의 타임키퍼</h6><br><h6>개인적으로 사용하고 싶을만큼 편리합니다.</h6>";
					}else if(num2==3){
						$infotext.innerHTML = "<h2>인사관리</h2><br><h6>회사 사랑 직원 사랑</h6><br><h6>직원들은 월급을 주지 않으면 일을 하기 싫어합니다.</h6>";
					}else if(num2==4){
						$infotext.innerHTML = "<h2>전자메일</h2><br><h6>스팸, 피싱 메일과의 이별</h6><br><h6>사내 도메인을 사용하여 외부 바이러스 걱정이 없습니다.</h6>";
					}else if(num2==5){
						$infotext.innerHTML = "<h2>게시판</h2><br><h6>거의 뭐 클라우드(?)</h6><br><h6>그냥 일반 게시판입니다. 이쁩니다.</h6>";
					}else if(num2==6){
						$infotext.innerHTML = "<h2>전자결재</h2><br><h6>기업에는 꼭 필요한 ERP</h6><br><h6>언제까지 결재서류 들고 다니시겠습니까?</h6>";
					}
            }
			$('.tiles').click(function() { 
				$('.infoimg').fadeIn('slow', function() { 
					});
				$('.infotext').fadeIn('slow', function(){
				});
			});

			</script>
			<script>
				$("body").hide().fadeIn(1500);
			</script>
	</body>
</html>