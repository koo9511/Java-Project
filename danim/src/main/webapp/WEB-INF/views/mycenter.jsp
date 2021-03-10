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
		<c:import url="headfoot/header.jsp" />
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
							<h2 style="border-bottom: 2px solid #fcc159; padding-bottom: 30px; padding-left: 2%">문의 내역</h2>
							<table class="mycenter-table">
                                <tr style="border-bottom: 2px solid #fcc159; text-align: center;" class="mycenter-tr">
                                    <td class="mycentertitle center-title" style="padding-bottom: 10px; width: 50%;">
                                        <span>제 목</span>
                                    </td>
                                    <td class="mycentertitle center-catogory d-none d-md-table-cell" style="padding-bottom: 10px;">
                                        <span>종 류</span>
                                    </td>
                                    <td class="mycentertitle center-status" style="padding-bottom: 10px;">
                                        <span>상 태</span>
                                    </td>
                                    <td class="mycentertitle center-date-title" style="padding-bottom: 10px;">
                                        <span>날 짜</span>
                                    </td>
                                </tr>   
								<c:forEach var="helpcenter" items="${requestScope.list }">		
									<c:url var="hdt" value="helpcenterDetail.do">
										<c:param name="helpcenterno" value="${helpcenter.helpcenterno}" />
										<c:param name="page" value="${ requestScope.currentPage }" />
									</c:url>					
									<tr class="noti" onclick="javascript:location.href='${hdt}'" style="text-align: center; font-size: 1.1em; font-weight: 500; border: none; padding-top: 10px;">
										<td style="padding-top: 10px;" class="center-title">
											<span>${helpcenter.helptitle}</span>
                                        </td>
                                        <td style="padding-top: 10px;" class="center-catogory d-none d-md-table-cell">
                                            <span>${helpcenter.helpcategory}</span>
                                        </td>
                                        <td style="padding-top: 10px;" class="center-status">
											<c:if test="${helpcenter.helpstatus eq '미완료'}"><span style="color: #f75b5b;"></c:if>
											<c:if test="${helpcenter.helpstatus eq '답변완료'}"><span style="color: rgb(12, 194, 12);"></c:if>
											${helpcenter.helpstatus}</span>
                                        </td>                                        
										<td style="padding-top: 10px;" class="center-date d-none d-md-table-cell">
											<div>
											<fmt:formatDate value="${helpcenter.helpdate}" type="date" dateStyle="medium"/>
										</div>
										</td>
									</tr>
								</c:forEach>
							</table>
							<h5 style="color: #f75b5b; margin-top: 10%;" class="text-center">문의 하신 답변은 가입시 작성한 이메일로 발송됩니다.</h5>
							<div class="row">

							<!-- pagination -->
							<div class="col-md-12">
								<div class="post-pagination">
									
									<c:if test="${requestScope.currentPage gt 1 }">
										<a href="noticeForm.do" class="pagination-back pull-left">처음으로</a>
									</c:if>
									<c:if test="${(currentPage - 10) lt startPage and (currentPage - 10) gt 1 }">
										<a href="noticeForm.do?page=${requestScope.startPage - 10 }">이전</a>
									</c:if>									
									<ul class="pages">
										<c:forEach var="p" begin="${requestScope.startPage }" end="${requestScope.endPage }" step="1">
											<c:if test="${p eq requestScope.currentPage }">
													<li class="active">${ p }</li>
											</c:if>
											<c:if test="${p ne requestScope.currentPage }">
												<li><a href="noticeForm.do?page=${ p }">${ p }</a></li>
											</c:if>
										</c:forEach>
										
									</ul>
									<c:if test="${requestScope.listCount gt 10}">
										<a href="noticeForm.do?page=${requestScope.page+1}" class="pagination-next pull-right">다음</a>
									</c:if>
								</div>
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
