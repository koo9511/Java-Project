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
    <title>다님: 상세페이지</title>

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
            $("#timeryj").on('change', function() {
                if (this.value == "예약") {
                    $("#reser1").css('display', 'block');
                    $("#reser2").css('display', 'block');
                } else {
                    $("#reser1").css('display', 'none');
                    $("#reser2").css('display', 'none');
                }
            })
        })
        
        function helpdelete(helpno){
        	if(confirm("등록된 게시글을 삭제하시겠 습니까?")==true){
        		location.href="helpdelete.do?helpno=" + helpno;	
        	}
        	
        }
        
      function pop(url){
		  var img= new Image();
		  img.src=url;
		  var img_width=img.width;
		  var win_width=img.width+25;
		  var img_height=img.height;
		  var win=img.height+30;
		  var OpenWindow=window.open('','_blank', 'width='+img_width+', height='+img_height+', menubars=no, scrollbars=auto');
		  OpenWindow.document.write("<style>body{margin:0px;}</style><img src='"+url+"' width='"+win_width+"'>");
        }
      
      
      function cancel(){
    	  if(confirm("매칭 취소요청을 하시겠습니까?(매칭취소시 다님코인 한개가 지불됩니다.)")==true){
    		  location.href="helplist.do";
    	  }else{
    		  return;
    	  }
      };
      
      function confirme(){
    	  if(confirm("심부름완료 요청을 하시겠습니까?(상대방도 동의해야 완료됩니다.)")==true){
    		  location.href="helplist.do";
    	  }else{
    		  return;
    	  }
      };
    </script>

</head>

<body>

    <!-- Header -->
		<c:import url="../headfoot/header.jsp" />
	<!-- /Header -->

    <!-- Hero-area -->
    <div class="hero-area section">

        <!-- Backgound Image -->
        <div class="bg-image bg-parallax overlay" style="background-image: url(/danim/resources/img/page-background.jpg)"></div>
        <!-- /Backgound Image -->

        <div class="container">
            <div class="row">
                <div class="col-md-10 col-md-offset-1 text-center">
                    <ul class="hero-area-tree">
                        <li><a href="userChange.do">Danim:</a></li>
                    </ul>
                    <h1 class="white-text">상세페이지</h1>

                </div>
            </div>
        </div>

    </div>
    <!-- /Hero-area -->

    <!-- My Info -->
    <div id="information" class="section">

        <!-- container -->
        <div class="container">
            <h2>심부름 요청</h2>
            <hr style="border-color: #fcc159">
            <br>
            <!-- row -->
            
            <div class="row">
            	
                <div class="col-md-6 row-md-6 ">
	 				<div class="mapyj" style="padding-bottom: 20px;">
	                    <label for="map" class="yellowlabelyj">요청지역</label>
	                    <div class="map_wrap" cellpadding="30px" style="height:520px;">
	                        <div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
	                        <!-- <div class="hAddr">
	                            <span class="title">지도중심기준 행정동 주소정보</span> <span id="centerAddr"></span>
	                        </div> -->
	                        <div class="mylocbg" id="mylocbg" onclick="myloc();" title="내위치"><img src="/danim/resources/img/myloc3.png" alt="" id="myloc"></div>
	                    </div>
	                </div>
                    
                </div>
               
                <div class="col-md-6 row-md-6 mapyj" style="padding-bottom: 10px;">
                	<table class="myinfo-table insertinfoyj half-table" cellspacing="30px">
                        <tr class="" style="width:49%;">
                            <td class="tdyj1"><span class="myinfo">카테고리</span></td>
                            <td class="tdyj2"><span>${help.category}</span></td>
                        </tr>
                        <tr class="" style="width:49%;">
                            <td class="tdyj1"><span class="myinfo">전화번호</span></td>
                            <td class="tdyj2"><span>${help.phone}</span></td>
                        </tr>
                        <tr class="">
                            <td class="tdyj1"><span class="myinfo">닉네임</span></td>
                            <td class="tdyj2"><span>${help.nickname}</span></td>
                        </tr>
                        <tr class="insertinfoyj">
                            <td class="tdyj1"><span class="myinfo">주소</span></td>
                            <td class="tdyj2"><span>${help.roadaddress} ${help.detailaddress}</span></td>
                        </tr>

                        <tr class="insertinfoyj">
                            <td class="tdyj1"><span class="myinfo">예상시간</span></td>
                            <td class="tdyj2"><span>${help.usingtime}</span></td>
                        </tr>
                        <tr class="insertinfoyj">
                            <td class="tdyj1"><span class="myinfo">요청기한</span></td>
                            <td class="tdyj2"><span>${help.endtime}</span></td>
                        </tr>
                    	<tr class="insertinfoyj">
                            <td class="tdyj1"><span class="myinfo">매칭방식</span></td>
                            <td class="tdyj2"><span>${help.matching}</span></td>
                        </tr>
                        <tr class="insertinfoyj">
                            <td class="tdyj1"><span class="myinfo">요청비용</span></td>
                            <td class="tdyj2"><span>${help.pay}</span></td>
                        </tr>
                        <tr class="insertinfoyj">
                            <td class="tdyj1"><span class="myinfo">결제방식</span></td>
                            <td class="tdyj2"><span>${help.paym}</span></td>
                        </tr>
                         
                    </table>
                </div>
                <div class="col-md-6 row-md-6 mapyj" style="padding-bottom: 10px;">
                    <table cellpadding="30px" class="myinfo-table insertinfoyj">
                        
                         <tr class="insertinfoyj">
                            <td class="tdyj1"><span class="myinfo">요청제목</span></td>
                            <td class="tdyj2"><span>${help.helptitle}</span></td>
                        </tr>
                    </table>
                </div>


                <div class="col-md-12" style="margin-bottom: 20px; width: 100%;">
                   <table cellpadding="30px">
                    <tr class="insertinfoyj" valign="top">
                        <td class="tdyj1"><span class="myinfo">요청내용</span></td>
                        <td class="tdyj4" id="content"><span>${help.contents}</span></td>
                    </tr>
                    </table>
                </div>
              	<c:if test="${!empty help.image}">
                <div class="col-md-12 tryj uploadwindowyj input-field" style="margin-bottom: 10px; margin-top: 20px;">
                        <div class="inputimageyj input-images-1" id="uploader" style="border:none;">
                           <div class="image-uploader has-files">
                                   <div class="uploaded" style="margin: 0px;">

                                  	<c:forEach var="img" items="${rname}">
                                  		<div class="uploaded-image" name="image" style="margin:0; margin-bottom:0.3rem;"><img src="${img}" class="img" onclick="pop(this.src)"></div>
                                  	</c:forEach>
                                  	
									</div>
                               </div>
                        </div>
                </div>
               	</c:if>
                
                <br> <br>
                <!-- /row -->
                
               
                <div>
                   <table>
                   <tr>
                        <td class="pull-right">
                        <a class="main-button icon-button" onclick="cancel();" style="z-index: 2;margin-bottom: 40px;margin-top: 40px; margin-right:20px;">매칭취소</a>
                        <a class="main-button icon-button" onclick="confirme();" style="z-index: 2;margin-bottom: 40px;margin-top: 40px;">심부름완료</a>
                        </td>
                    </tr>
                    </table>
                </div>
            </div>
            <!-- /container -->

        </div>
        <!-- /Contact -->
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
    <script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(Number(${help.locationcodelat}), Number(${help.locationcodelng})), // 지도의 중심좌표
                level: 4 // 지도의 확대 레벨 
            };

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

        // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
        var mapTypeControl = new kakao.maps.MapTypeControl();

        // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
        // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
        map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

        // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
        var zoomControl = new kakao.maps.ZoomControl();
        map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

        var imageSrc = '/danim/resources/img/arrow.gif', // 마커이미지의 주소입니다    
            imageSize = new kakao.maps.Size(35, 70), // 마커이미지의 크기입니다
            imageOption = {
                offset: new kakao.maps.Point(17.5, 70)
            }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

        // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
            markerPosition = new kakao.maps.LatLng(Number(${help.locationcodelat}), Number(${help.locationcodelng})); // 마커가 표시될 위치입니다


        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            position: markerPosition,
            image: markerImage // 마커이미지 설정 
        });

        // 마커가 지도 위에 표시되도록 설정합니다
        marker.setMap(map);

        //처음 맵위치로 이동
        function myloc() {
        	map.setLevel(4);
        	map.panTo(new kakao.maps.LatLng(Number(${help.locationcodelat}), Number(${help.locationcodelng})));
            
        }

    </script>
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
