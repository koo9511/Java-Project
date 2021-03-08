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
        	if(confirm("등록된 게시글을 삭제 하시겠습니까?")==true){
        		location.href="helpdelete.do?helpno=" + helpno;	
        	}
        	
        }
        
        function pop(url) {
            var img = new Image();
            img.src = url;
            
            var img_height;
            var img_width;
            
            if (img.height>=800){
	            img_height = 800;
	            img_width = img.width * 800 / img.height;
            }else{
            	img_height = img.width
            	img_widthi = img.height;
            }
            var win_width = img_width+1;
            var win_height = img_height+1;
            
            var OpenWindow = window.open('', '_blank', 'width=' + win_width + ', height=' + win_height + ', menubars=no, scrollbars=auto, status=no, resizable=no, directories=no');
            OpenWindow.document.write("<style>body{margin:0px;}</style><img src='" + url + "' style='width:"+img_width+";height:"+img_height+";'>");
            window.resizeTo( win_width,win_height );
        }
        
      function helperdelete(helperno){
      	if(confirm("등록하신 게시글을 삭제하시겠 습니까?")==true){
      		location.href="helperdelete.do?helperno=" + helperno;	
      	}
      	
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
            <h2>다님이 정보</h2>
            <hr style="border-color: #fcc159">
            <br>
            <!-- row -->
            <div class="row">
            <div class="col-md-12 mapyj">
                <div class="row">
                
                    <div class="col-md-6 row-md-6 ">

                        <div class="row myinfo-table insertinfoyj" >
                            <div class="col-md-6">
	                            <div class="row">
		                            <div class="tdyj1 yellowlabelyj col-md-6">카테고리</div>
		                            <div class="col-md-6">${helper.helpercate}</div>
								</div>
							</div>
                            <div class="col-md-6">
	                            <div class="row">
		                            <div class="tdyj1 yellowlabelyj col-md-6">만료시간</div>
		                            <div class="col-md-6">${helper.helperregisttime}</div>
								</div>
							</div>
                        </div>
                        <div class="row myinfo-table insertinfoyj">
                            <div class="col-md-6">
	                            <div class="row">
	                                <div class="tdyj1 yellowlabelyj col-md-6">닉네임</div>
	                                <div class="col-md-6">${helper.helpernickname}</div>
	                            </div>
                            </div>
                            <%-- <div class="col-md-6">
                            	<div class="row">
	                                <div class="tdyj1 yellowlabelyj col-md-6">전화번호</div>
	                                <div class="col-md-6">${helper.helperphone}</div>
	                            </div>
                            </div> --%>
                            <div class="col-md-6">
		                        <div class="row">
			                        <div class="tdyj1 yellowlabelyj col-md-6">다님가격</div>
			                        <div class="tdyj2 col-md-6 uiprice" >￦${helper.helperpay}원</div>
		                        </div>
	                        </div>
                        </div>
                        <div class="row myinfo-table insertinfoyj">
                        	<div class="col-md-6">
		                        <div class="row">
			                        <div class="tdyj1 yellowlabelyj col-md-6">다님지역</div>
			                        <div class="tdyj2 col-md-6">${helper.helperloc}</div>
		                        </div>
	                        </div>
	                        <!-- <div class="col-md-6">
		                        <div class="row">
			                        <div class="tdyj1 yellowlabelyj col-md-6">매칭방식</div>
			                        <div class="tdyj2 col-md-6">직접연락</div>
		                        </div>
	                        </div> -->
	                        <div class="col-md-6">
		                        <div class="row">
			                        <div class="tdyj1 yellowlabelyj col-md-6">결제방식</div>
			                        <div class="tdyj2 col-md-6">${helper.helperpaym}</div>
		                        </div>
	                        </div>
                        </div>
                        
                    </div>
                    <div class="col-md-6 row-md-6 " >
                    <div class="row">
                               <div class="col-xs-6 " >
                                    <label for="helptitle" class="tdyj1 yellowlabelyj" >등급</label>



                                    <div style="text-align: center;" class="row justify-content-md-center">
                                        <c:if test="${helper.helperreview ge 0 and helper.helperreview lt 1}">
                                            <div style=" text-align: center;" class="">
                                               <div>
                                                <img src="/danim/resources/img/e2.png" class="grade-rank" style="width: 40%;" />
                                                </div>
                                                <a class="yellowlabelyj" style="font-size: 15px;">0.5</a>
                                                <div>
                                                <img src="/danim/resources/img/1p.png" class="grade-point" style="width: 40%;" />
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${helper.helperreview ge 1 and helper.helperreview lt 1.5}">
                                            <div style=" text-align: center;" class="">
                                               <div>
                                                <img src="/danim/resources/img/d2.png" class="grade-rank" style="width: 40%;" />
                                                </div>
                                                <a class="yellowlabelyj" style="font-size: 15px;">1.0</a>
                                                <div>
                                                <img src="/danim/resources/img/2p.png" class="grade-point" style="width: 40%;" />
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${helper.helperreview ge 1.5 and helper.helperreview lt 2}">
                                            <div style=" text-align: center;" class="">
                                               <div>
                                                <img src="/danim/resources/img/d1.png" class="grade-rank" style="width: 40%;" />
                                                </div>
                                                <a class="yellowlabelyj" style="font-size: 15px;">1.5</a>
                                                <div>
                                                <img src="/danim/resources/img/3p.png" class="grade-point" style="width: 40%;" />
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${helper.helperreview ge 2 and helper.helperreview lt 2.5}">
                                            <div style=" text-align: center;" class="">
                                               <div>
                                                <img src="/danim/resources/img/c2.png" class="grade-rank" style="width: 40%;" />
                                                </div>
                                                <a class="yellowlabelyj" style="font-size: 15px;">2.0</a>
                                                <div>
                                                <img src="/danim/resources/img/4p.png" class="grade-point" style="width: 40%;" />
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${helper.helperreview ge 2.5 and helper.helperreview lt 3}">
                                            <div style=" text-align: center;" class="">
                                               <div>
                                                <img src="/danim/resources/img/c1.png" class="grade-rank" style="width: 40%;" />
                                                </div>
                                                <a class="yellowlabelyj" style="font-size: 15px;">2.5</a>
                                                <div>
                                                <img src="/danim/resources/img/5p.png" class="grade-point" style="width: 40%;" />
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${helper.helperreview ge 3 and helper.helperreview lt 3.5}">
                                            <div style=" text-align: center;" class="">
                                               <div>
                                                <img src="/danim/resources/img/b2.png" class="grade-rank" style="width: 40%;" />
                                                </div>
                                                <a class="yellowlabelyj" style="font-size: 15px;">3.0</a>
                                                <div>
                                                <img src="/danim/resources/img/6p.png" class="grade-point" style="width: 40%;" />
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${helper.helperreview ge 3.5 and helper.helperreview lt 4}">
                                            <div style=" text-align: center;" class="">
                                               <div>
                                                <img src="/danim/resources/img/b1.png" class="grade-rank" style="width: 40%;" />
                                                </div>
                                                <a class="yellowlabelyj" style="font-size: 15px;">3.5</a>
                                                <div>
                                                <img src="/danim/resources/img/7p.png" class="grade-point" style="width: 40%;" />
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${helper.helperreview ge 4 and helper.helperreview lt 4.5}">
                                            <div style=" text-align: center;" class="">
                                               <div>
                                                <img src="/danim/resources/img/a2.png" class="grade-rank" style="width: 40%;" />
                                                </div>
                                                <a class="yellowlabelyj" style="font-size: 15px;">4.0</a>
                                                <div>
                                                <img src="/danim/resources/img/8p.png" class="grade-point" style="width: 40%;" />
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${helper.helperreview ge 4.5 and helper.helperreview lt 5}">
                                            <div style=" text-align: center;" class="">
                                               <div>
                                                <img src="/danim/resources/img/a1.png" class="grade-rank" style="width: 40%;" />
                                                </div>
                                                <a class="yellowlabelyj" style="font-size: 15px;">4.5</a>
                                                <div>
                                                <img src="/danim/resources/img/9p.png" class="grade-point" style="width: 40%;" />
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${helper.helperreview eq 5}">
                                            <div style=" text-align: center;" class="">
                                               <div>
                                                <img src="/danim/resources/img/sp1.gif" class="grade-rank" style="width: 40%;" />
                                                </div>
                                                <a class="yellowlabelyj" style="font-size: 15px;">5.0</a>
                                                <div>
                                                <img src="/danim/resources/img/10p.png" class="grade-point" style="width: 40%;" />
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                   
                                    <!-- /row -->
                                    
                                </div>
                                <div class="col-xs-6">
                                <label for="danimcount" class="tdyj1 yellowlabelyj">다님완료횟수</label>
                                <div class="tdyj2 row " id="danimcount" style="text-align: center; margin-top: 20px;"><div style="font-size: 60pt;" class=" yellowlabelyj" >${helper.helpercount}</div></div>
                            </div>
                    	</div>
                    </div>
                    
                   
                    
                    
                    <div class="col-md-12">
	                    <div class="row">
							<div class="col-md-6 tdyj1 yellowlabelyj">다님제목</div>
		                    <div class="col-md-6 tdyj2" id="helptitle" style="margin-bottom: 40px;">${helper.helpertitle}</div>
	                    </div>
                    <label for="contents" class="tdyj1 yellowlabelyj">다님내용</label>
                    <div class="tdyj2" id="contents" style="margin-bottom:40px; float: left;-ms-overflow-style:none; width: 100%;"><span>${helper.helpercontents}</span></div>
                    </div>
                    

                    <c:if test="${!empty helper.helperimage}">
                <div class="col-md-12 tryj uploadwindowyj input-field" style="margin-bottom: 10px; margin-top: 20px;">
                        <div class="inputimageyj input-images-1" id="uploader" style="border:none;">
                    	<label for="hasfile" class="tdyj1 yellowlabelyj">다님이미지</label>
                           <div class="image-uploader has-files" id="hasfile">
                                   <div class="uploaded" style="margin: 0px;">
                                  
                                  	<c:forEach var="img" items="${rname}">
                                  	<%-- <input type="hidden" value="${img}" id="image22"> --%>
                                  		<div class="uploaded-image" name="image" id="image" style="margin:0; margin-bottom:0.3rem;"><img src="${img}" class="img" onclick="pop(this.src)"></div>
                                  	</c:forEach>
                        
									</div>
                               </div>
                        </div>
                </div>
               </c:if>
               <br> <br>
                    <!-- /row -->
                    <c:if test="${helper.helperid eq loginUser.userid }">
                    <div class="pull-right">
	                    <a class="main-button icon-button enrollbutton" href="helperupdateview.do?helperno=${helper.helperno}" type="submit" style="margin-right:20px;">수정하기</a>
	                    <a class="main-button icon-button enrollbutton" onclick="helperdelete(${helper.helperno})" style="cursor:pointer;">삭제하기</a>
                    </div>
                    </c:if>
                    </div>
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
