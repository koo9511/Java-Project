<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
        <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">

            <title>FindT</title>

            <!-- main css -->
            <link type="text/css" rel="stylesheet" href="resources/css/style.css"/>
            <!-- AOS cs -->
            <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
            <!-- jquery -->
            <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
        </head>
    <body>
        
      <input type="checkbox" id="switch">
      <div class="app">
        <div class="body">
          <div class="main-circle"></div>
          <div class="phone" data-aos="flip-left">
          <!-- Middle -->
            <div class="content">
              <div class="circle">
                <div class="crescent"></div>
              </div>
              <p class="heading">테마 선택</p>
              <p>원하시는 모드를 선택하세요
              </p>
              <label for="switch">
                <div class="toggle"></div>
                <div class="names">
                  <p class="light">라이트</p>
                  <p class="dark">다크</p>
                </div>
              </label>
              
              <div class="mark"></div>
            </div>
           <!-- Bottom --> 
            <div class="skip">
              <p>Skip</p>
              <div class="fab">
                <div class="arrow"></div>
              </div>
            </div>
            <div class="swipe"></div>
          </div>
        </div>
      </div>

      <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
      <script>
        AOS.init
      </script>
    </body>
    
    </html>
