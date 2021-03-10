<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		 <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<title>다님: 회원가입</title>

		<!-- Google font -->
		<link href="https://fonts.googleapis.com/css?family=Lato:700%7CMontserrat:400,600" rel="stylesheet">

		<!-- Bootstrap -->
		<link type="text/css" rel="stylesheet" href="/danim/resources/css/bootstrap.min.css"/>

		<!-- Font Awesome Icon -->
		<link rel="stylesheet" href="/danim/resources/css/font-awesome.min.css">

		<!-- Custom stlylesheet -->
		<link type="text/css" rel="stylesheet" href="/danim/resources/css/style.css"/>
		
		<link rel="stylesheet" type="text/css" href="https://unpkg.com/magic-input/dist/magic-input.min.css">

		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
		
		<head>
			<title>Enroll</title>
			<meta charset="utf-8" />
			<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
			<link rel="stylesheet" href="../resources/css/enroll.css" />
			<link rel="stylesheet" href="/Sector/resources/css/searchform.css" />
			<link id="dark-mode-sheet"
					rel="stylesheet"
					href="../resources/css/darkmode.css"
					media="(prefers-color-scheme: dark)">
			<script src="https://cdnjs.cloudflare.com/ajax/libs/js-cookie/2.2.1/js.cookie.js"></script>
			<script src="../resources/js/darkmode.js"></script>
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
					  if(!$("#userid").val()){
						alert("아이디로 사용할 이메일을 입력해주세요.");
						$("#userid").focus();
						return false;
					  }
					  if($("#userid").prop("readonly") != true){
						alert("이메일 인증을 해주세요.");
						return false;
					}
					  if($('#nickname').val() == ""){
						  alert("닉네임을 입력해주세요.");
						  $("#nickname").focus();
						  return false;
					  }
					  if($("#username").val() == ""){
						alert("이름을 입력해주세요.");
						$("#username").focus();
						return false;
					  }
					  if(($("#usernumber").val() == "")){
					    alert("생년월일을 입력해주세요.");
					    $("#usernumber").focus();
					    return false;
					  }
					  if($("#userpwd").val() == "" || $("#userpwd2").val() == ""){
						alert("비밀번호를 입력해주세요.");
						$("#userpwd").val("");
						$("#userpwd2").val("");
						$("#userpwd").focus();
						return false;
					  }
					  if($("#phone").val() == ""){
						alert("전화번호를 입력해주세요.");
						$("#phone").focus();
						return false;
					  }

					if($("#agree").prop("checked") != true){
						alert("이용 약관에 동의해주세요.");
						return false;
					} 
				  
					alert("회원이 되신걸 축하드립니다!");
					
					return true;
				  }
				  
	
				  
	
				  
	
					function passCheck(){
						if ($("#userid").val()==($("#userpwd").val()) && $("#userpwd").val() != "") {
					  alert("아이디와 비밀번호를 갖게 만들 수 없습니다.");
					  $("#userpwd").val("");
					  $("#userpwd").focus();
					  document.getElementById("userpwd").style.border="1px solid #ebebeb";
							document.getElementById("userpwd").style.backgroundColor="white";
					  return false;
					  
						}
						if(!getPwd.test($("#userpwd").val()) && $("#userpwd").val() != "") {
					  alert("비밀번호 형식에 맞게 작성해주세요. (소문자 6~12자 이내 및 숫자 포함)");
					  $("#userpwd").val("");
					  $("#userpwd").focus();
					  document.getElementById("userpwd").style.border="1px solid #ebebeb";
							document.getElementById("userpwd").style.backgroundColor="white";
					  return false;
						}
						else {
							document.getElementById("userpwd").style.border="3px solid #fcc159";
							document.getElementById("userpwd").style.backgroundColor="#ebebeb";
						}
						if($("#userpwd").val() == ""){
							document.getElementById("userpwd").style.border="1px solid #ebebeb";
							document.getElementById("userpwd").style.backgroundColor="white";
						return false;
						}
						
					}
	
					function passCheck2(){
						if($("#userpwd").val() != ($("#userpwd2").val()) && $("#userpwd2").val() != ""){ 
					  alert("비밀번호가 서로 일치하지 않습니다.");
					  $("#userpwd2").val("");
					  $("#userpwd2").focus();
					  return false;
						}
						else {
							document.getElementById("userpwd2").style.border="3px solid #fcc159";
							document.getElementById("userpwd2").style.backgroundColor="#ebebeb";
						}
						if($("#userpwd2").val() == ""){
							document.getElementById("userpwd2").style.border="1px solid #ebebeb";
							document.getElementById("userpwd2").style.backgroundColor="white";
						return false;
						}
						
					}

					function nicknameCheck(){
	
						var getNickName= RegExp(/^[가-힣]{2,}$/);
						if (!getNickName.test($("#nickname").val()) && $("#nickname").val() != "") {
							alert("별명을 올바르게 입력해주세요. (한글만 가능)");
							$("#nickname").val("");
							$("#nickname").focus();
							return false;
						} else {
							document.getElementById("nickname").style.border="3px solid #fcc159";
							document.getElementById("nickname").style.backgroundColor="#ebebeb";
						}

						if($("#nickname").val() == ""){
							document.getElementById("nickname").style.border="1px solid #ebebeb";
							document.getElementById("nickname").style.backgroundColor="white";
						return false;
						}
					
					}
	
					function nameCheck(){
	
						var getName= RegExp(/^[가-힣]{2,}$/);
						if (!getName.test($("#username").val()) && $("#username").val() != "") {
							alert("이름을 올바르게 입력해주세요.");
							$("#username").val("");
							$("#username").focus();
							return false;
						}
						else {
							document.getElementById("username").style.border="3px solid #fcc159";
							document.getElementById("username").style.backgroundColor="#ebebeb";
						}
						if($("#username").val() == ""){
							document.getElementById("username").style.border="1px solid #ebebeb";
							document.getElementById("username").style.backgroundColor="white";
						return false;
						}
						
					}

					function usernumCheck(){
						var birth = RegExp(/^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/);
						if(!birth.test($("#usernumber").val()) && $("#usernumber").val() != "") {
							alert("생년월일을 정확히 입력하세요. ex) 19951111");
							$("#usernumber").val("");
							$("#usernumber").focus();
							return false;
						}
						else {
							document.getElementById("usernumber").style.border="3px solid #fcc159";
							document.getElementById("usernumber").style.backgroundColor="#ebebeb";
						}
						if($("#usernumber").val() == ""){
							document.getElementById("usernumber").style.border="1px solid #ebebeb";
							document.getElementById("usernumber").style.backgroundColor="white";
						return false;
						}
					}
	
					
						

	
					function phoneCheck(){
						var getPhone= RegExp(/^010\d{4}\d{4}$/);
						var phone =  $("#phone").val();
						
	
						  if(!getPhone.test($("#phone").val()) && $("#phone").val() != ""){
							alert("전화번호 형식에 맞게 작성해주세요. ex) 01025653871");
							$("#phone").val("");
							$("#phone").focus();
							return false;
						  }
						  else {
							document.getElementById("phone").style.border="3px solid #fcc159";
							document.getElementById("phone").style.backgroundColor="#ebebeb";
						  }
						  if($("#phone").val() == ""){
							document.getElementById("phone").style.border="1px solid #ebebeb";
							document.getElementById("phone").style.backgroundColor="white";
						return false;
						}
					}
				
				  
			</script>
			<!-- 중복체크 검사 -->
			
		</head>
	
		
    </head>
	<body>
		<!-- Header -->
		<header id="header">
			<div class="container">

				<div class="navbar-header">
					<!-- Logo -->
					<div class="navbar-brand">
						<a class="logo" href="index.do">
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

				<!-- Navigation -->
				<nav id="nav">
					<ul class="main-menu nav navbar-nav navbar-right">
						<li><a href="index.do">메인으로</a></li>
						<li><a href="loginForm.do">로그인</a></li>
						<li><a href="enrollForm.do">회원가입</a></li>
						<li><a href="contactForm.do">문의하기</a></li>
						<li><a href="noticeForm.do?page=1">공지사항</a></li>
					</ul>
				</nav>
				<!-- /Navigation -->

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
						<h1 class="white-text">회원가입</h1>

					</div>
				</div>
			</div>

		</div>
		<!-- /Hero-area -->

		<!-- Contact -->
		<div id="contact" class="section" >

			<!-- container -->
			<div class="container">

				<!-- row -->
				<div class="row">

					<!-- enroll form -->
					<br><br>
					<form action="userInsert.do" method="post" onsubmit="return validate();">
					<div class="col-md-6">
							<div class="contact-form">
								<h4>개인정보</h4>
								<input class="input" type="email" name="userid" id="userid" placeholder="아이디로 사용할 이메일"style="width: 70%;">
								<button type="button" class="main-button icon-button pull-right emailchkbtn" >인증 메일 발송</button>
								<input class="input" type="text" name="emailcheck" id="emailchkinput" placeholder="인증 번호" style="width: 75%;" hidden>
								<button type="button" class="main-button icon-button pull-right complete hidden">인증 완료</button>
								<input class="input" type="text" name="nickname" id="nickname" placeholder="별명" onblur="nicknameCheck();">
								<input class="input" type="text" name="username"id="username" placeholder="이름" onblur="nameCheck();">
								<input class="input" type="text" name="usernum" id="usernumber" placeholder="생년월일 (ex : 19951111)" maxlength="8" onblur="usernumCheck();" style="width: 85%;"> &nbsp;
								<!-- <input type="radio" value="M"> 남 &nbsp; <input type="radio" value="F"> 여 -->
								<input class="input" type="password" name="userpwd" id="userpwd" placeholder="비밀번호" onblur="passCheck();">
								<input class="input" type="password" name="userpwd2" id="userpwd2" placeholder="비밀번호 확인" onblur="passCheck2();">
								<input class="input" type="text" name="phone" id="phone" placeholder="전화번호 ('-' 생략)" onblur="phoneCheck();">
								<!-- <select name="accountname" id="accountname">
									<option value="우리">우리은행</option>
									<option value="기업">IBK기업은행</option>
									<option value="하나">KEB하나은행</option>
									<option value="국민">국민은행</option>
									<option value="신한">신한은행</option>
									<option value="농협">농협은행</option>
									<option value="신협">신협</option>
								</select>
								<input class="input acname" type="text" name="account" id="account" placeholder="계좌번호 ('-' 생략)" style="width: 79%;"> <br> -->
								<br>
								<h4>활동 지역</h4>	
								<input class="mgc mgc-warning chk" type="checkbox" name="ground" id="seoul" value="서울"><span class="val"> 서울 </span>&nbsp;
								<input class="mgc mgc-warning chk" type="checkbox" name="ground" id="gyunggi" value="경기"><span class="val"> 경기 </span>&nbsp;
								<input class="mgc mgc-warning chk" type="checkbox" name="ground" id="gangwon" value="강원"><span class="val"> 강원 </span>&nbsp;
								<input class="mgc mgc-warning chk" type="checkbox" name="ground" id="choongbook" value="충북"><span class="val"> 충북 </span>&nbsp;
								<input class="mgc mgc-warning chk" type="checkbox" name="ground" id="choongnam" value="충남"><span class="val"> 충남 </span>&nbsp;
								<br>
								<input class="mgc mgc-warning chk" type="checkbox" name="ground" id="jeonbook" value="전북"><span class="val"> 전북 </span>&nbsp;
								<input class="mgc mgc-warning chk" type="checkbox" name="ground" id="jeonnam" value="전남"><span class="val"> 전남 </span>&nbsp;
								<input class="mgc mgc-warning chk" type="checkbox" name="ground" id="gyungbook" value="경북"><span class="val"> 경북 </span>&nbsp;
								<input class="mgc mgc-warning chk" type="checkbox" name="ground" id="gyungnam" value="경남"><span class="val"> 경남 </span>&nbsp;
								<input class="mgc mgc-warning chk" type="checkbox" name="ground" id="jeju" value="제주"><span class="val"> 제주 </span>
							</div>
						</div>
					<!-- /enroll form -->
					<script type="text/javascript">
					$(function(){
						$('.emailchkbtn').click(function(){

							var userid = $('#userid').val();
							$.ajax({
								type : 'POST',
								data : { email : userid },
								url : "emailSMTP.do",

								success : function(data){
									console.log(data);
									switch(data){
									case "100": alert("인증 메일이 전송되었습니다."); 
										$('#emailchkinput').attr('hidden',false).focus();
										$('.complete').removeClass("hidden");
										$('.emailchkbtn').addClass("hidden");
										$('#userid').attr("disabled",true);
										document.getElementById('userid').style.width="100%";
										
										break;
									case "200": alert("이미 사용중인 이메일입니다."); $('#userid').focus(); break;
									case "900": alert("잘못된 이메일 주소 입니다."); $('#userid').focus(); break;
									}
								},
								error : function(error){
									console.log(error); 
								}
							});
							
							});
						});

						/* 인증완료 처리하기 */

						$(function(){
							$('.complete').click(function(){
								var key = $('#emailchkinput').val();
								$.ajax ({
									type: 'POST',
									data: { key : key },
									url: "keyCheck.do",

									success : function(data){
										switch(data){
											case "100": alert("인증에 성공하였습니다!");
												$('#emailchkinput').attr('hidden',true);
												$('.complete').addClass('hidden');
												$('#nickname').focus();
												document.getElementById("userid").style.border="3px solid #fcc159";
												document.getElementById("userid").style.backgroundColor="#ebebeb";
												$('#userid').attr("disabled",false);
												$('#userid').attr("readonly",true);
											// 성공했을 때, 기존 DB 안에 있는 key 삭제
												$.ajax({
													type: 'POST',
													data: {key : key},
													url: "keyDelete.do"
												});
												$('.enrollbutton').removeClass('hidden');
												break;
											case "200": alert("잘못된 인증번호 입니다.");
												$('#emailchkinput').val("").focus();
												document.getElementById("userid").style.border="1px solid #ebebeb";
												document.getElementById("userid").style.backgroundColor="white";
												break;
											case "900": alert("알 수 없는 에러 발생");
												$('#emailchkinput').val("").focus();
												document.getElementById("userid").style.border="1px solid #ebebeb";
												document.getElementById("userid").style.backgroundColor="white";
												break;
										}
									}
								});
							});
						});

					</script>

					<!-- simple sign up -->
					<div class="col-md-5 col-md-offset-1">
							<div class="contact-form" >
								<h4>'다님' 이용약관 동의</h4>
								<textarea class="input policy" name="policy1" style="height: 106px;" >
다양한 다님 서비스를 즐겨보세요.
다님은 www.danim.com을 비롯한 다님 도메인의 웹사이트 및 응용프로그램(어플리케이션, 앱)을 통해 정보 검색, 다른 이용자와의 커뮤니케이션, 콘텐츠 제공, 상품 쇼핑 등 여러분의 생활에 편리함을 더할 수 있는 다양한 서비스를 제공하고 있습니다.
여러분은 PC, 휴대폰 등 인터넷 이용이 가능한 각종 단말기를 통해 각양각색의 다님 서비스를 자유롭게 이용하실 수 있으며, 개별 서비스들의 구체적인 내용은 각 서비스 상의 안내, 공지사항, 다님 웹고객센터(이하 ‘고객센터’) 도움말 등에서 쉽게 확인하실 수 있습니다.

다님은 기본적으로 여러분 모두에게 동일한 내용의 서비스를 제공합니다. 다만, '청소년보호법' 등 관련 법령이나 기타 개별 서비스 제공에서의 특별한 필요에 의해서 연령 또는 일정한 등급을 기준으로 이용자를 구분하여 제공하는 서비스의 내용, 이용 시간, 이용 횟수 등을 다르게 하는 등 일부 이용을 제한하는 경우가 있습니다. 자세한 내용은 역시 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서 확인하실 수 있습니다.

다님 서비스에는 기본적으로 본 약관이 적용됩니다만 다님가 다양한 서비스를 제공하는 과정에서 부득이 본 약관 외 별도의 약관, 운영정책 등을 적용하는 경우(예, 다님페이, V LIVE 등)가 있습니다. 그리고 다님 계열사가 제공하는 특정 서비스의 경우에도(예, LINE, SNOW등) 해당 운영 회사가 정한 고유의 약관, 운영정책 등이 적용될 수 있습니다. 이러한 내용은 각각의 해당 서비스 초기 화면에서 확인해 주시기 바랍니다.

회원으로 가입하시면 다님 서비스를 보다 편리하게 이용할 수 있습니다.
여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수 있으며, 다님은 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께 다님 서비스 이용 계정(이하 ‘계정’)을 부여합니다. 계정이란 회원이 다님 서비스에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로 관리하기 위해 설정한 회원 식별 단위를 말합니다. 회원은 자신의 계정을 통해 좀더 다양한 다님 서비스를 보다 편리하게 이용할 수 있습니다. 이와 관련한 상세한 내용은 계정 운영정책 및 고객센터 내 다님 회원가입 방법 등에서 확인해 주세요.

다님은 단체에 속한 여러 구성원들이 공동의 계정으로 다님 서비스를 함께 이용할 수 있도록 단체회원 계정도 부여하고 있습니다. 단체회원 구성원들은 하나의 계정 및 아이디(ID)를 공유하되 각자 개별적으로 설정한 비밀번호를 입력하여 계정에 로그인하고 각종 서비스를 이용하게 됩니다. 단체회원은 관리자와 멤버로 구성되며, 관리자는 구성원 전부로부터 권한을 위임 받아 단체회원을 대표하고 단체회원 계정을 운용합니다.
따라서 관리자는 단체회원 계정을 통해 별도 약관 또는 기존 약관 개정에 대해 동의하거나 단체회원에서 탈퇴할 수 있고, 멤버들의 단체회원 계정 로그인 방법 및 이를 통한 게시물 게재 등 다님 서비스 이용을 관리(게시물 삭제 포함)할 수 있습니다. 본 약관에서 규정한 사항은 원칙적으로 구성원 모두에게 적용되며, 각각의 구성원은 다른 구성원들의 단체회원 계정 및 아이디(ID)를 통한 서비스 이용에 관해 연대책임을 부담합니다.
										
								</textarea>
								<h4>개인정보 수집 및 이용에 대한 안내</h4>
								<textarea class="input policy" name="policy2" style="height: 106px;">
1. 개인정보의 처리 목적 (‘www.danim.com’이하 ‘Danim’) 은(는) 다음의 목적을 위하여 개인정보를 처리하고 있으며, 다음의 목적 이외의 용도로는 이용하지 않습니다.
- 고객 가입의사 확인, 고객에 대한 서비스 제공에 따른 본인 식별.인증, 회원자격 유지.관리, 물품 또는 서비스 공급에 따른 금액 결제, 물품 또는 서비스의 공급.배송 등
2. 개인정보의 처리 및 보유 기간
① (‘www.danim.com’이하 ‘Danim’) 은(는) 정보주체로부터 개인정보를 수집할 때 동의 받은 개인정보 보유․이용기간 또는 법령에 따른 개인정보 보유․이용기간 내에서 개인정보를 처리․보유합니다.
② 구체적인 개인정보 처리 및 보유 기간은 다음과 같습니다.
☞ 아래 예시를 참고하여 개인정보 처리업무와 개인정보 처리업무에 대한 보유기간 및 관련 법령, 근거 등을 기재합니다.
(예시)- 고객 가입 및 관리 : 서비스 이용계약 또는 회원가입 해지시까지, 다만 채권․채무관계 잔존시에는 해당 채권․채무관계 정산시까지
- 전자상거래에서의 계약․청약철회, 대금결제, 재화 등 공급기록 : 5년 
3. 개인정보의 제3자 제공에 관한 사항
① ('www.danim.com'이하 'Danim')은(는) 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.
② ('www.danim.com')은(는) 다음과 같이 개인정보를 제3자에게 제공하고 있습니다.
1. <>
- 개인정보를 제공받는 자 : 
- 제공받는 자의 개인정보 이용목적 : 
- 제공받는 자의 보유.이용기간:
4. 개인정보처리 위탁
① ('Danim')은(는) 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.
1. <>
- 위탁받는 자 (수탁자) : 
- 위탁하는 업무의 내용 : 
- 위탁기간 :
② ('www.danim.com'이하 'Danim')은(는) 위탁계약 체결시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.
③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.
5. 정보주체와 법정대리인의 권리·의무 및 그 행사방법 이용자는 개인정보주체로써 다음과 같은 권리를 행사할 수 있습니다.
① 정보주체는 Danim 그룹웨어(‘www.danim.com’이하 ‘Danim) 에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.
1. 개인정보 열람요구
2. 오류 등이 있을 경우 정정 요구
3. 삭제요구
4. 처리정지 요구
6. 처리하는 개인정보의 항목 작성 
① ('www.danim.com'이하 'Danim')은(는) 다음의 개인정보 항목을 처리하고 있습니다.
1<회원 관리 및 서비스 제공>
▶ 개인정보 보호책임자 
성명 :구건모
직책 :대표
직급 :대표
연락처 :01025653871, gunmo9511@gmail.com, 
※ 개인정보 보호 담당부서로 연결됩니다.
▶ 개인정보 보호 담당부서
								
								
							</textarea>
								<h4>위치정보 이용약관 동의</h4>
								<textarea class="input policy" name="policy3" style="height: 107px;">
위치정보 이용약관에 동의하시면, 위치를 활용한 광고 정보 수신 등을 포함하는 다님 위치기반 서비스를 이용할 수 있습니다.
제 1 조 (목적)
이 약관은 다님 주식회사 (이하 “회사”)가 제공하는 위치정보사업 또는 위치기반서비스사업과 관련하여 회사와 개인위치정보주체와의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.

제 2 조 (약관 외 준칙)
이 약관에 명시되지 않은 사항은 위치정보의 보호 및 이용 등에 관한 법률, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전기통신기본법, 전기통신사업법 등 관계법령과 회사의 이용약관 및 개인정보처리방침, 회사가 별도로 정한 지침 등에 의합니다.

제 3 조 (서비스 내용 및 요금)
①회사는 직접 위치정보를 수집하거나 위치정보사업자인 이동통신사로부터 위치정보를 전달받아 아래와 같은 위치기반서비스를 제공합니다.
1.Geo Tagging 서비스: 게시물에 포함된 개인위치정보주체 또는 이동성 있는 기기의 위치정보가 게시물과 함께 저장됩니다.
2.위치정보를 활용한 검색결과 제공 서비스: 정보 검색을 요청하거나 개인위치정보주체 또는 이동성 있는 기기의 위치정보를 제공 시 본 위치정보를 이용한 검색결과 및 주변결과(맛집, 주변업체, 교통수단 등)를 제시합니다.
3.위치정보를 활용한 친구찾기 및 친구맺기: 현재 위치를 활용하여 친구를 찾아주거나 친구를 추천하여 줍니다.
4.연락처 교환하기: 위치정보를 활용하여 친구와 연락처를 교환할 수 있습니다.
5.이용자 위치를 활용한 광고정보 제공: 검색결과 또는 기타 서비스 이용 과정에서 개인위치정보주체 또는 이동성 있는 기기의 위치를 이용하여 광고소재를 제시합니다.
6. 이용자 보호 및 부정 이용 방지: 개인위치정보주체 또는 이동성 있는 기기의 위치를 이용하여 권한없는 자의 비정상적인 서비스 이용 시도 등을 차단합니다.
7. 위치정보 공유: 개인위치정보주체 또는 이동성 있는 기기의 위치정보를 안심귀가 등을 목적으로 지인 또는 개인위치정보주체가 지정한 제3자에게 공유합니다.
8. 길 안내 등 생활편의 서비스 제공: 교통정보와 길 안내 등 최적의 경로를 지도로 제공하며, 주변 시설물 찾기, 뉴스/날씨 등 생활정보, 긴급구조 서비스 등 다양한 운전 및 생활 편의 서비스를 제공합니다.
②제1항 위치기반서비스의 이용요금은 무료입니다.

	
								</textarea>
								<input class="agree mgc mgc-warning" type="checkbox" id="agree"><span class="val"> 위의 모든 약관에 동의합니다. </span><br>
								<button class="main-button icon-button pull-right enrollbutton" type="submit">가입하기</button>							
							</div>
						</div>
					</form>
					<!-- simple sign up -->

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
							<a class="logo" href="index.do">
								<img src="/danim/resources/img/logo.png" alt="logo">
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
							<span>&copy; Copyright Koo gun mo. | This Poroject is made with Kim nam gyu & You young joon</a></span>
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
