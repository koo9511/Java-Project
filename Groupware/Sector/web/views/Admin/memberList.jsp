<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Master" %>
 <%
    Master loginMaster = (Master)session.getAttribute("loginMaster");
%>
<!DOCTYPE html>
<html>
<head>		
	<title>Member List</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="../../resources/css/memberlist.css" />
	<script type="text/javascript" src="../../resources/js/jquery.min.js"></script>
	<noscript><link rel="stylesheet" href="../../resources/css/noscript.css" /></noscript>			
</head>
<body class="is-preload" onload="document.searchfrm.userid.focus();"><img src="../../images/se.png" id="bg" alt="">
			
		<!-- Wrapper --> 
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<div class="inner">

							<!-- Logo -->
							<a href="../../index.jsp" class="logo">
									<span class="symbol"><img src="../../images/SectorLogo.png"/></span>
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
						<br>
						<ul>
							<li id="loginmenu"><a href="views/member/DetailView.jsp"><%= loginMaster.getMasterName() %> 님</a></li>
							<li><a href="../../index.jsp">Home</a></li>
							<li><a href="./DetailView.jsp">관리자 정보</a></li>
							<li><a href="./memberList.jsp">회원 관리</a></li>
							<li><a href="#">서비스 신청 현황</a></li>
							<li><a href="#">문의함</a></li>
							<li><a href="#">공지사항 등록</a></li>
							<li><a href="/Sector/logout" id="logout" name="logout" onclick="logoutm();">로그아웃</a></li>
						</ul>
					</nav>
				
				<!-- List -->
				<form action="" class="inner views">
						<br><br>
							<table cellspacing="5" cellpadding="0" class="view">
								 <tr>
									 <th colspan="5" rowspan="2"><h2>회원 목록</h2></th>
								 </tr>
								 <tr>
									<th colspan="2"><br><br><br></th>
								</tr>
								 <tr>
									 <th>이 름</th>
									 <th>아이디</th>
									 <th>이메일</th>
									 <th>회사명</th>
									 <th>서비스</th>
								 </tr>
								 <tr>
									 <th colspan="2">
										 <br>
										<!-- <button type="button" onclick="location='./update.jsp'" class="btn">수정하기</button> &nbsp;&nbsp; -->
										<!-- <button type="reset"  onclick="location='../../index.jsp'" class="btn">확인</button> -->
									</th>
								 </tr>
						</table>
						<br><br>
					</form>
						<br>
	
			
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
			<script src="../../resources/js/jquery.min.js"></script>
			<script src="../../resources/js/browser.min.js"></script>
			<script src="../../resources/js/breakpoints.min.js"></script>
			<script src="../../resources/js/util.js"></script>
			<script src="../../resources/js/main.js"></script>
			<script type="text/javascript">
			$(function(){
				$('div#login').focus();
			});
			</script>
	</body>
</html>