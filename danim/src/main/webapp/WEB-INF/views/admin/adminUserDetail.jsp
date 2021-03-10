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

		<title>다님: 회원 상세 정보</title>

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
	<!-- <body onload="history.replaceState({}, null, location.pathname);"> -->
	<body>

			<header id="header">
                    <div class="container">
        
                        <div class="navbar-header">
                            <!-- Logo -->
                            <div class="navbar-brand">
                                <a class="logo" href="adminHome.do">
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
						<nav id="nav">
								<ul class="main-menu nav navbar-nav navbar-right">
									<li><a href="#">${loginAdmin.getAdminname()}</a></li>
									<li><a href="adminHome.do">메인으로</a></li>
									<li><a href="adminUsers.do?page=1">회원관리</a></li>
									<li><a href="adminHelpCenter.do?page=1">문의관리</a></li>
									<li><a href="adminNotice.do?page=1">공지관리</a></li>
									<li><a href="logout.do" onclick="logout();">로그아웃</a></li>
									<li><a id="dark" class="btn" onclick="darkModeSwitch(true);">Dark Mode</a></li>
									<li><a id="white" class="btn" onclick="darkModeSwitch(false);">Light Mode</a></li>
								</ul>
							</nav>
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
						<h1 class="white-text">회원 상세 정보</h1>

					</div>
				</div>
			</div>

		</div>
		<!-- /Hero-area -->

		<!-- My Info -->
		<div id="information" class="section" >

			<!-- container -->
			<div class="container" >
				<h2>회원 정보</h2>
				<h3 align="right">다님코인 : <a style="color: #fcc159;" href="payment2.do?userid='${requestScope.user.userid}'">${requestScope.user.money}</a>&nbsp; coin </h3>
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
							<td><span>${requestScope.user.ground}</span></td>
						</tr>
						<tr>
							<td><span class="myinfo">다님이 횟수</span></td>
							<td><span>${requestScope.user.danimcount} 회</span></td>
						</tr>
						<tr>
							<td><span class="myinfo">가입날짜</span></td>
							<td><span>${requestScope.user.enrolldate}</span></td>
                        </tr>
                        <tr>
                            <td><span class="myinfo">블랙리스트 유무(Y/N)</span></td>
                            <td><span>${requestScope.user.black}</span></td>
                        </tr>
					 </table>
					</div>
					<div style="text-align: center;">
                            <c:if test="${requestScope.user.review ge '5'}">
                                <img src="/danim/resources/img/s2.png" alt="" class="grade-rank" style="width: 30%; height: 70%;" /><br><br>
                                <a style="color: #f8b645; font-size: 30px; text-align: center;">${requestScope.user.review}</a><br><br>
                                <img src="/danim/resources/img/10p.png" alt="" class="grade-point" style="width: 30%; height: 50%;" />
                                <!-- <h3 style="margin-top: -10%;"> 내 등급 : S</h3> -->
                            
                            </c:if>
                            <c:if test="${requestScope.user.review ge '4.5' && requestScope.user.review lt '5.0'}">
                                <img src="/danim/resources/img/a1.png" alt="" class="grade-rank" style=" width: 30%; height: 70%;"><br><br>
                                <a style="color: #f8b645; font-size: 30px; text-align: center;">${requestScope.user.review}</a><br><br>
                                <img src="/danim/resources/img/9p.png" alt="" class="grade-point" style=" width: 30%; height: 50%;">
                                <!-- <h3 style="margin-top: -10%;"> 내 등급 : A+</h3> -->
                            </c:if>
                            <c:if test="${requestScope.user.review ge '4.0' && requestScope.user.review lt '4.5'}">
                                <img src="/danim/resources/img/a2.png" alt="" class="grade-rank" style=" width: 30%; height: 70%;"><br><br>
                                <a style="color: #f8b645; font-size: 30px; text-align: center;">${requestScope.user.review}</a><br><br>
                                <img src="/danim/resources/img/8p.png" alt="" class="grade-point" style=" width: 30%; height: 50%;">
                                <!-- <h3 style="margin-top: -10%;"> 내 등급 : A</h3> -->
                            </c:if>
                            <c:if test="${requestScope.user.review ge '3.5' && requestScope.user.review lt '4.0'}">
                                <img src="/danim/resources/img/b1.png" alt="" class="grade-rank" style=" width: 30%; height: 70%;"><br><br>
                                <a style="color: #f8b645; font-size: 30px; text-align: center;">${requestScope.user.review}</a><br><br>
                                <img src="/danim/resources/img/7p.png" alt="" class="grade-point" style=" width: 30%; height: 50%;">
                                <!-- <h3 style="margin-top: -10%;"> 내 등급 : B+</h3> -->
                            </c:if>
                            <c:if test="${requestScope.user.review ge '3.0' && requestScope.user.review lt '3.5'}">
                                <img src="/danim/resources/img/b2.png" alt="" class="grade-rank" style=" width: 30%; height: 70%;"><br><br>
                                <a style="color: #f8b645; font-size: 30px; text-align: center;">${requestScope.user.review}</a><br><br>
                                <img src="/danim/resources/img/6p.png" alt="" class="grade-point" style=" width: 30%; height: 50%;">
                                <!-- <h3 style="margin-top: -10%;"> 내 등급 : B</h3> -->
                            </c:if>
                            <c:if test="${requestScope.user.review ge '2.5' && requestScope.user.review lt '3.0'}">
                                <img src="/danim/resources/img/c1.png" alt="" class="grade-rank" style=" width: 30%; height: 70%;"><br><br>
                                <a style="color: #f8b645; font-size: 30px; text-align: center;">${requestScope.user.review}</a><br><br>
                                <img src="/danim/resources/img/5p.png" alt="" class="grade-point" style=" width: 30%; height: 50%;">
                                <!-- <h3 style="margin-top: -10%;"> 내 등급 : C+</h3> -->
                            </c:if>
                            <c:if test="${requestScope.user.review ge '2.0' && requestScope.user.review lt '2.5'}">
                                <img src="/danim/resources/img/c2.png" alt="" class="grade-rank" style=" width: 30%; height: 70%;"><br><br>
                                <a style="color: #f8b645; font-size: 30px; text-align: center;">${requestScope.user.review}</a><br><br>
                                <img src="/danim/resources/img/4p.png" alt="" class="grade-point" style=" width: 30%; height: 50%;">
                                <!-- <h3 style="margin-top: -10%;"> 내 등급 : C</h3> -->
                            </c:if>
                            <c:if test="${requestScope.user.review ge '1.5' && requestScope.user.review lt '2.0'}">
                                <img src="/danim/resources/img/d1.png" alt="" class="grade-rank" style=" width: 30%; height: 70%;"><br><br>
                                <a style="color: #f8b645; font-size: 30px; text-align: center;">${requestScope.user.review}</a><br><br>
                                <img src="/danim/resources/img/3p.png" alt="" class="grade-point" style=" width: 30%; height: 50%;">
                                <!-- <h3 style="margin-top: -10%;"> 내 등급 : D+</h3> -->
                            </c:if>
                            <c:if test="${requestScope.user.review ge '1.0' && requestScope.user.review lt '1.5'}">
                                <img src="/danim/resources/img/d2.png" alt="" class="grade-rank" style=" width: 30%; height: 70%;"><br><br>
                                <a style="color: #f8b645; font-size: 30px; text-align: center;">${requestScope.user.review}</a><br><br>
                                <img src="/danim/resources/img/2p.png" alt="" class="grade-point" style=" width: 30%; height: 50%;">
                                <!-- <h3 style="margin-top: -10%;"> 내 등급 : D</h3> -->
                            </c:if>
                            <c:if test="${requestScope.user.review ge '0.0' && requestScope.user.review lt '1.0'}">
                                <img src="/danim/resources/img/e2.png" alt="" class="grade-rank" style=" width: 30%; height: 70%;"><br><br>
                                <a style="color: #f8b645; font-size: 30px; text-align: center;">${requestScope.user.review}</a><br><br>
                                <img src="/danim/resources/img/1p.png" alt="" class="grade-point" style=" width: 30%; height: 50%;">
                                <!-- <h3 style="margin-top: -10%;"> 내 등급 : E</h3> -->
                            </c:if>
                            </div>
				</div>
				<br><br>
				<!-- /row -->
					<a class="pagination-back pull-left" onclick="javascript:history.back();">이전</a>
				<c:if test='${requestScope.user.black eq "N"}'>
					<a class="main-button icon-button pull-right" href="addBlack.do?userid=${requestScope.user.userid}">블랙리스트 추가</a>
				</c:if>
				<c:if test='${requestScope.user.black eq "Y"}'>
						<a class="main-button icon-button pull-right" href="delBlack.do?userid=${requestScope.user.userid}">블랙리스트 해제</a>
				</c:if>
			</div>
			<!-- /container -->

		</div>
		<!-- /Contact -->

		<!-- Footer -->
		<c:import url="../headfoot/footer.jsp" />
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
