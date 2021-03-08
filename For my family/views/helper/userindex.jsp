<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <title>다님: 효율적인 삶의 시작</title>

    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Lato:700%7CMontserrat:400,600" rel="stylesheet">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="/danim/resources/css/bootstrap.min.css" />

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="/danim/resources/css/font-awesome.min.css">

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="/danim/resources/css/style.css" />
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <!-- Custom youngjun's stlylesheet -->
	<link type="text/css" rel="stylesheet" href="/danim/resources/css/yjstyle.css" />
	<!-- services 라이브러리 불러오기 -->
	<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8944cc8da7a96ff282ca5347ffa73acd&libraries=services,clusterer,drawing"></script>
    
    <script>
    
    
      /*   setTimeout("history.go(0);", 10000); //10초마다 새로고침 */


        function logout() {
            alert("로그아웃 되었습니다.");
            location.href = "logout.do";
        }
        function blackstatus(){
            var black = $("#black").val();
                if(black == 'Y'){
                    alert("차단된 계정 입니다. 고객센터로 문의 바랍니다. tel)010-2565-3871");
                    location.href="logout.do";
                }
        }
        
	</script>
    <!-- <script type="text/javascript" src="/danim/resources/js/yjgeomap.js"></script> -->
    <script>
  	//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	//  내위치좌표
	//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();



	//경도위도의 초기값 설정(위치정보 차단시)
	var lng = 127.0292, lat = 37.4923;
	if (navigator.geolocation) {
		// GeoLocation을 이용해서 접속 위치를 얻어옵니다

		navigator.geolocation.getCurrentPosition(function(
				position) {
			lat = position.coords.latitude, // 위도
			lng = position.coords.longitude;
			console.log(lng, lat);
		});

	}

	function searchDetailAddrFromCoords(lng, lat, callback) {
		// 좌표로 법정동 상세 주소 정보를 요청합니다
		geocoder.coord2Address(lng, lat, callback);
	}

	function sendloc() {

		searchDetailAddrFromCoords(lng, lat, function(result,
				status) {
			if (status === kakao.maps.services.Status.OK) {
				var detailAddr = result[0].road_address;

				if (detailAddr == null) {
					geocoder.coord2RegionCode(lng, lat,
							displayCenterInfo2);
				} else {
					location.href = "helplist.do?lat=" + lat
							+ "&lng=" + lng + "&add="
							+ detailAddr.address_name
							+ "&loginid=${loginUser.userid}";
				}
			}
		});

		/* location.href = "helplist.do?lat=" + lat + "&lng=" + lng +"&add=" + detailAdr.address_name; */
	}

	function displayCenterInfo2(result, status) {
		if (status === kakao.maps.services.Status.OK) {
			for (var i = 0; i < result.length; i++) {
				if (result[i].region_type !== 'H') {
					location.href = "helplist.do?lat=" + lat + "&lng=" + lng + "&add=" + result[i].address_name + "&loginid=${loginUser.userid}";
					break;
				}
			}
		}
	};
	
	function help() {
		location.href = "helplistready.do?lat=" + lat + "&lng=" + lng;
	}
</script>


</head>

<body>

   	<!-- Header -->
		<c:import url="../headfoot/header.jsp" />
	<!-- /Header -->

    <!-- Hero-area -->
    <div class="hero-area section">

        <!-- Backgound Image -->
        <div class="bg-image bg-parallax overlay" style="background-image:url(/danim/resources/img/IMG_0078.jpeg)"></div>
        <!-- /Backgound Image -->

        <div class="container">
            <div class="row">
                <div class="col-md-10 col-md-offset-1 text-center">
                    <ul class="hero-area-tree">
                        <li>Danim:</li>
                    </ul>
                    <h1 class="white-text">다님이들이 대기하고 있습니다!</h1>
                </div>
                <a class="main-button icon-button pull-right thisbtnyj" style="margin-bottom: -5%;" onclick="help();">도움 주러 가기</a>

            </div>
        </div>

    </div>
    <!-- /Hero-area -->

    <!-- Blog -->
    <div id="blog" class="section">

        <!-- container -->
        <div class="container">
            <h3>내 주변 다님이</h3>
            <hr style="border-color: #fcc159;">
            <br><br>
            <!-- row -->
            <div class="row">

                <!-- main blog -->
                <div id="main" class="col-md-9">

                    <!-- row -->
					<div class="row">
						<c:forEach var="helper" items="${helperboardlist}">
							<!-- single blog -->
							<div class="col-md-6">
								<div class="single-blog">
									<div class="justify">
										<h4 class="leftfloat">
											<a href="helperdetail.do?helperno=${helper.helperno}" class="elliyj">${helper.helpertitle}</a>
										</h4>
										<div class="uiprice" style="align-self: center; white-space:nowrap">￦${helper.helperpay}원</div>
									</div>
									<div class="blog-meta">
										<span class="blog-meta-author"><a>${helper.helpercate}</a></span>
										<div class="pull-right">
											<span class="course-price course-premium verbotyj">${helper.helperloc}</span>
										</div>
									</div>
								</div>
							</div>
							<!-- /single blog -->
						</c:forEach>

					</div>
					<!-- /row -->

                    <!-- row -->
                    <div class="row">

                       <!-- pagination -->
						<div class="col-md-12">
							<div class="post-pagination">
								<%-- <c:if test="${page.currentpage gt 1 }">
									<a href="helplist.do?page=1" class="pagination-back pull-left" style="visibility:visible;">첫페이지</a>
								</c:if> --%>
								<c:choose>
								<c:when test="${(page.currentpage - page.pagelimit) lt page.startpage and (page.currentpage - page.pagelimit) ge 1 }">
									<c:if test="${searchname eq null and searchcate eq null}">
									<a href="helperlist.do?page=${page.startpage - page.pagelimit }" class="pagination-back pull-left" style="visibility:visible;">이전</a>
									</c:if>
									<c:if test="${searchname ne null }">
									<a href="helperlist.do?page=${page.startpage - page.pagelimit }&searchname=${searchname}" class="pagination-back pull-left" style="visibility:visible;">이전</a>
									</c:if>
									<c:if test="${searchcate ne null }">
									<a href="helperlist.do?page=${page.startpage - page.pagelimit }&searchcate=${searchcate}" class="pagination-back pull-left" style="visibility:visible;">이전</a>
									</c:if>
								</c:when>
								<c:otherwise>
								<a href="helperlist.do?page=${page.startpage - page.pagelimit }" class="pagination-back pull-left" style="visibility:hidden;">이전</a>
								</c:otherwise>	
								</c:choose>
								<%-- <c:if test="${searchname ne null }"></c:if>
								<c:if test="${searchcate ne null }"></c:if> --%>
								<ul class="pages">
								<c:forEach var="i" begin="${page.startpage}" end="${page.endpage}" step="1">
									<c:if test="${i eq page.currentpage}">
										<li class="active">${i}</li>
									</c:if>
									<c:if test="${i ne page.currentpage}">
										<c:if test="${searchname eq null and searchcate eq null}">
										<li class=""><a href="helperlist.do?page=${i}">${i}</a></li>
										</c:if>
										<c:if test="${searchname ne null }">
										<li class=""><a href="helperlist.do?page=${i}&searchname=${searchname}">${i}</a></li>
										</c:if>
										<c:if test="${searchcate ne null }">
										<li class=""><a href="helperlist.do?page=${i}&searchcate=${searchcate}">${i}</a></li>
										</c:if>
									</c:if>
								</c:forEach>
								</ul>
								<%-- <c:if test="${page.currentpage ne page.totalpage }">
									<a href="helperlist.do?page=${page.totalpage}" class="pagination-next pull-right" style="visibility:visible;">끝페이지</a>
								</c:if> --%>
				 				<c:choose>
									<c:when test="${(page.endpage - page.startpage) eq page.pagelimit-1 and page.totalpage ne page.endpage}">
									<c:if test="${searchname eq null and searchcate eq null}">
										<a href="helperlist.do?page=${page.endpage+1}" class="pagination-next pull-right" style="visibility:visible;">다음</a>
									</c:if>
									<c:if test="${searchname ne null }">
										<a href="helperlist.do?page=${page.endpage+1}&searchname=${searchname}" class="pagination-next pull-right" style="visibility:visible;">다음</a>
									</c:if>
									<c:if test="${searchcate ne null }">
										<a href="helperlist.do?page=${page.endpage+1}&searchcate=${searchcate}" class="pagination-next pull-right" style="visibility:visible;">다음</a>
									</c:if>
									</c:when>
									<c:otherwise>
										<a href="helperlist.do?page=${page.endpage+1}" class="pagination-next pull-right" style="visibility:hidden;">다음</a>
									</c:otherwise>	
								</c:choose>							
								<%-- <c:choose>
								<c:when test="${page.currentpage ne page.totalpage }">
								<a href="helperlist.do?page=${page.totalpage}" class="pagination-next pull-right" style="visibility:visible;">끝페이지</a>
								</c:when>
								<c:otherwise>
								<a href="helperlist.do?page=${page.totalpage}" class="pagination-next pull-right" style="visibility:hidden;">끝페이지</a>
								</c:otherwise>	
								</c:choose>	 --%>
								
								
							</div>
						</div>
						<!-- pagination -->

                    </div>
                    <!-- /row -->
                </div>
                <!-- /main blog -->

                <!-- aside blog -->

                <div id="aside" class="col-md-3">


                    <!-- search widget -->
                    <div class="widget search-widget">
                        <form>
                            <input class="input" type="text" name="searchname" placeholder="검색">
                            <button>
								<!-- <i class="fa fa-search"></i> -->
								<img src="/danim/resources/img/search-icon.png" alt="" style="margin-bottom:3px;">
							</button>
                        </form><br>
                        <a class="main-button icon-button pull-right" href="insertview.do" style="width: 100%; text-align: center;">도움 요청 작성하기</a><br>
                    </div>
                    <!-- /search widget -->

                    <!-- category widget -->
                    <div class="widget category-widget">
                        <h3>카테고리</h3>
                        <a class="category" href="helperlist.do">등록된전체다님이<span class="yellowlabelyj">${allcount}</span></a> 
                        <a class="category" href="helperlist.do?searchcate=청소해주기">청소해주기<span class="yellowlabelyj">${helpercount.cleaningnum}</span></a> 
						<a class="category" href="helperlist.do?searchcate=물건배달해주기">물건배달해주기<span class="yellowlabelyj">${helpercount.deliverynum}</span></a> 
						<a class="category" href="helperlist.do?searchcate=쇼핑해주기">쇼핑해주기<span class="yellowlabelyj">${helpercount.shoppingnum}</span></a> 
						<a class="category" href="helperlist.do?searchcate=물건보관해주기">물건보관해주기<span class="yellowlabelyj">${helpercount.keepingnum}</span></a> 
						<a class="category" href="helperlist.do?searchcate=줄서주기">줄서주기<span class="yellowlabelyj">${helpercount.lineupnum}</span></a> 
						<a class="category" href="helperlist.do?searchcate=돌봐주기">돌봐주기<span class="yellowlabelyj">${helpercount.carenum}</span></a> 
                        <a class="category" href="helperlist.do?searchcate=역할대행해주기">역할대행해주기<span class="yellowlabelyj">${helpercount.cosplaynum}</span></a> 
                        <a class="category" href="helperlist.do?searchcate=전문가비지니스">전문가/비지니스<span class="yellowlabelyj">${helpercount.professionalnum}</span></a> 
                        <a class="category" href="helperlist.do?searchcate=물건옮겨주기">물건옮겨주기<span class="yellowlabelyj">${helpercount.movingnum}</span></a>
                    </div>
                    <!-- /category widget -->

                    <!-- posts widget -->

                    <!-- /posts widget -->

                    <!-- tags widget -->
                    <div class="widget tags-widget">
						<h3>추천 검색 태그</h3>
						<c:forEach items="${tuijian}" var="tag">
						<a class="tag" href="helperlist.do?searchname=${tag}">${tag}</a>
						</c:forEach>
					</div>
                    <!-- /tags widget -->

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


    <!-- jQuery Plugins -->
    <script type="text/javascript" src="/danim/resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="/danim/resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/danim/resources/js/main.js"></script>

</body>

</html>
