<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Master"%>
    <%--  <%
    	String result = (String)request.getAttribute("result");
    %> --%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Login</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../resources/css/login.css" />
		<script type="text/javascript" src="../resources/js/jquery.min.js"></script>
		<noscript><link rel="stylesheet" href="../resources/css/noscript.css" /></noscript>

		<%
			String result = (String)session.getAttribute("result");
			if(result == null){
				result = "s";
			}
			if(result.equals("실패")){
		%>		
			<script type="text/javascript">
				$(function(){
					alert("등록된 계정이 없습니다.");
					});
			</script>
		<%
			session.removeAttribute("result");
			}
		%> 
		<script type="text/javascript">
			function loginid(){
				if($("#userid").val() != ""){
					document.getElementById("userid").style.borderBottom="solid 2px #489CFF";
					document.getElementById("userid").style.backgroundColor="#e9f1ff";
					document.getElementById("userid").style.transition="700ms"
				}
			}
			function loginpwd(){
				if($("#userpwd").val() != ""){
					document.getElementById("userpwd").style.borderBottom="solid 2px #489CFF";
					document.getElementById("userpwd").style.backgroundColor="#e9f1ff";
					document.getElementById("userpwd").style.transition="700ms"
			}
			}
		</script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	

	</head>
	<body class="is-preload" onload="document.loginfrm.userid.focus();"><img src="../images/se.png" id="bg" alt="">
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
								<h2 class="align-center">로그인</h2>
							</div>
							<section class="loginsec">
							<form action="/Sector/login" method="post" class="loginfrm" id="loginfrm" name="loginfrm">
									<div id="loginforminput">
										<input type="text" id="userid" name="userid" minlength="2" maxlength="12" required placeholder="I D" onblur="loginid();"> <br>
										<input type="password" id="userpwd" name="userpwd" minlength="2" required placeholder="PASS" onblur="loginpwd();">
									</div>
									<br><br>
									<div id="btninfo">
											<button type="submit" class="btn">Login</button>

											<br><br>
											<a id="kakao-login-btn"></a>
											<script type='text/javascript'>
												// 나의 키
												  Kakao.init('f2b7c168ce83b990eff490475cbc6acf');
												  // 카카오 로그인 버튼
												  Kakao.Auth.createLoginButton({
													container: '#kakao-login-btn',
													success: function(authObj) {
													  // 로그인 성공시, API를 호출
													  Kakao.API.request({
														url: '/v1/user/me',
														success: function(res) {
														// console.log(res);
														
														  alert(res.properties.nickname+'님 환영합니다!');
														  location.href="../index.jsp";
														  var email = res.kaccount_email;
														  console.log(email);
														  $.ajax({
															async: false,
															type : 'POST',
															data : {email: email},
															url : "/Sector/kakaologin",
															
														}); //ajax
														},
														
														fail: function(error) {
														  alert("실패하였습니다.");
														}
													  });
													},
													fail: function(err) {
													  alert(JSON.stringify(err));
													}
												  });
												//]]>
											  </script>
											  <br>
											  <a id="naver_id_login"></a>
											  <script type="text/javascript">
												var naver_id_login = new naver_id_login("koogunmo", "http://127.0.0.1:8888/Sector/views/callback.jsp");
												var state = naver_id_login.getUniqState();
												naver_id_login.setButton("green",3,40);
												naver_id_login.setDomain("http://127.0.0.1:8888/Sector/views/login.jsp");
												naver_id_login.setState(state);
												naver_id_login.setPopup();
												naver_id_login.init_naver_id_login();
											</script> 
											
											  <br><br>
											<a href="enroll.jsp" id="info1">회원 가입 </a>
											<a href="search.jsp" id="info2">계정 찾기</a>
									</div>
									

							</form>		
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
			<!-- <script>
					$("body").hide().fadeIn(1500);
				</script> -->
	</body>
</html>