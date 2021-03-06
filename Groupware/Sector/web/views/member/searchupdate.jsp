<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Master"%>
    <%-- <%
        String result = (String)request.getAttribute("result");
    %> --%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Password Change</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../../resources/css/search.css" />
		<script type="text/javascript" src="../../resources/js/jquery.min.js"></script>
		<noscript><link rel="stylesheet" href="../../resources/css/noscript.css"></noscript>

        <%
            String result = (String)session.getAttribute("result");
            session.removeAttribute("result");
        %>
        <script type="text/javascript">
        
        function validate() {
           
            if($("#userpwd").val() == "" || $("#userpwd2").val() == ""){
                alert("비밀번호를 입력해주세요.");
                $("#userpwd").val("");
                $("#userpwd2").val("");
                $("#userpwd").focus();
                return false;
            }
            
            alert("비밀번호가가 성공적으로 변경되었습니다! 로그인 해주세요.");
            
            return true;
        }
        var getPwd = RegExp(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,12}$/);
        function passCheck(){
					if(!getPwd.test($("#userpwd").val()) && $("#userpwd").val() != "") {
			      alert("비밀번호 형식에 맞게 작성해주세요. (소문자 6~12자 이내 및 숫자 포함)");
			      $("#userpwd").val("");
				  $("#userpwd").focus();				
				  return false;
					}
					if($("#userpwd").val() == ""){
					document.getElementById("userpwd").style.borderBottom="solid 1px #c9c9c9";
					document.getElementById("userpwd").style.backgroundColor="white";
					return false;
					}
					document.getElementById("userpwd").style.borderBottom="solid 2px #489CFF";
                    document.getElementById("userpwd").style.backgroundColor="#e9f1ff";
                }
        function passCheck2(){
					if($("#userpwd").val() != ($("#userpwd2").val()) && $("#userpwd2").val() != ""){ 
			      alert("비밀번호가 서로 일치하지 않습니다.");
			      $("#userpwd2").val("");
			      $("#userpwd2").focus();
				
				  return false;
					}
					if($("#userpwd2").val() == ""){
					document.getElementById("userpwd2").style.borderBottom="solid 1px #c9c9c9";
					document.getElementById("userpwd2").style.backgroundColor="white";
					
					return false;
					}
					document.getElementById("userpwd2").style.borderBottom="solid 2px #489CFF";
					document.getElementById("userpwd2").style.backgroundColor="#e9f1ff";
					
					
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
								<h2 class="align-center">비밀번호 변경</h2>
                            </div>
                            <br><br>
							<section class="loginsec">
							<form action="/Sector/searchupdate" method="post" class="searchfrm" id="searchfrm" name="searchfrm" onsubmit="validate();">
									<div id="loginforminput">
                                        <input type="text" id="userid" name="userid" value="<%= result %>" readonly> <br>
										<input type="password" id="userpwd" name="userpwd" required placeholder="변경할 비밀번호" onblur="passCheck();"> <br>
                                        <input type="password" id="userpwd2" name="userpwd2"  required placeholder="비밀번호 확인" onblur="passCheck2();"><br>
									</div>
                                    <br><br>
									<div id="btninfo">
											<button type="submit" class="btn">Change</button>									
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