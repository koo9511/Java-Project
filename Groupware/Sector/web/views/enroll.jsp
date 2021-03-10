<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Enroll</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../resources/css/enroll.css" />
		<script type="text/javascript" src="../resources/js/jquery.min.js"></script>
		<noscript><link rel="stylesheet" href="../resources/css/noscript.css" /></noscript>
		
		<script type="text/javascript">
		 var checkcnt = 0;
	
		 var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		 var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
		 var getPwd = RegExp(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,12}$/);
		 
	

		 var fmt = RegExp(/^\d{6}[1234]\d{6}$/); //형식 설정
		//  var buf = new Array(13); //주민등록번호 배열
			function validate() {
			 
			 
			      //아이디 공백 확인
			      if($("#userid").val() == ""){
			        alert("아이디를 입력하세요.");
			        $("#userid").focus();
			        return false;
			      }

			     //이메일 공백 확인
			      if($("#email").val() == ""){
			        alert("이메일을 입력해주세요.");
			        $("#email").focus();
			        return false;
				  }
				  
				  if($("#userpwd").val() == "" || $("#userpwd2").val() == ""){
                    alert("비밀번호를 입력해주세요.");
                    $("#userpwd").val("");
                    $("#userpwd2").val("");
                    $("#userpwd").focus();
			        return false;
				  }
				  
				  if($("#username").val() == ""){
			        alert("이름을 입력해주세요.");
			        $("#username").focus();
			        return false;
				  }

				  if($("#phone").val() == ""){
			        alert("전화번호를 입력해주세요.");
			        $("#phone").focus();
			        return false;
				  }
				  


				  

			    //   //주민번호
			    //   if(($("#usernumber1").val() == "") || ($("#usernumber2").val() == "")){
			    //     alert("주민등록번호를 입력해주세요.");
			    //     $("#usernumber1").focus();
			    //     return false;
			    //   }
			 
			    //   if(check_jumin() == false){
			    //     return false;
			    //   } 
			      
			  
				alert("회원이 되신걸 축하드립니다!");
				
				return true;
			    // return true;
			  }
			
			 
			  //주민번호 확인 함수
			//   function check_jumin() {
				
			//     var jumins3 = $("#usernumber1").val() + $("#usernumber2").val();
			//       //주민등록번호 생년월일 전달
			          
			//       var fmt = RegExp(/^\d{6}[1234]\d{6}$/)  //포멧 설정
			//       var buf = new Array(13);
			 
			//       //주민번호 유효성 검사
			//       if (!fmt.test(jumins3)) {
			//         alert("주민등록번호 형식에 맞게 입력해주세요.");
			//         $("#usernumber1").focus();
			//         return false;
			//       }
			 
			//       //주민번호 존재 검사
			//       for (var i = 0; i < buf.length; i++){
			//         buf[i] = parseInt(jumins3.charAt(i));
			//       }
			 
			//       var multipliers = [2,3,4,5,6,7,8,9,2,3,4,5];// 밑에 더해주는 12자리 숫자들 
			//       var sum = 0;
			 
			//       for (var i = 0; i < 12; i++){
			//       sum += (buf[i] *= multipliers[i]);// 배열끼리12번 돌면서 
			//     }
			 
			//     if ((11 - (sum % 11)) % 10 != buf[12]) {
			//       alert("잘못된 주민등록번호 입니다.");
			//       $("#usernumber1").focus();
			//       return false;
			//     }
    
			//   } 
			  
			  
			//   function juminCheck(){
			// 	document.getElementById("usernumber1").style.borderBottom="solid 1px #c9c9c9";
			// 	document.getElementById("usernumber2").style.borderBottom="solid 1px #c9c9c9";
			// 	var jumins3 = $("#usernumber1").val() + $("#usernumber2").val();
			//       //주민등록번호 생년월일 전달
			          
			//       var fmt = RegExp(/^\d{6}[1234]\d{6}$/)  //포멧 설정
			//       var buf = new Array(13);
			 
			//       //주민번호 유효성 검사
			//       if (!fmt.test(jumins3)) {
			//         alert("주민등록번호 형식에 맞게 입력해주세요.");
			//         $("#usernumber1").focus();
			//         return false;
			//       }
			 
			//       //주민번호 존재 검사
			//       for (var i = 0; i < buf.length; i++){
			//         buf[i] = parseInt(jumins3.charAt(i));
			//       }
			 
			//       var multipliers = [2,3,4,5,6,7,8,9,2,3,4,5];// 밑에 더해주는 12자리 숫자들 
			//       var sum = 0;
			 
			//       for (var i = 0; i < 12; i++){
			//       sum += (buf[i] *= multipliers[i]);// 배열끼리12번 돌면서 
			//     }
			 
			//     if ((11 - (sum % 11)) % 10 != buf[12] && $("#usernumber1").val() != "" && $("#usernumber2").val() != "") {
			//       alert("잘못된 주민등록번호 입니다.");
			// 	  $("#usernumber1").focus();
			// 	  $("#usernumber2").val("");
			// 	  return false;
			// 	}
			// 	  var userno =  $("#usernumber1").val() + "-" + $("#usernumber2").val();
			// 	    $.ajax({
			//             async: false,
			//             type : 'POST',
			//             data : {userno: userno},
			//             url : "/Sector/jumincheck",
			//             // dataType : "json", 
			//             // contentType: "application/json; charset=UTF-8",
			//             success : function(data) {
			//                 if (data > 0) {
			//                     alert("이미 가입된 주민등록번호 입니다.");
			//                     $("#usernumber1").focus();
			//                     $("#usernumber2").val("");
			// 					return false;
			//                 }
			// 				else{
								
			// 				}
			//             },
			//             error : function(error) {
			//                 alert("error : " + error);
			//             }
			// 		});
			// 		document.getElementById("usernumber1").style.borderBottom="solid 2px #489CFF";
			// 		document.getElementById("usernumber2").style.borderBottom="solid 2px #489CFF";
			  
			// }	
			  
			  function emailCheck(){
				// document.getElementById("email").style.borderBottom="solid 1px #c9c9c9";
				  var email = $("#email").val();
				  $.ajax({
			            async: false,
			            type : 'POST',
			            data : {email: email},
			            url : "/Sector/emailcheck",
			            // dataType : "json", 
			            // contentType: "application/json; charset=UTF-8",
			            success : function(data) {
			                if (data > 0) {
			                    alert("이미 가입된 이메일주소 입니다.");
			                    $("#email").focus();
			                    $("#email").val("");
								// document.getElementById("email").style.borderBottom="solid 1px #c9c9c9";
								// document.getElementById("email").style.backgroundColor="white";
								// document.getElementById("email").style.transition="700ms"
								return false;
			                }
							else{
								
							}
			            },
			            error : function(error) {
			                alert("error : " + error);
			            }
					});
					if(!getMail.test($("#email").val()) && $("#email").val() != ""){
			        alert("이메일 형식에 맞게 입력해주세요. (ex : id@gmail.com)")
			        $("#email").val("");
					$("#email").focus();
					// document.getElementById("email").style.borderBottom="solid 1px #c9c9c9";
					// document.getElementById("email").style.backgroundColor="white";
					// document.getElementById("email").style.transition="700ms"
					return false;
					}

					if($("#email").val() == ""){
					document.getElementById("email").style.borderBottom="solid 1px #c9c9c9";
					document.getElementById("email").style.backgroundColor="white";
					// document.getElementById("email").style.transition="700ms"
					return false;
					}
					document.getElementById("email").style.borderBottom="solid 2px #489CFF";
					document.getElementById("email").style.backgroundColor="#e9f1ff";
					// document.getElementById("email").style.transition="700ms"
					
			  }

			  

			  function idcheck(){
				var userid =  $("#userid").val();

				

				// if($("#userid").val() == ""){
				// 		alert("아이디를 입력하세요.");
				//         $("#userid").document.getElementById("userid").style.borderBottom="solid 1px #c9c9c9";
				// 	  }
				// else{
			        $.ajax({
			            async: false,
			            type : 'POST',
			            data : {userid: userid},
			            url : "/Sector/logincheck",
			            // dataType : "json", 
			            // contentType: "application/json; charset=UTF-8",
			            success : function(data) {
			                if (data > 0) {
			                    alert("이미 사용중인 아이디입니다.");
								$("#userid").val("");
			                    $("#userid").focus();
								document.getElementById("userid").style.backgroundColor="white";
								document.getElementById("userid").style.borderBottom="solid 1px #c9c9c9";
								// document.getElementById("userid").style.transition="700ms"
								// checkcnt == 0;
								// return false;
			                } else if(data <= 0 && $("#userid").val() != ""){
			                    
			                    // alert("사용 가능한 아이디입니다.");
			                    // $("#userpwd").focus();
								document.getElementById("userid").style.borderBottom="solid 2px #489CFF";
								document.getElementById("userid").style.backgroundColor="#e9f1ff";
								// document.getElementById("userid").style.transition="700ms"
								// checkcnt == 1;
								// return true;
			                }
			            },
			            error : function(error) {
			                alert("error : " + error);
			            }
					});
				
				
			}

				function passCheck(){
					if ($("#userid").val()==($("#userpwd").val()) && $("#userpwd").val() != "") {
				  alert("아이디와 비밀번호를 갖게 만들 수 없습니다.");
				  $("#userpwd").val("");
				  $("#userpwd").focus();
				//   document.getElementById("userpwd").style.borderBottom="solid 1px #c9c9c9";
				//   document.getElementById("userpwd").style.transition="700ms"
				  return false;
				  
					}
					if(!getPwd.test($("#userpwd").val()) && $("#userpwd").val() != "") {
			      alert("비밀번호 형식에 맞게 작성해주세요. (소문자 6~12자 이내 및 숫자 포함)");
			      $("#userpwd").val("");
				  $("#userpwd").focus();
				//   document.getElementById("userpwd").style.borderBottom="solid 1px #c9c9c9";
				//   document.getElementById("userpwd").style.backgroundColor="white";
				//   document.getElementById("userpwd").style.transition="700ms"
				  return false;
					}
					if($("#userpwd").val() == ""){
					document.getElementById("userpwd").style.borderBottom="solid 1px #c9c9c9";
					document.getElementById("userpwd").style.backgroundColor="white";
					// document.getElementById("userpwd").style.transition="700ms"
					return false;
					}
					document.getElementById("userpwd").style.borderBottom="solid 2px #489CFF";
					document.getElementById("userpwd").style.backgroundColor="#e9f1ff";
					// document.getElementById("userpwd").style.transition="700ms"
					
				}

				function passCheck2(){
					if($("#userpwd").val() != ($("#userpwd2").val()) && $("#userpwd2").val() != ""){ 
			      alert("비밀번호가 서로 일치하지 않습니다.");
			      $("#userpwd2").val("");
			      $("#userpwd2").focus();
				//   document.getElementById("userpwd2").style.borderBottom="solid 1px #c9c9c9";
				//   document.getElementById("userpwd2").style.backgroundColor="white";
				//   document.getElementById("userpwd2").style.transition="700ms"
				  return false;
					}
					if($("#userpwd2").val() == ""){
					document.getElementById("userpwd2").style.borderBottom="solid 1px #c9c9c9";
					document.getElementById("userpwd2").style.backgroundColor="white";
					// document.getElementById("userpwd2").style.transition="700ms"
					return false;
					}
					document.getElementById("userpwd2").style.borderBottom="solid 2px #489CFF";
					document.getElementById("userpwd2").style.backgroundColor="#e9f1ff";
					// document.getElementById("userpwd2").style.transition="700ms"
					
				}

				function nameCheck(){

					var getName= RegExp(/^[가-힣]{2,}$/);
					if (!getName.test($("#username").val()) && $("#username").val() != "") {
						alert("이름을 올바르게 입력해주세요.");
						$("#username").val("");
						$("#username").focus();
						// document.getElementById("username").style.borderBottom="solid 1px #c9c9c9";
						// document.getElementById("username").style.backgroundColor="white";
						// document.getElementById("username").style.transition="700ms"
						return false;
					}
					if($("#username").val() == ""){
					document.getElementById("username").style.borderBottom="solid 1px #c9c9c9";
					document.getElementById("username").style.backgroundColor="white";
					// document.getElementById("username").style.transition="700ms"
					return false;
					}
					document.getElementById("username").style.borderBottom="solid 2px #489CFF";
					document.getElementById("username").style.backgroundColor="#e9f1ff";
					// document.getElementById("username").style.transition="700ms"
					
				}

				function idCheck2(){
					var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
					var userid =  $("#userid").val();
					// alert(userid);
					
						
					  if(!getCheck.test($("#userid").val()) && $("#userid").val() != ""){
				        alert("아이디 형식에 맞게 작성해주세요. (숫자 및 소문자 4~12자 이내)");
				        $("#userid").val("");
				        $("#userid").focus();
						// document.getElementById("userid").style.borderBottom="solid 1px #c9c9c9";
						// document.getElementById("userid").style.backgroundColor="white";
						// document.getElementById("userid").style.transition="700ms"
						return false;
				      }
					  if($("#userid").val() == ""){
					document.getElementById("userid").style.borderBottom="solid 1px #c9c9c9";
					document.getElementById("userid").style.backgroundColor="white";
					// document.getElementById("userid").style.transition="700ms"
					return false;
					  }

					  idcheck();

					//  if(idcheck() == false){

					// document.getElementById("userid").style.borderBottom="solid 1px #c9c9c9";
					// document.getElementById("userid").style.backgroundColor="white";
					//  }else{
					// 	document.getElementById("userid").style.borderBottom="solid 2px #489CFF";
					// 	document.getElementById("userid").style.backgroundColor="#e9f1ff";
					//  }
				
					
					}
					// if(idcheckcount == 1){
				
					
					
					
					

				

				function phoneCheck(){
					var getPhone= RegExp(/^010\d{4}\d{4}$/);
					var phone =  $("#phone").val();
					// alert(userid);

					  if(!getPhone.test($("#phone").val()) && $("#phone").val() != ""){
				        alert("전화번호 형식에 맞게 작성해주세요. (ex : 01012345678)");
				        $("#phone").val("");
				        $("#phone").focus();
						// document.getElementById("phone").style.borderBottom="solid 1px #c9c9c9";
						// document.getElementById("phone").style.backgroundColor="white";
						// document.getElementById("phone").style.transition="700ms"
						return false;
				      }
				
					  if($("#phone").val() == ""){
					document.getElementById("phone").style.borderBottom="solid 1px #c9c9c9";
					document.getElementById("phone").style.backgroundColor="white";
					// document.getElementById("phone").style.transition="700ms"
					return false;
					}
					document.getElementById("phone").style.borderBottom="solid 2px #489CFF";
					document.getElementById("phone").style.backgroundColor="#e9f1ff";
					// document.getElementById("phone").style.transition="700ms"
				}
				
			  
		</script>
		<!-- 중복체크 검사 -->
		
	</head>
	<body class="is-preload">
			
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

			<!-- Enroll -->
			<img src="../images/se.png" id="bg" alt="">
	<div class="innner enroll">
		<br>
		<h2 class="align-center">회원 되기</h2>
		
			<form action="/Sector/insert" method="post" class="enrollform" onsubmit="return validate();"> 
				<div class="en">
					
					<div class="enroll_input">
							<input type="text" name="username" id="username" required placeholder="이름" onblur="nameCheck();"><br>
						<!-- <div class="number">
							<input type="text" class="usernumber" id="usernumber1" name="usernumber1" maxlength="6" required placeholder="주민번호 앞">-
							<input type="password" class="usernumber" id="usernumber2" name="usernumber2" onblur="juminCheck();" maxlength="7" required placeholder="주민번호 뒤"><br><br>
						</div> -->
							<input type="text" name="userid" id="userid" required placeholder="아이디 (4~12자 이내)" onblur="idCheck2();"> <br>
								<!-- <button id="check" type="button" onclick="idcheck();">중복체크</button><br> -->
							<input type="password" class="userpwd" id="userpwd" name="userpwd" required placeholder="비밀번호 (6~12자 이내, 숫자 포함)" onblur="passCheck();"><br>
							<input type="password" class="userpwd" id="userpwd2" required placeholder="비밀번호 확인" onblur="passCheck2();"><br>
							<input type="text" name="phone" id="phone" required placeholder="전화번호 (' - ' 제외)" onblur="phoneCheck();"><br>
							<input type="email" name="email" id="email" name="email" required placeholder="이메일" onblur="emailCheck();"><br>
							
					</div>
					<div class="result">
							<button type="submit">가입하기</button> &nbsp;&nbsp;	
							<button type="reset">취소하기</button> <br><br>
						
					</div>
					<br>
					
					<div class="helf">
						이미 회원이신가요? &nbsp; <a href="./login.jsp">로그인</a>	
					</div>
					<br>
				</div>
				
			</form>
		
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
			<!-- <script type="text/javascript">
			$(function(){
				$('div.enroll_input').focus();
			});
			</script> -->
			<!-- <script type="text/javascript">
				$(functino('button#reset').on(){
					history.go(-1);
				});
			</script> -->
	</body>
</html>