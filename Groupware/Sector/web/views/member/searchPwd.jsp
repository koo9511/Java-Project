<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Master"%>
    <%--  <%
    	String result = (String)request.getAttribute("result");
    %> --%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>PasswordSearch</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../../resources/css/search.css" />
		<script type="text/javascript" src="../../resources/js/jquery.min.js"></script>
		<noscript><link rel="stylesheet" href="../../resources/css/noscript.css"></noscript>

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
			} else if(!(result.equals("s"))) {
        %>
            <script type="text/javascript">
                $(function(){                
                     alert("비밀번호 변경 페이지로 이동합니다.");
                      location.href="./searchupdate.jsp";
                   });
            </script>
        <%
        } else {
            session.removeAttribute("result");
            }
        %>
        <script type="text/javascript">
        
           function userid(){
				if($("#id").val() != ""){
					document.getElementById("id").style.borderBottom="solid 2px #489CFF";
					document.getElementById("id").style.backgroundColor="#e9f1ff";
					document.getElementById("id").style.transition="700ms"
				}
			}
			function loginname(){
				if($("#username").val() != ""){
					document.getElementById("username").style.borderBottom="solid 2px #489CFF";
					document.getElementById("username").style.backgroundColor="#e9f1ff";
					document.getElementById("username").style.transition="700ms"
				}
			}
			function loginemail(){
				if($("#email").val() != ""){
					document.getElementById("email").style.borderBottom="solid 2px #489CFF";
					document.getElementById("email").style.backgroundColor="#e9f1ff";
					document.getElementById("email").style.transition="700ms"
                }
            }
		</script>

	</head>
	<body class="is-preload" onload="document.searchfrm.userid.focus();"><img src="../../images/se.png" id="bg" alt="">
			<!-- onload="document.loginfrm.userid.focus()" -->
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
						<h2>Menu</h2>
						<ul>
							<li><a href="../../index.jsp">Home</a></li>
							<li><a href="../login.jsp">로그인</a></li>
							<li><a href="../../index.jsp#footer">문의하기</a></li>
							<li><a href="../servicecenter.html">공지사항</a></li>
						</ul>
					</nav>
				
				<!-- login -->
					<div id="login" class="login">
						<div class="inner">
							<div class="intro">
								<br><br><br>
								<h2 class="align-center">비밀번호 찾기</h2>
							</div>
							<section class="loginsec">
							<form action="/Sector/pwdsearch" method="post" class="searchfrm" id="searchfrm" name="searchfrm">
									<div id="loginforminput">
										<input type="text" id="id" name="id" required placeholder="가입된 아이디" onblur="userid();"> <br>
                                        <input type="text" id="username" name="username"  required placeholder="가입된 이름" onblur="loginname();"><br>
                                        <input type="email" id="email" name="email" required placeholder="가입된 이메일" onblur="loginemail();">
									</div>
									<br><br>
									<div id="btninfo">
											<button type="submit" class="btn">Search</button>
				
											<br><br>
									
                                            <a href="./searchId.jsp" id="info1">아이디 찾기</a>
                                            
											<a href="../login.jsp" id="info2">로그인</a>
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