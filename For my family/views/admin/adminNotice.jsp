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

		<title>다님: 공지 관리</title>

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
						<h1 class="white-text">공지 관리</h1>

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
							<h2 style="border-bottom: 2px solid #fcc159; padding-bottom: 30px; padding-left: 2%">공지사항</h2>
							<input type="text" value="${notice.noticeno}" hidden>
							
							<table>	
								
								<c:forEach var="notice" items="${requestScope.list }">		
									<c:url var="ndt" value="adminNoticeDetail.do">
										<c:param name="noticenum" value="${notice.noticeno}" />
										<c:param name="page" value="${ requestScope.currentPage }" />
									</c:url>					
									<tr class="noti" onclick="javascript:location.href='${ndt}'">						
										<td class="a">
											<span>${notice.noticetitle}</span>
										</td>
										<td class="b">
											<fmt:formatDate value="${notice.noticedate}" type="date" dateStyle="medium" />
										</td>
									</tr>
								</c:forEach>
							</table>
							<div class="row">

							<!-- pagination -->
							<div class="col-md-12">
								<div class="post-pagination">
									
									<c:if test="${requestScope.currentPage gt 1 }">
										<a href="adminNotice.do" class="pagination-back pull-left">처음으로</a>
									</c:if>
									<c:if test="${(currentPage - 10) lt startPage and (currentPage - 10) gt 1 }">
										<a href="adminNotice.do?page=${requestScope.startPage - 10 }">이전</a>
									</c:if>									
									<ul class="pages">
										<c:forEach var="p" begin="${requestScope.startPage }" end="${requestScope.endPage }" step="1">
											<c:if test="${p eq requestScope.currentPage }">
													<li class="active">${ p }</li>
											</c:if>
											<c:if test="${p ne requestScope.currentPage }">
												<li><a href="adminNotice.do?page=${ p }">${ p }</a></li>
											</c:if>
										</c:forEach>
										
                                    </ul>
                                    <c:if test="${requestScope.listCount gt 10}">
                                        <a href="adminNotice.do?page=${requestScope.page+1}" class="pagination-next pull-right">다음</a>
                                    </c:if>
                                </div>
                                <br><br>
                                <a href="adminNoticeInsertView.do" class="main-button icon-button pull-right" style="cursor: pointer;"> 공지 등록 </a>
							</div>
							<!-- pagination -->
		
								</div>
								<!-- /row -->
		
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
