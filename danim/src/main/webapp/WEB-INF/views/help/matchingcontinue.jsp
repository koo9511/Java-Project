<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="Image-Uploader is a simple jQuery Drag & Drop Image Uploader plugin made to be used in forms, withot AJAX." />
    <meta name="keywords" content="image, upload, uploader, image-uploader, jquery, gallery, file, form, static" />
    <meta name="author" content="Christian Bayer" />
    <meta property="og:url" content="https://christianbayer.github.io/image-uploader/" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="Image-Uploader" />
    <meta property="og:description" content="Image-Uploader is a simple jQuery Drag & Drop Image Uploader plugin made to be used in forms, withot AJAX." />
    <meta property="og:image" content="https://github.githubassets.com/images/modules/logos_page/GitHub-Logo.png" />
    <link rel="stylesheet" href="/danim/resources/css/image-uploader.min.css">
    <title>다님: 매칭중...</title>

    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Lato:700%7CMontserrat:400,600" rel="stylesheet">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="/danim/resources/css/bootstrap.min.css" />

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="/danim/resources/css/font-awesome.min.css">

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="/danim/resources/css/style.css" />
    <!-- Custom youngjun's stlylesheet -->
    <link type="text/css" rel="stylesheet" href="/danim/resources/css/yjstyle.css" />
    <!-- services 라이브러리 불러오기 -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8944cc8da7a96ff282ca5347ffa73acd&libraries=services"></script>

    <!-- services와 clusterer, drawing 라이브러리 불러오기 -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8944cc8da7a96ff282ca5347ffa73acd&libraries=services,clusterer,drawing"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script>
        function logout() {
            alert = "로그아웃 되었습니다.";
        }
        
        $(document).ready(function() {
            setTimeout("movetomain()", 5000);
        });
        
        function movetomain(){
            location.href = "helplist.do";
        }

    </script>

</head>

<body>

    <!-- Header -->
		<c:import url="../headfoot/header.jsp" />
	<!-- /Header -->

    <!-- Hero-area -->
    
    <!-- /Hero-area -->

    <!-- My Info -->
    <div id="information" class="" style="">

        <!-- container -->
        <div class="container" style="text-align: center;">
	        <div class="footp">	
	            <img alt="" src="/danim/resources/img/footponce1.gif" style="width:100%; ">
	            <div id="" class="footptext">매칭중입니다. 잠시후에 메인페이지로 이동됩니다.</div>
	        </div>
        </div>
        
        
            
            
            
            
            
        <!-- Footer -->
		<c:import url="../headfoot/footer.jsp" />
		<!-- /Footer -->
    </div>
    <!-- preloader -->
    <div id='preloader'>
        <div class='preloader'></div>
    </div>
    <!-- map -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8944cc8da7a96ff282ca5347ffa73acd"></script>
   
    <!-- /preloader -->
    <!-- jQuery Plugins -->
    <script type="text/javascript" src="/danim/resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="/danim/resources/js/bootstrap.min.js"></script>
    <!--<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=true"></script>
        <script type="text/javascript" src="/danim/resources/js/google-map.js"></script>-->
    <script type="text/javascript" src="/danim/resources/js/main.js"></script>

    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
    <!--        <script type="text/javascript" src="/danim/resources/js/image-uploader.min.js"></script>-->
<!--    <script type="text/javascript" src="/danim/resources/js/image-uploader2.js"></script>-->

</body>

</html>
