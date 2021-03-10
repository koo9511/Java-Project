<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		 <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<title>다님: 고객센터</title>

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
				 if(!$("#title").val()){
					alert("문의 제목을 작성해주세요.");
					$("#title").focus();
					return false;
					 }
				 if(!$("#helpcontent").val()){
					alert("문의 내용을 작성해주세요.");
					$("#helpcontent").focus();
					return false;
					 }
					
				alert("문의가 성공적으로 전송되었습니다. 답변은 2일이내 가입된 이메일로 전송됩니다.");
				return true;
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
			<div class="bg-image bg-parallax overlay" style="background-image:url(resources/img/page-background.jpg)"></div>
			<!-- /Backgound Image -->

			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 text-center">
						<ul class="hero-area-tree">
							<li><a href="#">Danim:</a></li>
							
						</ul>
						<h1 class="white-text">고객센터</h1>

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
							<form action="helpcenterInsert.do" method="POST">
								<select class="input select" name="helpcategori" id="categori" required>
									<option hidden="true">분 류</option>
									<option value="신고">사용자 신고</option>
									<option value="장애">서비스 장애</option>
									<option value="코인">코인 문의</option>
									<option value="복구">복구 관련</option>
									<option value="기타">기타사항</option>
								</select>
								
							

								<!-- 기타사항 -->
							
								<div id="n1" class="n1">
									<input class="input" type="text" name="helpuserid" id="userid" value="${loginUser.getUserid()}" readonly>
									<input class="input" type="text" name="helptitle" id="title" placeholder="제목" required>
									<textarea class="input" name="helpcontent" id="helpcontent" placeholder="문의 내용" required></textarea>
									<h2 style="color: rgb(235, 119, 119); font-size: 0.5em;">신고 내용과 관련 없는 자료 등록 및 허위 사실 확인 시 불이익이 있을 수 있습니다.</h2>
									<button class="main-button icon-button pull-right" type="submit" onclick="return send();">문의하기</button>
								</div>
								<!-- 신고 -->
								<!-- <div id="n2" class="n2 hidden">
									<input class="input" type="text" name="helpuserid" id="userid2" value="${loginUser.getUserid()}" readonly>
									<!-- <select class="input select" name="helpno" id="danimlist2" style="width: 100%;"> -->
										<!-- 수 정 해 야 함 -->
										<!-- 수 정 해 야 함 -->
										<!-- 수 정 해 야 함 -->
										<!-- 수 정 해 야 함 -->
										<!-- <option hidden="true">최근 다님 내역</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option> -->
										<!-- 수 정 해 야 함 -->
										<!-- 수 정 해 야 함 -->
										<!-- 수 정 해 야 함 -->
										<!-- 수 정 해 야 함 -->
									<!-- </select> -->
									<!-- 상대방아이디 
									<input class="input" type="text" name="helpotherid" id="otherid2" value="" hidden> 
									
									<input class="input" type="text" name="helptitle" id="title2" placeholder="제목">
									<textarea class="input" name="helpcontent" id="content2" placeholder="신고 내용 자세히 기재"></textarea>
									<h2 style="color: rgb(235, 119, 119); font-size: 0.5em;">신고 내용과 관련 없는 자료 등록 및 허위 사실 확인 시 불이익이 있을 수 있습니다.</h2>
									<button class="main-button icon-button pull-right" type="submit" onclick="return send(2);">신고하기</button>
								</div> -->
								
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
		<c:import url="headfoot/footer.jsp" />
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
