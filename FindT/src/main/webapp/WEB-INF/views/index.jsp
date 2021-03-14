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
            </script>
        </head>
    <body>
        
      <input type="checkbox" id="switch">

      <div class="app">
        <div class="body">
          <div class="main-circle"></div>
          <div class="phone">
          <!-- Middle -->
            <div class="content">
                <div class="circle">
                    <div class="crescent"></div>
                </div>
                
                <p class="heading">App name</p><br>
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
           <!-- Bottom --> 
            <div class="skip">
              <p>회원가입</p>
              <p>Gunmo<br>Seunghee

              </p>
            </div>
          </div>
        </div>
      </div>

      <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
      <script>
        AOS.init
      </script>
    </body>
    
    </html>
