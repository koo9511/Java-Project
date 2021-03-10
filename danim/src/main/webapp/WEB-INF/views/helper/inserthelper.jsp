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
    <title>다님: 등록페이지</title>

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

        function selectChange() {
            var target = document.getElementById("matchingyj");
            var space = document.getElementById("matchingcontentyj");
            space.textContent = target.options[target.selectedIndex].value;
        }




        // this function runs when the page loads to set up the drop area
        function init() {
            // Set the drop-event handlers.
            var dropArea = document.getElementById("uploader");
            dropArea.addEventListener("drop", dropHandler, false);
            dropArea.addEventListener("dragover", doNothing, false);
        }

        function dropHandler(event) {
            // Use our doNothing() function to prevent default processing.
            doNothing(event);
            // Get the file(s) that are dropped.
            var filelist = event.dataTransfer.files;
            if (!filelist) return; // if null, exit now
            var filecount = filelist.length; // get number of dropped files
            if (filecount > 0) {
                // Do something with the files.
            }
        }
        // Prevents the event from continuing so our handlers can process the event.
        function doNothing(event) {
            event.stopPropagation();
            event.preventDefault();
        }

        $(document).ready(function() {
            $("#timeryj").on('change', function() {
                if (this.value == "예약") {
                    $("#reser1").css('display', 'block');
                } else {
                    $("#reser1").css('display', 'none');
                }
            })
            
            $('textarea[name=helpercontents]').on('keyup', function() {
                if($(this).val().length > 1000) {
                    $(this).val($(this).val().substring(0, 1000));
                    alert("글자수는 1000자로 제한됩니다.");
                }
            });
        })

    </script>
    <script>
        function inputNumberFormat(obj) {
            obj.value = comma(uncomma(obj.value));
        }

        function comma(str) {
            str = String(str);
            return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
        }

        function uncomma(str) {
            str = String(str);
            return str.replace(/[^\d]+/g, '');
        }

    </script>

    <style>
        .modal {
            position: fixed;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            background: rgba(0, 0, 0, .5);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .modal .content {
            background: #fff;
            display: inline-block;
            padding: 2rem;
            position: relative;
        }

        .modal .content h4 {
            margin-top: 0;
        }

        .modal .content a.close {
            position: absolute;
            top: 1rem;
            right: 1rem;
            color: inherit;
        }

        ::-webkit-scrollbar {
            width: 10px;
            height: 10px;
        }

        ::-webkit-scrollbar-track {
            background: transparent;
        }

        ::-webkit-scrollbar-thumb {
            background: #888;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: #555;
        }

        @media screen and (max-width: 1366px) {
            body {
                font-size: 15px;
            }

            nav ul li a {
                font-size: 1.1em;
            }
        }

        @media screen and (max-width: 992px) {
            main {
                margin: 2rem 0;
            }

            nav {
                margin-left: -10em;
            }
        }

        @media screen and (max-width: 786px) {
            body {
                font-size: 14px;
            }

            .container {
                width: 80%;
            }
        }

        @media screen and (max-width: 450px) {
            .container {
                width: 90%;
            }
        }

    </style>

    
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
                    <h1 class="white-text">다님이 등록</h1>

                </div>
            </div>
        </div>

    </div>
    <!-- /Hero-area -->

    <!-- My Info -->
    <div id="information" class="section">

        <!-- container -->
        <div class="container">
            <h2>다님이 작성</h2>
            <hr style="border-color: #fcc159">
            <br> <br>
            <!-- row -->
            <form action="inserthelper.do" method="POST" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-md-6 row-md-6 ">

                        <table class="myinfo-table insertinfoyj" cellpadding="30px" style="margin-bottom:20px;">
                            <tr class="">
                                <select name="helpercate" class="selectyj" id="field" style="margin-bottom:30px;">
                                    <option class="selectval" value="카테고리" selected disabled hidden>카테고리</option>
                                    <option class="selectval" value="청소해주기">청소해주기</option>
                                    <option class="selectval" value="물건배달해주기">물건배달해주기</option>
                                    <option class="selectval" value="쇼핑해주기">쇼핑해주기</option>
                                    <option class="selectval" value="물건보관해주기">물건보관해주기</option>
                                    <option class="selectval" value="줄서주기">줄서주기</option>
                                    <option class="selectval" value="돌봐주기">돌봐주기</option>
                                    <option class="selectval" value="역할대행해주기">역할대행해주기</option>
                                    <option class="selectval" value="전문가/비지니스">전문가/비지니스</option>
                                    <option class="selectval" value="물건옮겨주기">물건옮겨주기</option>
                                </select>

                            </tr>
                            
                            <tr class="">
                                <td class="tdyj1"><span class="myinfo">닉네임</span></td>
                                <td class="tdyj2"><span>${loginUser.nickname}</span></td>
                                <input type="text" name="helperid" value="${loginUser.userid}" hidden>
                            </tr>
                            <tr class="">
                                <td class="tdyj1"><span class="myinfo">전화번호</span></td>
                                <td class="tdyj2"><span>${loginUser.phone}</span></td>
                                <input type="text" name="helperphone" value="${loginUser.phone}" hidden>
                            </tr>
                        </table>
                    </div>
                    <div class="col-md-12">
                        <table class="myinfo-table " cellpadding="30px" style="margin-bottom: 40px;">
                            <tr class="tryj fullwidthyj" style="letter-spacing: inherit;" id="timevalyj">
                                <td class="col-md-3 reser" style="width:15%;">
                                    <select name="helperregisttime" class="boxstyleyj" id="timeryj" style="">
                                        <option value="요청일시" disabled selected hidden>요청일시</option>
                                        <!--<option value="즉시">즉시</option>-->
                                        <option value="1시간 이내">1시간 이내</option>
                                        <option value="3시간 이내">3시간 이내</option>
                                        <option value="오늘 이내">오늘 이내</option>
                                        <option value="예약">예약</option>
                                    </select>
                                </td>
                                <td class="col-md-3 reser" style="" id=""><input name="helperregistdate" type="date" class="boxstyleyj" style="display: none;" id="reser1" hidden="false"></td>
                            </tr>
                            <tr class="tryj">
                                <select name="helperloc" class="boxstyleyj" id="">
                                    <option value="" disabled selected hidden>다님이 가능한 지역</option>
                                    <option value="서울특별시">서울특별시</option>
                                    <option value="경기도">경기도</option>
                                    <option value="인천광역시">인천광역시</option>
                                    <option value="충청북도">충청북도</option>
                                    <option value="충청남도">충청남도</option>
                                    <option value="강원도">강원도</option>
                                    <option value="세종특별자치시">세종특별자치시</option>
                                    <option value="대전광역시">대전광역시</option>
                                    <option value="전라북도">전라북도</option>
                                    <option value="전라남도">전라남도</option>
                                    <option value="광주광역시">광주광역시</option>
                                    <option value="경상북도">경상북도</option>
                                    <option value="경상남도">경상남도</option>
                                    <option value="대구광역시">대구광역시</option>
                                    <option value="울산광역시">울산광역시</option>
                                    <option value="부산광역시">부산광역시</option>
                                    <option value="제주도">제주도</option>
                                </select>
                            </tr>

                        </table>
                    </div>
                    
                    <div class="col-md-12 row-md-6 mapyj" style="padding-bottom: 40px;">
                        <table cellpadding="30px" class="col-md-4 col-sm-4 col-lg-6">
                            <input type="text" name="helpertitle" id="helptitleyj" placeholder="제목을 적어주세요 ex)가구옮기는것을 도와드립니다!!">
                        </table>
                    </div>
                    
                    <div class="col-md-12 tryj" style="margin-bottom: 40px;">
                        <textarea name="helpercontents" placeholder="집안의 물건 옮기는것 혼자힘드시죠? 제가도와드리겠습니다." style="width: 100%; height: 200px;"></textarea>
                    </div>

                    <div class="col-md-12 tryj uploadwindowyj input-field" style="margin-bottom: 40px;">
                        <div class="inputimageyj input-images-1" id="uploader" style="padding-top: 0.5em;"></div>
                    </div>


                    <!--<div class="col-sm-12 col-lg-3 row-md-4 ">
                        <table class="col-4 myinfo-table insertinfoyj" cellpadding="30px">

                            <tr class="tryj">
                                <select name="input" class="boxstyleyj" id="matchingyj" onchange="selectChange();" style="margin-bottom: 0px;">
                                    <option value="요청일시" disabled selected hidden>매칭방식</option>
                                    <option value="즉시 매칭이랑 고객님이 요청하신 심부름비용에 가장 먼저 지원을 하는 서포터에서 업무를 맡기는 방식입니다. 즉시 매칭은 현재 현금결제만 가능합니다.">즉시매칭</option>
                                    <option value="일반입찰이란 심부름 서비스를 요청하면 주변의 서포터가 지원금액과 함께 고객님의 심부름에 지원을 하게 됩니다. 이 후 고객님께서 원하시는 서포터에게 업무를 맡기는 방식입니다.">입찰매칭</option>
                                </select>
                            </tr>
                        </table>
                    </div>-->
                    
                    <div class="col-md-12 tryj" style="margin-bottom: 40px;">
                      	<table>
	                        <tr class="">
                                <td class="tdyj1"><span class="myinfo">매칭방식</span></td>
                                <td class="tdyj2"><span>직접연락</span></td>
	                        </tr>
                    	</table>
                    </div>

                    <div class="col-md-12 row-md-6 mapyj" style="padding-bottom: 40px;">
                        <table cellpadding="30px" class="col-md-4 col-sm-4 col-lg-6">
                            <input class="" type="text" name="helperpay" id="addressdetailyj" placeholder="심부름비용(물품구매비용 제외)" onkeyup="inputNumberFormat(this)">
                        </table>
                    </div>

                    <div class="col-md-12 tryj" style="margin-bottom: 100px;">
                      	<table>
	                        <tr class="">
                                <td class="tdyj1"><span class="myinfo">결제방식</span></td>
                                <td class="tdyj2"><span>다님코인</span></td>
                                <input type="text" name="helperpaym" value="다님코인" hidden>
	                        </tr>
                    	</table>
                    </div>



                    <div class="col-md-12" style="margin-bottom: 40px;">
                        <ul>
                            <li>-다님이 등록시, 도움이 필요한 고객들에게 연락을 받을 수 있습니다.</li>
                            <li>-심부름비용은 물품구매가 있을 경우 물품비용을 제외한 심부름 가격입니다.</li>
                            <li>-결제방식은 다님이 코인으로 제한 됩니다.</li>
                            <li style="color: red; font-weight: bold;">-다님 서비스를 이용하여 불법적인 업무를 요청할 수 없으며, 본 서비스는 중개 플랫폼으로서 서비스 요청 시 모든 책임은 회원에게 있습니다.
                            <li style="color: red; font-weight: bold;">-불법적인 서비스 제공 시, 형사 고발및 불이익을 당할 수 있습니다.
                            </li>
                        </ul>
                    </div>



                    <br> <br>
                    <!-- /row -->
                    <button class="main-button icon-button pull-right enrollbutton" type="submit">등록완료</button>
                </div>
            </form>
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
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 4 // 지도의 확대 레벨 
            };

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

        //■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
        //                                주소-좌표
        //■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();

        var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
            infowindow = new kakao.maps.InfoWindow({
                zindex: 1
            }); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

        // 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
        searchAddrFromCoords(map.getCenter(), displayCenterInfo);

        // 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
        kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

        });

        // 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
        kakao.maps.event.addListener(map, 'idle', function() {
            searchAddrFromCoords(map.getCenter(), displayCenterInfo);
        });

        function searchAddrFromCoords(coords, callback) {
            // 좌표로 행정동 주소 정보를 요청합니다
            geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
        }

        function searchDetailAddrFromCoords(coords, callback) {
            // 좌표로 법정동 상세 주소 정보를 요청합니다
            geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
        }

        // 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
        function displayCenterInfo(result, status) {
            if (status === kakao.maps.services.Status.OK) {
                var infoDiv = document.getElementById('centerAddr');
                var addressinfo = document.getElementById('addressinfoyj');

                for (var i = 0; i < result.length; i++) {
                    // 행정동의 region_type 값은 'H' 이므로
                    if (result[i].region_type !== 'H') {
                        infoDiv.innerHTML = result[i].address_name;
                        addressinfo.innerHTML = result[i].address_name;

                        break;
                    }
                }
            }
        }

        function displayCenterInfo2(result, status) {
            if (status === kakao.maps.services.Status.OK) {
                for (var i = 0; i < result.length; i++) {
                    if (result[i].region_type !== 'H') {
                        $('#addressinfoyj').val(result[i].address_name);
                        /*console.log(result[i].address_name);*/
                        break;
                    }
                }
            }
        }
        
        var geolat;
        var geolng;
        

        //■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
        //                                마커-이미지
        //■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
        var startSrc = '/danim/resources/img/ward1.png', // 출발 마커이미지의 주소입니다    
            startSize = new kakao.maps.Size(33, 44), // 출발 마커이미지의 크기입니다 
            startOption = {
                offset: new kakao.maps.Point(16.5, 44) // 출발 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
            };
        var wardimage = new kakao.maps.MarkerImage(startSrc, startSize, startOption);





        // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
        var mapTypeControl = new kakao.maps.MapTypeControl();

        // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
        // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
        map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

        // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
        var zoomControl = new kakao.maps.ZoomControl();
        map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
        // 마커를 표시할 위치와 title 객체 배열입니다 
        // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
        if (navigator.geolocation) {

            // GeoLocation을 이용해서 접속 위치를 얻어옵니다
            navigator.geolocation.getCurrentPosition(function(position) {

                var lat = position.coords.latitude, // 위도
                    lng = position.coords.longitude; // 경도

                var locPosition = new kakao.maps.LatLng(lat, lng), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                    message = '<div style="padding:5px;">계신위치가 이곳이신가요?</div>'; // 인포윈도우에 표시될 내용입니다

                // 마커와 인포윈도우를 표시합니다
                displayMarker(locPosition);
                
                geolat=lat;
                geolng=lng;

            });

        } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

            var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
                message = 'geolocation을 사용할수 없어요..'

            displayMarker(locPosition);
        }


        /*// 지도를 클릭한 위치에 표출할 마커입니다
        var marker = new kakao.maps.Marker({ 
            // 지도 중심좌표에 마커를 생성합니다 
            position: map.getCenter() 
        }); */

        // 지도를 클릭한 위치에 표출할 마커입니다
        var marker = new kakao.maps.Marker({
            /*    // 지도 중심좌표에 마커를 생성합니다 
                position: map.getCenter() */
        });
        // 지도에 마커를 표시합니다
        marker.setMap(map);

        var infowindow = new kakao.maps.InfoWindow({

        });


        // 지도에 마커와 인포윈도우를 표시하는 함수입니다
        function displayMarker(locPosition) {

            marker = new kakao.maps.Marker({
                map: map,
                position: locPosition,
                image: wardimage

            });


            marker.setPosition(locPosition);

            /*var iwContent = message, // 인포윈도우에 표시할 내용
                iwRemoveable = false;

            // 인포윈도우를 생성합니다
            infowindow = new kakao.maps.InfoWindow({
                content: iwContent,
                removable: iwRemoveable
            });



            // 인포윈도우를 마커위에 표시합니다 
            infowindow.open(map, marker);*/

            // 지도 중심좌표를 접속위치로 변경합니다
            map.setCenter(locPosition);
        }

        function myloc(){
        	map.setLevel(4);
			map.panTo(new kakao.maps.LatLng(geolat,geolng));
			
        }

        // 지도가 이동, 확대, 축소로 인해 중심좌표가 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
        kakao.maps.event.addListener(map, 'center_changed', function() {

            // 지도의 중심좌표를 얻어옵니다 
            var latlng = map.getCenter();

            marker.setPosition(latlng);
            infowindow.setPosition(latlng);

            var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
            message += '경도는 ' + latlng.getLng() + ' 입니다';

            var resultDiv = document.getElementById('result1');

            resultDiv.innerHTML = message;



        });

        kakao.maps.event.addListener(map, 'idle', function() {
            var latlng = map.getCenter();
            $('#result1').val(latlng.getLat());
            $('#result2').val(latlng.getLng());

            searchDetailAddrFromCoords(latlng, function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    var detailAddr = result[0].road_address;

                    if (detailAddr == null) {
                        geocoder.coord2RegionCode(latlng.getLng(), latlng.getLat(), displayCenterInfo2);
                    } else {
                        $('#addressinfoyj').val(detailAddr.address_name);
                    }
                }
            });
        });

        kakao.maps.event.addListener(map, 'dragend', function() {
            var latlng = map.getCenter();

            console.log(latlng);

            $('#result1').val(latlng.getLat());
            $('#result2').val(latlng.getLng());


            searchDetailAddrFromCoords(latlng, function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    var detailAddr = result[0].road_address;

                    if (detailAddr == null) {
                        geocoder.coord2RegionCode(latlng.getLng(), latlng.getLat(), displayCenterInfo2);
                    } else {
                        $('#addressinfoyj').val(detailAddr.address_name);
                    }
                }
            });

        });

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
    <script type="text/javascript" src="/danim/resources/js/image-uploader.js"></script>

    <script>
        $(function() {

            $('#uploader').imageUploader();

            /*               $('form').on('submit', function(event) { */

            //Stop propagation
            /*                     event.preventDefault();
                               event.stopPropagation(); */

            // Get some vars
            /* let $form = $(this); */

            /* 
            ,
                $modal = $('.modal') */

            // Set name and description
            /*                     $modal.find('#display-name span').text($form.find('input[id^="name"]').val());
                                $modal.find('#display-description span').text($form.find('input[id^="description"]').val());
             */
            // Get the input file
            /*                     let $inputImages = $form.find('input[name^="images"]');
                                if (!$inputImages.length) {
                                    $inputImages = $form.find('input[name^="photos"]');		
                                } */

            // Get the new files names
            /*                    let $fileNames = $('<ul>');
                                for (let file of $inputImages.prop('files')) {
                                    $('<li>', {
                                        text: file.name
                                    }).appendTo($fileNames);
                                } 
             */
            // Set the new files names
            /* $modal.find('#display-new-images').html($fileNames.html()); */

            // Get the preloaded inputs
            /*                     let $inputPreloaded = $form.find('input[name^="old"]');
                                if ($inputPreloaded.length) { */

            // Get the ids
            /*                         let $preloadedIds = $('<ul>');
                                    for (let iP of $inputPreloaded) {
                                        $('<li>', {
                                            text: '#' + iP.value
                                        }).appendTo($preloadedIds);
                                    } */

            // Show the preloadede info and set the list of ids
            /* $modal.find('#display-preloaded-images').show().html($preloadedIds.html()); */

            //                    } else {

            // Hide the preloaded info
            /* $modal.find('#display-preloaded-images').hide(); */
            //                    }

            // Show the modal
            /*                     $modal.css('visibility', 'visible'); */
            //                });

            // Input and label handler
            $('input').on('focus', function() {
                $(this).parent().find('label').addClass('active')
            }).on('blur', function() {
                if ($(this).val() == '') {
                    $(this).parent().find('label').removeClass('active');
                }
            });


        });

    </script>

</body>

</html>
