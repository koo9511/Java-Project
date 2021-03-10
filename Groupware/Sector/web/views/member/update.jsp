<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Master"%>
    <%
    Master loginMaster = (Master)session.getAttribute("loginMaster");
%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>InfoUpdate</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../../resources/css/update.css" />
		<script type="text/javascript" src="../../resources/js/jquery.min.js"></script>
        <noscript><link rel="stylesheet" href="../../resources/css/noscript.css" /></noscript>
        <script type="text/javascript">
		 var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
		 var getPwd = RegExp(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,12}$/);
		 var fmt = RegExp(/^\d{6}[1234]\d{6}$/); //형식 설정
		//  var buf = new Array(13); //주민등록번호 배열
			function validate() {

                if($("#phone").val() == ""){
			        alert("전화번호를 입력해주세요.");
			        $("#phone").focus();
			        return false;
                  }
                
                if($("#userpwd").val() == "" || $("#userpwd2").val() == ""){
                    alert("비밀번호를 입력해주세요.");
                    $("#userpwd").val("");
                    $("#userpwd2").val("");
                    $("#userpwd").focus();
			        return false;
                  }
                
                  if($("#usercomname").val() == "" ){
                    alert("회사명을 입력해주세요.");
                    $("#usercomname").focus();
                    return false;
                  }

                  
                alert("정보가 성공적으로 변경되었습니다. 다시 로그인 해주세요.");
               
                $.ajax({
                    url : "/Sector/logout"
                });
                
                return true;
			  }
		
				function passCheck(){
					if ($("#userid").val()==($("#userpwd").val()) && $("#userpwd").val() != "") {
				  alert("아이디와 비밀번호를 갖게 만들 수 없습니다.");
				  $("#userpwd").val("");
				  $("#userpwd").focus();

				  return false;
				  
					}
					if(!getPwd.test($("#userpwd").val()) && $("#userpwd").val() != "") {
			      alert("비밀번호 형식에 맞게 작성해주세요. (소문자 6~12자 이내 및 숫자 포함)");
			      $("#userpwd").val("");
				  $("#userpwd").focus();

				  return false;
					}
					// if($("#userpwd").val() == ""){
					// document.getElementById("userpwd").style.borderBottom="solid 1px #c9c9c9";
					// document.getElementById("userpwd").style.backgroundColor="white";
					// return false;
					}
									
				

				function passCheck2(){
					if($("#userpwd").val() != ($("#userpwd2").val()) && $("#userpwd2").val() != ""){ 
			      alert("비밀번호가 서로 일치하지 않습니다.");
			      $("#userpwd2").val("");
                  $("#userpwd2").focus();
                  
				  return false;
					}
					// if($("#userpwd2").val() == ""){
					// document.getElementById("userpwd2").style.borderBottom="solid 1px #c9c9c9";
					// document.getElementById("userpwd2").style.backgroundColor="white";
					
					// return false;
					}
					
				


				function phoneCheck(){
					var getPhone= RegExp(/^010\d{4}\d{4}$/);
					var phone =  $("#phone").val();
					// alert(userid);

					  if(!getPhone.test($("#phone").val()) && $("#phone").val() != ""){
				        alert("전화번호 형식에 맞게 작성해주세요. (ex : 01012345678)");
				        $("#phone").val("");
				        $("#phone").focus();
						
						return false;
				      }
				
					//   if($("#phone").val() == ""){
					// document.getElementById("phone").style.borderBottom="solid 1px #c9c9c9";
					// document.getElementById("phone").style.backgroundColor="white";
					
					// return false;
					}
					
                
                function comnameCheck(){
                    var getComName= RegExp(/^[A-Z가-힣]{2,12}$/);
                    
                    if(!getComName.test($("#usercomname").val()) && $("#usercomname").val() != ""){
                        alert("입력 형식에 맞게 작성해주세요. (대문자 및 한글 2~12자 이내");
                        $("#usercomname").val("");
                        $("#usercomname").focus();
                        return false;
                    }
                    
                    }
                    
				</script>
	</head>
    <body class="is-preload">
        <img src="../../images/se.png" id="bg"/>
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
                            <nav>
                                <ul>
                                    <li><a href="#menu">Menu</a></li>
                                </ul>
                            </nav>
						</div>
                    </header>

         <% if(loginMaster.getMasterId().equals("admin")) { %>
                        <nav id="menu">
                            <br>
                            <ul>
                                <li id="loginmenu"><a href="views/member/DetailView.jsp"><%= loginMaster.getMasterName() %> 님</a></li>
                                <li><a href="../../index.jsp">Home</a></li>
                                <li><a href="./DetailView.jsp">관리자 정보</a></li>
                                <li><a href="../Admin/memberList.jsp">회원 관리</a></li>
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
                                 <li><a href="../../index.jsp">Home</a></li>
                                 <li><a href="./DetailView.jsp">내 정보</a></li>
                                 <li><a href="../../index.jsp#footer">문의하기</a></li>
                                 <li><a href="#">공지사항</a></li>
                                 <li><a href="/Sector/logout" id="logout" name="logout" onclick="logoutm();">로그아웃</a></li>
                             </ul>
                         </nav>
           
           <% } %>
                    <script type="text/javascript">
						function logoutm(){
							alert("로그아웃 되었습니다.");
						}
					</script>

                    <!-- Mypage -->
                    <br><br>
                    <form action="/Sector/update" method="post" class="inner views" onsubmit="validate();">
                        <br><br>
                            <table cellspacing="5" cellpadding="0" class="view">
                                 <tr>
                                     <th colspan="2" rowspan="2"><h2>정보 수정</h2></th>
                                 </tr>
                                 <tr>
                                    <th colspan="2"><br><br><br></th>
                                </tr>
                               
                                 <tr class="a">
                                     <th>이 름</th>
                                     <td class="a">
                                         <input type="text" name="username" id="username" value="<%=loginMaster.getMasterName()%>" readonly>
                                     </td>
                                 </tr>
                                 <tr class="a">
                                     <th>아이디</th>
                                     <td class="a">
                                         <input type="text" name="userid" id="userid" value="<%=loginMaster.getMasterId()%>" readonly>
                                     </td>
                                 </tr>
                                 <tr class="b">
                                     <th>변경할 비밀번호</th>
                                     <td>
                                         <input type="password" name="userpwd" id="userpwd" onblur="passCheck();" required>
                                     </td>
                                 </tr>
                                 <tr class="b">
                                     <th>비밀번호 확인</th>
                                     <td>
                                         <input type="password" name="userpwd2" id="userpwd2" onblur="passCheck2();" required>
                                     </td>
                                 </tr>
                                 <tr class="b">
                                     <th>전화번호</th>
                                     <td>
                                         <input type="text" name="phone" id="phone" value="<%= loginMaster.getMasterPhone() %>" onblur="phoneCheck();" required>
                                     </td>
                                 </tr>
                                 <tr class="a">
                                     <th>이메일</th>
                                     <td>
                                         <input type="email" name="email" id="email" value="<%= loginMaster.getMasterEmail() %>" readonly>
                                     </td>
                                 </tr>
                                 <tr class="b">
                                     <th>회사명</th>
                                     <td>
                                         <input type="text" name="usercomname" id="usercomname" value="<%= loginMaster.getMasterComName() %>" onblur="comnameCheck();" required>
                                     </td>
                                 </tr>
                                 <tr>
                                     <th colspan="2">
                                         <br>
                                        <button type="submit" class="btn">저장하기</button> &nbsp;&nbsp;
                                        <button type="reset"  onclick="javascript:history.back();" class="btn">취소하기</button>
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
								<li>&copy; 서울특별시 강남구 테헤란로 남도빌딩 2층 B Class</li><li>Disign by Koogunmo</li>
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
			
	</body>
</html>