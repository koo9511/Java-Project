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


<title>다님: 효율적인 삶의 시작</title>
<style>
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-size: 15px;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 650px !important;
}

#category {
	position: absolute;
	top: 75px;
	left: 10px;
	border-radius: 5px;
	border: 1px solid #909090;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
	background: #fcc159;
	overflow: hidden;
	z-index: 2;
}

#map div div:nth-child(2) div:nth-child(0) a:nth-child(0) {
	background:url("/danim/resources/img/control.png")  -5px -183px / 116px 264px no-repeat !important;
}

#category li {
	/*float: left;*/
	list-style: none;
	width: 40px;
	/*            border-right: 1px solid white;*/
	padding: 3px 0;
	text-align: center;
	cursor: pointer;
}

#category li.click {
	background: white;
}

#category li:hover {
	background: white;
	/*            border-right: 1px solid #acacac;*/
}

#category li:last-child {
	margin-right: 0;
	border-right: 0;
}

#category li span {
	display: block;
	margin: 0 auto 1px;
	width: 30px;
	height: 36px;
}

#category li .category_bg {
	background: url(/danim/resources/img/wardimgsetnosh_v4.png) no-repeat;
}

#category li .cleaning {
	background-position: -80px -5px;	
}

#category li .delivery {
	background-position: -118px -5px;
}

#category li .shopping {
	background-position: -80px -48px;
}

#category li .keeping {
	background-position: -118px -48px;
}

#category li .lineup {
	background-position: -80px -91px;
}

#category li .care {
	background-position: -118px -91px;
}

#category li .cosplay {
	background-position: -80px -134px;
}

#category li .professional {
	background-position: -118px -134px;
}

#category li .moving {
	background-position: -80px -177px;
}

#category li:nth-child(2n-1) span {
	background-position-x: -4px;
}

#category li:nth-child(2n) span {
	background-position-x: -42px;
}

#category li:nth-child(2n-1) .on .category_bg {
	background-position-x: -4px;
}

#category li:nth-child(2n).on .category_bg {
	background-position-x: -42px;
}

.placeinfo_wrap {
	position: absolute;
	bottom: 28px;
	left: -150px;
	width: 300px;
}

.placeinfo {
	position: relative;
	width: 100%;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	padding-bottom: 10px;
	background: #fff;
}

.placeinfo:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.placeinfo_wrap .after {
	content: '';
	position: relative;
	margin-left: -12px;
	left: 50%;
	width: 22px;
	height: 12px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.placeinfo a, .placeinfo a:hover, .placeinfo a:active {
	color: #fff;
	text-decoration: none;
}

.placeinfo a, .placeinfo span {
	display: block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.placeinfo span {
	margin: 5px 5px 0 5px;
	cursor: default;
	font-size: 13px;
}

.placeinfo .title {
	font-weight: bold;
	font-size: 14px;
	border-radius: 6px 6px 0 0;
	margin: -1px -1px 0 -1px;
	padding: 10px;
	color: #fff;
	background: #d95050;
	background: #d95050
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.placeinfo .tel {
	color: #0f7833;
}

.placeinfo .jibun {
	color: #999;
	font-size: 11px;
	margin-top: 0;
}

.hAddr {
	position: absolute;
	left: 10px !important;
	top: 10px;
	border-radius: 2px;
	/*background: #efb75b;*/
	/*background: rgba(255, 255, 255, 0.8);*/
	background: rgba(239, 183, 91, 0.7);
	color: white;
	z-index: 1;
	padding: 5px;
}
</style>
<!-- Google font -->



<link
	href="https://fonts.googleapis.com/css?family=Lato:700%7CMontserrat:400,600"
	rel="stylesheet">

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet"	href="/danim/resources/css/bootstrap.min.css" />

<!-- Font Awesome Icon -->
<link rel="stylesheet" href="/danim/resources/css/font-awesome.min.css">

<!-- Custom stylesheet -->
<link type="text/css" rel="stylesheet" href="/danim/resources/css/style.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- Custom stylesheet -->
<link type="text/css" rel="stylesheet" href="/danim/resources/css/yjstyle.css" />


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8944cc8da7a96ff282ca5347ffa73acd&libraries=services,clusterer,drawing"></script>

<script>
function enter(name){
	if(name.keycode ==13){
		paging(1,name,null);
	}
}


$(document).ready(function(){
	 
    $("input[name=searchname]").keydown(function (key) {
        if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
            search();
        }
    });
     
    function search (){
        //검색 찾는 로직 구현
        paging(1,$("input[name=searchname]").val(),null);
    };
     
});


function paging(page,searchname,searchcate){
	
	var obj = new Object();
	obj.current = page;
	obj.searchcate = searchcate;
	obj.searchname = searchname;
	
	//console.log("obj : " + JSON.stringify(obj));
	
	
	$.ajax({
		url:"paginghelp.do",
		data:JSON.stringify(obj),
		type:"POST",
		contentType : "application/json; charset=utf-8",
		success:function(sendjson){
			console.log(JSON.stringify(sendjson));
			//console.log(page,searchcate, searchname);
			
			console.log("트 : " + sendjson.page.listcount!=0);
			console.log("리세 : " + sendjson.page.listcount);
			
			if(sendjson.page.listcount!=0){
				var searchcate= decodeURIComponent(sendjson.searchcate);
				var searchname= decodeURIComponent(sendjson.searchname);
				
				var str1="<div class='row'>";
		           for(var i in  sendjson.helpboardlist){
		        	   str1+="<div class='col-md-6'>"
		        	   +"<div class='single-blog'>"
		        	   +"<div class='justify'>"
		        	   +"<h4 class='leftfloat'>"
		        	   +"<a href='helpdetail.do?helpno="+sendjson.helpboardlist[i].helpno+"' class='elliyj'>"+decodeURIComponent(sendjson.helpboardlist[i].helptitle).replace(/\+/gi, " ")+"</a>"
		        	   +"</h4>"
		        	   +"<div class='verbotyj'>약"+sendjson.helpboardlist[i].dis+"km</div>"
		        	   +"</div>"
		        	   +"<div class='blog-meta'>"
		        	   +"<span class='blog-meta-author'><a>"+decodeURIComponent(sendjson.helpboardlist[i].category)+"</a></span>"
		        	   +"<div class='pull-right'>"
		        	   +"<span class='course-price course-premium uiprice'>￦"+sendjson.helpboardlist[i].pay+"원</span>"
		        	   +"</div>"
		        	   +"</div>"
		        	   +"</div>"
		        	   +"</div>";
		           }
				str1+="</div>";
	         <!-- /row -->
	
				var str="<div class='row'>"
					+"<div class='col-md-12'>"
						+"<div class='post-pagination'>";
								if((sendjson.page.currentpage - sendjson.page.pagelimit) < sendjson.page.startpage	&& (sendjson.page.currentpage-sendjson.page.pagelimit)>=1){
									if(sendjson.searchname==null && sendjson.searchcate==null){
										str+="<a onclick='paging("+(sendjson.page.startpage - sendjson.page.pagelimit)+","+null+","+null+");' class='pagination-back pull-left' style='visibility:visible;'>이전</a>"
									}else if(sendjson.searchname!= null){
										str+="<a onclick='paging("+(sendjson.page.startpage - sendjson.page.pagelimit)+",\""+searchname+"\","+null+");' class='pagination-back pull-left' style='visibility:visible;'>이전</a>"
									}else{
										str+="<a onclick='paging("+(sendjson.page.startpage - sendjson.page.pagelimit)+","+null+",\""+searchcate+"\");' class='pagination-back pull-left' style='visibility:visible;'>이전</a>"
									}
								}else{
										str+="<a onclick='paging("+(sendjson.page.startpage - sendjson.page.pagelimit)+","+null+","+null+");' class='pagination-back pull-left' style='visibility:hidden;'>이전</a>"
								}
								str+="<ul class='pages'>";
								if(sendjson.page.endpage!=1){
									for( var i=sendjson.page.startpage; i<=sendjson.page.endpage; i++){
										if(i==sendjson.page.currentpage){
											str+="<li class='active'>" + i + "</li>"	
										}else{
											if(sendjson.searchname==null && sendjson.searchcate== null){
												str+="<li class=''><a onclick='paging("+i+","+null+","+null+");'>" + i + "</a></li>"
											}else if(sendjson.searchname!= null){
												str+="<li class=''><a onclick='paging("+i+",\""+searchname+"\","+null+");'>"+i+"</a></li>"
											}else if(sendjson.searchcate!= null){
												str+="<li class=''><a onclick='paging("+i+","+null+",\""+searchcate+"\");'>"+i+"</a></li>"
											}
										}
									}
								}
								str+="</ul>";
								if(sendjson.page.endpage - sendjson.page.startpage == sendjson.page.pagelimit-1 && sendjson.page.totalpage != sendjson.page.endpage){
									if(sendjson.searchname== null && sendjson.searchcate==null){
										str+="<a onclick='paging("+(sendjson.page.endpage+1)+","+null+","+null+");' class='pagination-next pull-right' style='visibility:visible;'>다음</a>"
									}else if( sendjson.searchname != null){
										str+="<a onclick='paging("+(sendjson.page.endpage+1)+",\""+searchname+"\","+null+");' class='pagination-next pull-right' style='visibility:visible;'>다음</a>"
									}else{
										str+="<a onclick='paging("+(sendjson.page.endpage+1)+","+null+",\""+searchcate+"\");' class='pagination-next pull-right' style='visibility:visible;'>다음</a>"
									}
								}else{
									str+="<a  onclick='paging("+(sendjson.page.endpage+1)+","+null+","+null+"' class='pagination-next pull-right' style='visibility:hidden;'>다음</a>"
								}
						+"</div>"
					+"</div>"
				+"</div>";
				
				$('#main1').html(str1);
				$('#main2').html(str);
			}else{
				$('#main1').html("<div class='nosearch' style='width:100%;'><img src='/danim/resources/img/nosearch2.png' style='width:50%;text-align:center;'></div>");
			}
		}		
	})
}
$(document).ready(function(){
	var target = document.getElementById("map");
	target.childNodes[3].childNodes[0].childNodes[0].style.removeProperty("background");
	target.childNodes[3].childNodes[0].childNodes[0].style.background= "url('/danim/resources/img/control.png')  -5px -183px / 116px 264px no-repeat";
	
	
	var str = "뀨";
	
	paging(1,null,null);
	
});
</script>
</head>

<body>

	<!-- Header -->
		<c:import url="../headfoot/header.jsp" />
	<!-- /Header -->

	<!-- Hero-area -->
	<div class="hero-area section">

		<!-- Backgound Image -->
		<div class="bg-image bg-parallax overlay"
			style="background-image: url(/danim/resources/img/IMG_0078.jpeg)"></div>
		<!-- /Backgound Image -->
		
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-offset-1 text-center">
					<ul class="hero-area-tree">
						<li>Danim:</li>
					</ul>
					<h1 class="white-text">다님이를 기다리고 있어요!</h1>
				</div>
				<a class="main-button icon-button pull-right" href="helperlist.do"
					style="margin-bottom: -5%;">다님이에게 도움받기</a>
			</div>
		</div>

	</div>
	<!-- /Hero-area -->

	<!-- Blog -->
	<div id="blog" class="section">

		<!-- container -->
		<div class="container">
			<h3>내 주변 요청</h3>
			<%-- <a href="matchingstarthelper.do?helpno=2&userid=${loginUser.userid}" style="margin-right:20px;">대충매칭시작된버튼</a>
			<a href="matchingstarthelp.do?helpno=2&userid=${loginUser.userid}" style="margin-right:20px;">대충매칭시작된버튼</a> --%>
			
			<hr style="border-color: #fcc159;">

			<!-- 맵 -->
			<div class="map_wrap" style="margin-bottom: 40px;">
				<div id="map"style="width: 100%; height: 100%; position: relative; overflow: hidden;">
				</div>
				<div class="hAddr">
					<span class="title">지도중심기준 행정동 주소정보</span> <span id="centerAddr"></span>
				</div>
				<ul id="category">
					<li id="catecon0" onclick="changeMarker('cleaning')"><span
						class="category_bg cleaning" title="청소해주기"></span></li>
					<li id="catecon1" onclick="changeMarker('delivery')"><span
						class="category_bg delivery" title="물건배달해주기"></span></li>
					<li id="catecon2" onclick="changeMarker('shopping')"><span
						class="category_bg shopping" title="쇼핑해주기"></span></li>
					<li id="catecon3" onclick="changeMarker('keeping')"><span
						class="category_bg keeping" title="물건보관해주기"></span></li>
					<li id="catecon4" onclick="changeMarker('lineup')"><span
						class="category_bg lineup" title="줄서주기"></span></li>
					<li id="catecon5" onclick="changeMarker('care')"><span
						class="category_bg care" title="돌봐주기"></span></li>
					<li id="catecon6" onclick="changeMarker('cosplay')"><span
						class="category_bg cosplay" title="역할대행해주기"></span></li>
					<li id="catecon7" onclick="changeMarker('professional')"><span
						class="category_bg professional" title="전문가비지니스"></span></li>
					<li id="catecon8" onclick="changeMarker('moving')"><span
						class="category_bg moving" title="물건옮겨주기"></span></li>
				</ul>
				<div class="mylocbg" id="mylocbg" onclick="myloc();" title="내위치"><img src="/danim/resources/img/myloc3.png" alt="" id="myloc"></div>
			</div>

			<!-- row -->
			<div class="row">

				<!-- main blog -->
				<div id="" class="col-md-9">
					<div id="main1"></div>
					<div id="main2"></div>
				</div>
				<!-- /main blog -->

				<!-- aside blog -->
				<div id="aside" class="col-md-3">

					<!-- search widget -->
					<div class="widget search-widget">
						<div >
							<input id="searchinput" class="input" type="text" name="searchname" placeholder="검색">
							<button type="submit">
								<!-- <i class="fa fa-search"></i> -->
								<img src="/danim/resources/img/search-icon.png" alt="" style="margin-bottom:3px;">
							</button>
						</div>
						<br> <a class="main-button icon-button pull-right" href="inserthelperview.do"
							style="width: 100%; text-align: center;">다님이 등록하기</a><br>
					</div>
					<!-- /search widget -->

					<!-- category widget -->
					<div class="widget category-widget" id="helpcategory">
						<h3>카테고리</h3>
						<a class="category" onclick="paging(1,null,null);">등록된전체심부름<span class="yellowlabelyj">${allcount}</span></a> 
						<a class="category" onclick="paging(1,null,'청소해주기');">청소해주기<span class="yellowlabelyj">${helpcount.cleaningnum}</span></a> 
						<a class="category" onclick="paging(1,null,'물건배달해주기');">물건배달해주기<span class="yellowlabelyj">${helpcount.deliverynum}</span></a> 
						<a class="category" onclick="paging(1,null,'쇼핑해주기');">쇼핑해주기<span class="yellowlabelyj">${helpcount.shoppingnum}</span></a> 
						<a class="category" onclick="paging(1,null,'물건보관해주기');">물건보관해주기<span class="yellowlabelyj">${helpcount.keepingnum}</span></a> 
						<a class="category" onclick="paging(1,null,'줄서주기');">줄서주기<span class="yellowlabelyj">${helpcount.lineupnum}</span></a> 
						<a class="category" onclick="paging(1,null,'돌봐주기');">돌봐주기<span class="yellowlabelyj">${helpcount.carenum}</span></a> 
                        <a class="category" onclick="paging(1,null,'역할대행해주기');">역할대행해주기<span class="yellowlabelyj">${helpcount.cosplaynum}</span></a> 
                        <a class="category" onclick="paging(1,null,'전문가/비지니스');">전문가/비지니스<span class="yellowlabelyj">${helpcount.professionalnum}</span></a> 
                        <a class="category" onclick="paging(1,null,'물건옮겨주기');">물건옮겨주기<span class="yellowlabelyj">${helpcount.movingnum}</span></a>
					</div>
					<!-- /category widget -->

					<!-- posts widget -->

					<!-- /posts widget -->

					
					<!-- tags widget -->
					<div class="widget tags-widget">
						<h3>추천 검색 태그</h3>
						<c:forEach items="${tuijian}" var="tag">
						<a class="tag" onclick="paging(1,'${tag}',null);">${tag}</a>
						</c:forEach>
					</div>
					<!-- /tags widget -->
					<br><br><br><br><br><br><br><br><br><br><br>
									
				</div>
				<!-- /aside blog -->

			</div>
			<!-- row -->

		</div>
		<!-- container -->

	</div>
	<!-- /Blog -->

	<!-- Footer -->
		<c:import url="../headfoot/footer.jsp" />
		<!-- /Footer -->

	<!-- preloader -->
	<div id='preloader'>
		<div class='preloader'></div>
	</div>
	<!-- /preloader -->

	<c:set var="count" value="0" />

	<!-- jQuery Plugins -->
	<script type="text/javascript" src="/danim/resources/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="/danim/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/danim/resources/js/main.js"></script>
	<script>
		// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
		var placeOverlay = new kakao.maps.CustomOverlay({
			zIndex : 1
		}), contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
		markers = [], // 마커를 담을 배열입니다
		currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(map);

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 6
		// 지도의 확대 레벨 
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		//                                마커-이미지
		//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		var startSrc = '/danim/resources/img/radio1.gif', // 출발 마커이미지의 주소입니다    
		/*startSize = new kakao.maps.Size(30, 44), // 출발 마커이미지의 크기입니다 
		startOption = {
		    offset: new kakao.maps.Point(16.5, 44) // 출발 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
		};*/
		startSize = new kakao.maps.Size(60, 60), // 출발 마커이미지의 크기입니다 
		startOption = {
			offset : new kakao.maps.Point(30, 30)
		// 출발 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
		};
		var wardimage = new kakao.maps.MarkerImage(startSrc, startSize,
				startOption);

		// 커스텀 오버레이 컨텐츠를 설정합니다
		placeOverlay.setContent(contentNode);

		// 각 카테고리에 클릭 이벤트를 등록합니다
		/*   addCategoryClickEvent(); */

/* 		// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
		function addEventHandle(target, type, callback) {
			if (target.addEventListener) {
				target.addEventListener(type, callback);
			} else {
				target.attachEvent('on' + type, callback);
			}
		} */

/* 		// 각 카테고리에 클릭 이벤트를 등록합니다
		  function addCategoryClickEvent() {
		      var category = document.getElementById('category'),
		          children = category.children;

		      for (var i = 0; i < children.length; i++) {
		          children[i].onclick = onClickCategory;
		      }
		  } */


/* 		  // 카테고리를 클릭했을 때 호출되는 함수입니다
		  function onClickCategory() {
		      var id = this.id,
		          className = this.className;

		      placeOverlay.setMap(null);
		      if (className === 'click') {
		          currCategory = ''; //class에들어있던 on속석을 다시 없애줌
		          changeCategoryClass();
		          removeMarker();
		      } else {
		          currCategory = id;
		          changeCategoryClass(this);

		      }
		  }
 */
/* 		  // 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
		  function changeCategoryClass(el) {
		      var category = document.getElementById('category'),
		          children = category.children;

		      for (var i = 0; i < children.length; i++) {
		          children[i].className = '';
		      }

		      if (el) {
		          el.className = 'click';
		      }
		  } */

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		//                                주소-좌표
		//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
		infowindow = new kakao.maps.InfoWindow({
			zindex : 1
		}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);

		// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', function() {
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});

		function searchAddrFromCoords(coords, callback) {
			// 좌표로 행정동 주소 정보를 요청합니다
			geocoder.coord2RegionCode(coords.getLng(), coords.getLat(),
					callback);
		}

		function searchDetailAddrFromCoords(coords, callback) {
			// 좌표로 법정동 상세 주소 정보를 요청합니다
			geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}

		// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
		function displayCenterInfo(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				var infoDiv = document.getElementById('centerAddr');

				for (var i = 0; i < result.length; i++) {
					// 행정동의 region_type 값은 'H' 이므로
					if (result[i].region_type !== 'H') {
						infoDiv.innerHTML = result[i].address_name;

						break;
					}
				}
			}
		}
		
		var geolat;
		var geolng;

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

				var locPosition = new kakao.maps.LatLng(lat, lng); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다

				// 마커와 인포윈도우를 표시합니다
				displayMarker(locPosition);
				
				geolat=lat;
				geolng=lng;

			});

		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

			var locPosition = new kakao.maps.LatLng(33.450701, 126.570667);

			displayMarker(locPosition);
		}
		// 지도에 마커와 인포윈도우를 표시하는 함수입니다
		function displayMarker(locPosition) {

			marker = new kakao.maps.Marker({
				map : map,
				position : locPosition,
				image : wardimage

			});

			marker.setPosition(locPosition);

			// 지도 중심좌표를 접속위치로 변경합니다
			map.setCenter(locPosition);
		}

		// 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
		function createMarkerImage(src, size, options) {
			/* console.log("createMarkerImage.src : " + src);
			console.log("createMarkerImage.size : " + size);
			console.log("createMarkerImage.options.origin : " + options.spriteOrigin);
			console.log("createMarkerImage.options.size : " + options.spriteSize); */
			var markerImage = new kakao.maps.MarkerImage(src, size, options);
			return markerImage;
		}

		// 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
		function createMarker(position, image) {
			/* console.log("createMarker.position : " + position);
			console.log("createMarker.image.src : " + JSON.stringify(image)); */
			var marker2 = new kakao.maps.Marker({
				position : position,
				image : image
			});
			return marker2;
		}

		var markerImageSrc = '/danim/resources/img/wardimgsetnosh_v6.png';

		var cleaning = [], delivery = [], shopping = [], keeping = [], lineup = [], care = [], cosplay = [], professional = [], moving = [];

		var cleaningPositions = [], deliveryPositions = [], shoppingPositions = [], keepingPositions = [], lineupPositions = [], carePositions = [], cosplayPositions = [], professionalPositions = [], movingPositions = [];

		function ready() {
			<c:forEach items="${helplist}" var="help" >
			create("${help.category}", "${help.helptitle}",
					"${help.roadaddress}", Number("${help.locationcodelat}"),
					Number("${help.locationcodelng}"), Number("${help.pay}"),
					markerImageSrc);
			</c:forEach>
		};

		function create(category, title, add, lat, lng, pay, src) {

			if (category == '청소해주기') {
				cleaningPositions.push(new kakao.maps.LatLng(lat, lng));
			} else if (category == '물건배달해주기') {
				deliveryPositions.push(new kakao.maps.LatLng(lat, lng));
			} else if (category == '쇼핑해주기') {
				shoppingPositions.push(new kakao.maps.LatLng(lat, lng));
			} else if (category == '물건보관해주기') {
				keepingPositions.push(new kakao.maps.LatLng(lat, lng));
			} else if (category == '줄서주기') {
				lineupPositions.push(new kakao.maps.LatLng(lat, lng));
			} else if (category == '돌봐주기') {
				carePositions.push(new kakao.maps.LatLng(lat, lng));
			} else if (category == '역할대행해주기') {
				cosplayPositions.push(new kakao.maps.LatLng(lat, lng));
			} else if (category == '전문가비지니스') {
				professionalPositions.push(new kakao.maps.LatLng(lat, lng));
			} else if (category == '물건옮겨주기') {
				movingPositions.push(new kakao.maps.LatLng(lat, lng));
			}
		}

		function allMarkers(data){
			cleaningMarkers(data);
			deliveryMarkers(data);
			shoppingMarkers(data);
			keepingMarkers(data);
			lineupMarkers(data);
			careMarkers(data);
			cosplayMarkers(data);
			professionalMarkers(data);
			movingMarkers(data);
		};
		
		ready();

		createCleaningMarkers();
		createDeliveryMarkers();
		createShoppingMarkers();
		createKeepingMarkers();
		createLineupMarkers();
		createCareMarkers();
		createCosplayMarkers();
		createProfessionalMarkers();
		createMovingMarkers();
		

		changeMarker('all'); // 지도에 마커가 보이도록 설정합니다 

		
		
		

		function createCleaningMarkers() {

			for (var i = 0; i < cleaningPositions.length; i++) {

				var imageSize = new kakao.maps.Size(30, 34), imageOptions = {
					spriteOrigin : new kakao.maps.Point(4, 6),
					spriteSize : new kakao.maps.Size(147, 219)
				};

				// 마커이미지와 마커를 생성합니다
				var markerImage = createMarkerImage(markerImageSrc, imageSize,
						imageOptions), marker = createMarker(
						cleaningPositions[i], markerImage);

				// 생성된 마커를 청소하기 마커 배열에 추가합니다
				cleaning.push(marker);
			}
		}

		// 청소하기 마커들의 지도 표시 여부를 설정하는 함수입니다
		function cleaningMarkers(map) {
			for (var i = 0; i < cleaning.length; i++) {
				cleaning[i].setMap(map);
			}
		}

		// 물건배달 마커를 생성하고 물건배달 마커 배열에 추가하는 함수입니다
		function createDeliveryMarkers() {
			for (var i = 0; i < deliveryPositions.length; i++) {

				var imageSize = new kakao.maps.Size(30, 34), imageOptions = {
					spriteOrigin : new kakao.maps.Point(42, 6),
					spriteSize : new kakao.maps.Size(147, 219)
				};

				// 마커이미지와 마커를 생성합니다
				var markerImage = createMarkerImage(markerImageSrc, imageSize,
						imageOptions), marker = createMarker(
						deliveryPositions[i], markerImage);

				// 생성된 마커를 물건배달 마커 배열에 추가합니다
				delivery.push(marker);
			}
		}

		// 물건배달 마커들의 지도 표시 여부를 설정하는 함수입니다
		function deliveryMarkers(map) {
			for (var i = 0; i < delivery.length; i++) {
				delivery[i].setMap(map);
			}
		}

		// 쇼핑하기 마커를 생성하고 쇼핑하기 마커 배열에 추가하는 함수입니다
		function createShoppingMarkers() {
			for (var i = 0; i < shoppingPositions.length; i++) {

				var imageSize = new kakao.maps.Size(30, 34), imageOptions = {
					spriteOrigin : new kakao.maps.Point(4, 49),
					spriteSize : new kakao.maps.Size(147, 219)
				};

				// 마커이미지와 마커를 생성합니다
				var markerImage = createMarkerImage(markerImageSrc, imageSize,
						imageOptions), marker = createMarker(
						shoppingPositions[i], markerImage);

				// 생성된 마커를 쇼핑하기 마커 배열에 추가합니다
				shopping.push(marker);
			}
		}

		// 쇼핑하기 마커들의 지도 표시 여부를 설정하는 함수입니다
		function shoppingMarkers(map) {
			for (var i = 0; i < shopping.length; i++) {
				shopping[i].setMap(map);
			}
		}
		// 보관하기 마커를 생성하고 보관하기 마커 배열에 추가하는 함수입니다
		function createKeepingMarkers() {
			for (var i = 0; i < keepingPositions.length; i++) {

				var imageSize = new kakao.maps.Size(30, 34), imageOptions = {
					spriteOrigin : new kakao.maps.Point(42, 49),
					spriteSize : new kakao.maps.Size(147, 219)
				};

				// 마커이미지와 마커를 생성합니다
				var markerImage = createMarkerImage(markerImageSrc, imageSize,
						imageOptions), marker = createMarker(
						keepingPositions[i], markerImage);

				// 생성된 마커를 보관하기 마커 배열에 추가합니다
				keeping.push(marker);
			}
		}

		// 보관하기 마커들의 지도 표시 여부를 설정하는 함수입니다
		function keepingMarkers(map) {
			for (var i = 0; i < keeping.length; i++) {
				keeping[i].setMap(map);
			}
		}
		// 줄서기 마커를 생성하고 줄서기 마커 배열에 추가하는 함수입니다
		function createLineupMarkers() {
			for (var i = 0; i < lineupPositions.length; i++) {

				var imageSize = new kakao.maps.Size(30, 34), imageOptions = {
					spriteOrigin : new kakao.maps.Point(4, 92),
					spriteSize : new kakao.maps.Size(147, 219)
				};

				// 마커이미지와 마커를 생성합니다
				var markerImage = createMarkerImage(markerImageSrc, imageSize,
						imageOptions), marker = createMarker(
						lineupPositions[i], markerImage);

				// 생성된 마커를 줄서기 마커 배열에 추가합니다
				lineup.push(marker);
			}
		}

		// 줄서기 마커들의 지도 표시 여부를 설정하는 함수입니다
		function lineupMarkers(map) {
			for (var i = 0; i < lineup.length; i++) {
				lineup[i].setMap(map);
			}
		}
		// 돌봐주기 마커를 생성하고 돌봐주기 마커 배열에 추가하는 함수입니다
		function createCareMarkers() {
			for (var i = 0; i < carePositions.length; i++) {

				var imageSize = new kakao.maps.Size(30, 34), imageOptions = {
					spriteOrigin : new kakao.maps.Point(42, 92),
					spriteSize : new kakao.maps.Size(147, 219)
				};

				// 마커이미지와 마커를 생성합니다
				var markerImage = createMarkerImage(markerImageSrc, imageSize,
						imageOptions), marker = createMarker(carePositions[i],
						markerImage);

				// 생성된 마커를 돌봐주기 마커 배열에 추가합니다
				care.push(marker);
			}
		}

		// 돌봐주기 마커들의 지도 표시 여부를 설정하는 함수입니다
		function careMarkers(map) {
			for (var i = 0; i < care.length; i++) {
				care[i].setMap(map);
			}
		}
		// 역할대행 마커를 생성하고 역할대행 마커 배열에 추가하는 함수입니다
		function createCosplayMarkers() {
			for (var i = 0; i < cosplayPositions.length; i++) {

				var imageSize = new kakao.maps.Size(30, 34), imageOptions = {
					spriteOrigin : new kakao.maps.Point(4, 135),
					spriteSize : new kakao.maps.Size(147, 219)
				};

				// 마커이미지와 마커를 생성합니다
				var markerImage = createMarkerImage(markerImageSrc, imageSize,
						imageOptions), marker = createMarker(
						cosplayPositions[i], markerImage);

				// 생성된 마커를 역할대행 마커 배열에 추가합니다
				cosplay.push(marker);
			}
		}

		// 역할대행 마커들의 지도 표시 여부를 설정하는 함수입니다
		function cosplayMarkers(map) {
			for (var i = 0; i < cosplay.length; i++) {
				cosplay[i].setMap(map);
			}
		}
		// 전문가 마커를 생성하고 전문가 마커 배열에 추가하는 함수입니다
		function createProfessionalMarkers() {
			for (var i = 0; i < professionalPositions.length; i++) {

				var imageSize = new kakao.maps.Size(30, 34), imageOptions = {
					spriteOrigin : new kakao.maps.Point(42, 135),
					spriteSize : new kakao.maps.Size(147, 219)
				};

				// 마커이미지와 마커를 생성합니다
				var markerImage = createMarkerImage(markerImageSrc, imageSize,
						imageOptions), marker = createMarker(
						professionalPositions[i], markerImage);

				// 생성된 마커를 전문가 마커 배열에 추가합니다
				professional.push(marker);
			}
		}

		// 전문가 마커들의 지도 표시 여부를 설정하는 함수입니다
		function professionalMarkers(map) {
			for (var i = 0; i < professional.length; i++) {
				professional[i].setMap(map);
			}
		}
		// 물건옮기기 마커를 생성하고 편의점 마커 배열에 추가하는 함수입니다
		function createMovingMarkers() {
			for (var i = 0; i < movingPositions.length; i++) {

				var imageSize = new kakao.maps.Size(30, 34), imageOptions = {
					spriteOrigin : new kakao.maps.Point(4, 178),
					spriteSize : new kakao.maps.Size(147, 219)
				};

				// 마커이미지와 마커를 생성합니다
				var markerImage = createMarkerImage(markerImageSrc, imageSize,
						imageOptions), marker = createMarker(
						movingPositions[i], markerImage);

				// 생성된 마커를 물건옮기기 마커 배열에 추가합니다
				moving.push(marker);
			}
		}

		// 물건옮기기 마커들의 지도 표시 여부를 설정하는 함수입니다
		function movingMarkers(map) {
			for (var i = 0; i < moving.length; i++) {
				moving[i].setMap(map);
			}
		}
		
		function myloc(){
			map.setLevel(6);
			map.panTo(new kakao.maps.LatLng(geolat,geolng));
        }
		
		// 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
		function changeMarker(type) {

			var cleaning = document.getElementById('catecon0');
			var delivery = document.getElementById('catecon1');
			var shopping = document.getElementById('catecon2');
			var keeping = document.getElementById('catecon3');
			var lineup = document.getElementById('catecon4');
			var care = document.getElementById('catecon5');
			var cosplay = document.getElementById('catecon6');
			var professional = document.getElementById('catecon7');
			var moving = document.getElementById('catecon8');

			if (type === 'all') { //모든 카테고리가 선택됬을때

				cleaning.className = 'menu_selected';
				delivery.className = 'menu_selected';
				shopping.className = 'menu_selected';
				keeping.className = 'menu_selected';
				lineup.className = 'menu_selected';
				care.className = 'menu_selected';
				cosplay.className = 'menu_selected';
				professional.className = 'menu_selected';
				moving.className = 'menu_selected';

				allMarkers(map);

			}else if (type === 'cleaning') { //청소 카테고리가 선택됬을때
				if(cleaning.className=='menu_selected click'){
					cleaning.className='';
					allMarkers(map);
				}else{
				// 선택된 카테고리를 선택된 스타일로 변경하고
					cleaning.className = 'menu_selected click';
					allMarkers(null);
					cleaningMarkers(map);
				}
				// 나머지 카테고리는 선택되지 않은 스타일로 바꿉니다
				delivery.className = '';
				shopping.className = '';
				keeping.className = '';
				lineup.className = '';
				care.className = '';
				cosplay.className = '';
				professional.className = '';
				moving.className = '';

				

			} else if (type === 'delivery') { // 배달 카테고리가 클릭됐을 때
				if(delivery.className=='menu_selected click'){
					delivery.className='';
					allMarkers(map);
				}else{
				// 선택된 카테고리를 선택된 스타일로 변경하고
					delivery.className = 'menu_selected click';
					allMarkers(null);
					deliveryMarkers(map);
					
				}
				cleaning.className = '';
				shopping.className = '';
				keeping.className = '';
				lineup.className = '';
				care.className = '';
				cosplay.className = '';
				professional.className = '';
				moving.className = '';

			} else if (type === 'shopping') { // 쇼핑 카테고리가 클릭됐을 때

				cleaning.className = '';
				delivery.className = '';
				keeping.className = '';
				lineup.className = '';
				care.className = '';
				cosplay.className = '';
				professional.className = '';
				moving.className = '';
				
				if(shopping.className=='menu_selected click'){
					shopping.className='';
					allMarkers(map);
				}else{
				// 선택된 카테고리를 선택된 스타일로 변경하고
					shopping.className = 'menu_selected click';
					allMarkers(null);
					shoppingMarkers(map);
                }
			} else if (type === 'keeping') { // 보관 카테고리가 클릭됐을 때

				cleaning.className = '';
				delivery.className = '';
				shopping.className = '';
				lineup.className = '';
				care.className = '';
				cosplay.className = '';
				professional.className = '';
				moving.className = '';

				if(keeping.className=='menu_selected click'){
					keeping.className='';
					allMarkers(map);
				}else{
				// 선택된 카테고리를 선택된 스타일로 변경하고
					keeping.className = 'menu_selected click';
					allMarkers(null);
					keepingMarkers(map);
					
				}
			} else if (type === 'lineup') { // 줄서기 카테고리가 클릭됐을 때

				cleaning.className = '';
				delivery.className = '';
				shopping.className = '';
				keeping.className = '';
				care.className = '';
				cosplay.className = '';
				professional.className = '';
				moving.className = '';

				if(lineup.className=='menu_selected click'){
					lineup.className='';
					allMarkers(map);
				}else{
				// 선택된 카테고리를 선택된 스타일로 변경하고
					lineup.className = 'menu_selected click';
					allMarkers(null);
					lineupMarkers(map);
					
				}
			} else if (type === 'care') { // 돌봐주기 카테고리가 클릭됐을 때

				cleaning.className = '';
				delivery.className = '';
				shopping.className = '';
				keeping.className = '';
				lineup.className = '';
				cosplay.className = '';
				professional.className = '';
				moving.className = '';

				if(care.className=='menu_selected click'){
					care.className='';
					allMarkers(map);
				}else{
				// 선택된 카테고리를 선택된 스타일로 변경하고
					care.className = 'menu_selected click';
					allMarkers(null);
					careMarkers(map);
					
				}
			} else if (type === 'cosplay') { // 역할대행 카테고리가 클릭됐을 때

				cleaning.className = '';
				delivery.className = '';
				shopping.className = '';
				keeping.className = '';
				lineup.className = '';
				care.className = '';
				professional.className = '';
				moving.className = '';

				if(cosplay.className=='menu_selected click'){
					cosplay.className='';
					allMarkers(map);
				}else{
				// 선택된 카테고리를 선택된 스타일로 변경하고
					cosplay.className = 'menu_selected click';
					allMarkers(null);
					cosplayMarkers(map);
					
				}
			} else if (type === 'professional') { // 전문 카테고리가 클릭됐을 때

				cleaning.className = '';
				delivery.className = '';
				shopping.className = '';
				keeping.className = '';
				lineup.className = '';
				care.className = '';
				cosplay.className = '';
				moving.className = '';

				if(professional.className=='menu_selected click'){
					professional.className='';
					allMarkers(map);
				}else{
				// 선택된 카테고리를 선택된 스타일로 변경하고
					professional.className = 'menu_selected click';
					allMarkers(null);
					professionalMarkers(map);
				}
			} else if (type === 'moving') { // 물건옮기기 카테고리가 클릭됐을 때

				cleaning.className = '';
				delivery.className = '';
				shopping.className = '';
				keeping.className = '';
				lineup.className = '';
				care.className = '';
				cosplay.className = '';
				professional.className = '';

				if(moving.className=='menu_selected click'){
					moving.className='';
					allMarkers(map);
				}else{
				// 선택된 카테고리를 선택된 스타일로 변경하고
					moving.className = 'menu_selected click';
					allMarkers(null);
					movingMarkers(map);
				}
			}
		};

		
	</script>
</body>

</html>
