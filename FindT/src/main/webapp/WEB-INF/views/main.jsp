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
            <link type="text/css" rel="stylesheet" href="resources/css/content.css"/>
            <!-- AOS cs -->
            <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
            <!-- jquery -->
            <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
        </head>
    <body>
        
        <input type="checkbox" id="switch">
        <div class="app" data-aos="zoom-out">
            <div class="body">
                <div class="main-circle" style="">
                    <div id="myinfo">
                        <p>asdasdasdasdasd</p>
                    </div>
                    
                </div>
                <div class="sticky">
                    <span style="width: 50%; float: left; text-align: center;">nickname</span>
                    <button class="button btn" type="button" style="width: 50%; float: right;">Menu</button>
                </div>
                <div class="phone" style="height: 1200px;">
                <!-- Middle -->
                <div class="content" id="login-content">
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
                </div>
            </div>
        </div>
    
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        <script>
        AOS.init();
        </script>
    </body>
    
    </html>
    
