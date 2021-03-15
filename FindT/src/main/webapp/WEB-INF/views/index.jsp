<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
        <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">

            <title>koogunmo</title>

            <!-- main css -->
            <link type="text/css" rel="stylesheet" href="resources/css/style.css"/>
            <!-- AOS cs -->
            <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
            <!-- jquery -->
            <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
            <script>
                function try_login(){
                    var user_id = $('#login-id').val()
                    var user_pw = $('#login-pwd').val()

                    alert(user_id + ", " + user_pw)
                }

                function change_form(){
                    $('#login-content').toggleClass('hidden')
                    $('#enroll-content').toggleClass('hidden')

                    if(!$('#login-content').hasClass('hidden'))
                        $('.enroll-toggle-button').html('회원가입')
                    else 
                        $('.enroll-toggle-button').html('로그인')
                }

            </script>
        </head>
    <body>
        
      <input type="checkbox" id="switch">
      <div class="app" data-aos="zoom-out">
        <div class="body">
          <div class="main-circle"></div>
          <div class="phone">
          <!-- Middle -->
            <div class="content" id="login-content">
                <div class="circle">
                    <div class="crescent"></div>
                </div>
                <p class="heading">With U</p><br>
                <div id="login-box">
                    <input id="login-id" type="text" class="login-input" placeholder="ID">
                    <input id="login-pwd" type="password" class="login-input" placeholder="PASSWORD">
                    <div id="login-check-box">
                        <input type="checkbox" id="remember-id">
                        <label for="remember-id" id="remember-id-chk">아이디 저장</label>
                    </div>

                    <button class="button btn" id="login-btn" onclick="try_login()">로그인</button>
                </div>


                <label for="switch" class="toggle-switch">
                <div class="toggle"></div>
                <div class="names">
                    <p class="light">라이트</p>
                    <p class="dark">다크</p>
                </div>
                </label>
                <!-- choice theme -->
            </div>
            <div class="content hidden" id="enroll-content">
                <p class="heading">회원가입</p><br>
                <div id="login-box">
                    <input id="enroll-name" type="text" class="login-input" placeholder="이름">
                    <input id="enroll-id" type="text" class="login-input" placeholder="아이디" style="width: 70%;">
                    <button id="idCheck" type="button" class="button btn">체크</button>
                    <input id="enroll-pwd" type="password" class="login-input" placeholder="비밀번호">
                    <input id="enroll-pwd-cfm" type="password" class="login-input" placeholder="비밀번호 확인">
                    <input id="enroll-phone" type="text" class="login-input" placeholder="전화번호">
                    <input id="enroll-email" type="text" class="login-input" placeholder="이메일">

                    <textarea id="agree-content" readonly>asdasdasdaasdasdasdasdasddasdasdaasdasdasdaasdasdasdasdasddasdasdaasdasdasdaasdasdasdasdasddasdasda
                    </textarea>
                    <div id="login-check-box">
                        <input type="checkbox" id="agree">
                        <label for="agree" id="agree-chk">약관에 동의합니다.</label>
                    </div>

                    <button class="button btn" id="login-btn" onclick="try_login()">가입하기</button>
                </div>


                <!-- <label for="switch" class="toggle-switch">
                <div class="toggle"></div>
                <div class="names">
                    <p class="light">라이트</p>
                    <p class="dark">다크</p>
                </div>
                </label> -->
                <!-- choice theme -->
            </div>
           <!-- Bottom --> 
            <div class="skip">
              <p class="enroll-toggle-button" onclick="change_form()">회원가입</p>
              <p>Gunmo<br>Seunghee
              </p>
            </div>
          </div>
        </div>
      </div>

      <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
      <script>
        AOS.init();
      </script>
    </body>
    
    </html>
