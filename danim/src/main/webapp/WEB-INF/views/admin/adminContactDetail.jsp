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

		<title>다님: 문의 관리</title>

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
                
                $(document).ready(function() {
		  $('.container').on( 'keyup', 'textarea', function (e){
			$(this).css('height', 'auto' );
			$(this).height( this.scrollHeight );
		  });
		  $('.container').find( 'textarea' ).keyup();
		});
        </script>
       	
    <style>
		
		textarea.autosize {
		  
		  resize: none;
		  overflow-y: hidden; 
		  padding: 1.1em; 
		  padding-bottom: 0.2em;
		  line-height: 1.6;
		  color: inherit;
		}
	  </style>

       
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
							<li><a href="index.do">Danim:</a></li>
						</ul>
						<h1 class="white-text">문의 관리</h1>

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
				<div class="row" style="border-bottom: 2px solid #fcc159; padding-bottom: 8px; padding-left: 2%; padding-right: 2%; display: block;" >
                        <h2 class="pull-left" >${contact.contacttitle}</h2>
                        <h4 class="pull-right" >${contact.contactdate}</h4>
                        <c:if test="${contact.contactstatus eq '미완료'}"><h4 style="color: #f75b5b; margin-right: 5%;" class="pull-right"></c:if>
                        <c:if test="${contact.contactstatus eq '답변완료'}"><h4 style="color: rgb(12, 194, 12); margin-right: 5%;" class="pull-right"></c:if>
                        ${contact.contactstatus}</h4>
                </div>
                <br>
                    <textarea style="border: none; white-space: pre; color: #374050;" id="noticeDetail" class="autosize" disabled>${contact.contactcontent}</textarea>
                   
                    <br><hr style="border: 1px solid #fcc159;">

                    <a class="main-button icon-button pull-left" onclick="javascript:history.back();" style="cursor: pointer;">목록보기</a>
                    <a href="mailto:${contact.writeremail}" class="main-button icon-button pull-right" style="cursor: pointer;">답변하기</a>
                    <c:if test="${contact.contactstatus eq '미완료'}">
                        <a href="javascript:location.href='adminContactAnswer.do?contactno=${contact.contactno}'" class="main-button icon-button pull-right" style="cursor: pointer; margin-right: 5%;">완료하기</a>
                    </c:if>
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
