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
    <title>다님: 매칭페이지</title>
    <style>
    
        body div .row{
          /*  border: 1px solid red;*/
        }
    </style>

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

        function helpdelete(helpno) {
            if (confirm("등록된 게시글을 삭제하시겠 습니까?") == true) {
                location.href = "helpdelete.do?helpno=" + helpno;
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


        function cancel() {
            
        	$.ajax({
        		url:"cancelstatus.do",
        		data:{id:'${loginUser.userid}',
        				helpno:${help.helpno}},
        		type:'POST',
        		success: function(str){
            			if(str == "A"){
            				if (confirm("매칭 취소요청을 하시겠습니까?(매칭취소시 다님코인 한개가 지불됩니다.)") == true){
	            				$.ajax({
            						url:"cancelstatusupdate.do",
            						data:{id:'${loginUser.userid}',
                        				helpno:${help.helpno}},
                                		type:'POST',
                                		success: function(str){
                                			var btnstr = "<a class='main-button icon-button curonyj' onclick='cancel();' style='white-space:nowrap; background-color:#EBEBEB; z-index: 2;margin-bottom: 40px;margin-top: 40px; margin-right:20px;' >취소대기중</a>";
            	            				$('#cancelbtn').html(btnstr);
                                		}
            					});
            				}else{
            					return;
            				}
            			}else if(str=="B"){
            				if (confirm("이미 취소신청하셨습니다. 신청을 취소할까요?") == true){
            					$.ajax({
            						url:"cancelstatusupdate.do",
            						data:{id:'${loginUser.userid}',
                        				helpno:${help.helpno}},
                                		type:'POST',
                                		success: function(str){
                                			var btnstr = "<a class='main-button icon-button curonyj' onclick='cancel();' style='white-space:nowrap; z-index: 2;margin-bottom: 40px;margin-top: 40px; margin-right:20px;' >매칭취소</a>";
        		            				$('#cancelbtn').html(btnstr);
                                		}
            					});
            				}else{
            					return;
            				}	
            			}else if(str == "C"){
            				if (confirm("매칭 취소요청을 하시겠습니까?(매칭취소시 다님코인 한개가 지불됩니다.)") == true){
	            				if (confirm("상대방이 이미 매칭취소를 신청해둔 상태입니다.'확인'버튼을 누를 시 매칭이 완전히 취소됩니다.") == true){
	            					location.href = "removehelperid.do?helpno="+${help.helpno};
	            				}else{
	            					return;
	            				}
            				}else{
            					return;
            				}
        				}	
        			}
        		});
    		};

        
        
function matching() {
            
        	$.ajax({
        		url:"matchingstatus.do",
        		data:{id:'${loginUser.userid}',
        				helpno:${help.helpno}},
        		type:'POST',
        		success: function(str){
            			if(str == "A"){
            				 if (confirm("완료신청을 하시겠습니까?(상대방도 동의해야 매칭이 완전히 완료됩니다.)") == true){
	            				$.ajax({
            						url:"matchingstatusupdate.do",
            						data:{id:'${loginUser.userid}',
                        				helpno:${help.helpno}},
                                		type:'POST',
                                		success: function(str){
                                			var btnstr = "<a class='main-button icon-button curonyj' onclick='matching();' style='background-color: #EBEBEB; white-space:nowrap; z-index: 2;margin-bottom: 40px;margin-top: 40px;'>완료대기중</a>";
            	            				$('#matchingbtn').html(btnstr);
                                		}
            					});
            				}else{
            					return;
            				}
            			}else if(str=="B"){
            				if (confirm("이미 완료신청하셨습니다. 신청을 취소할까요?") == true){
            					$.ajax({
            						url:"matchingstatusupdate.do",
            						data:{id:'${loginUser.userid}',
                        				helpno:${help.helpno}},
                                		type:'POST',
                                		success: function(str){
                                			var btnstr = "<a class='main-button icon-button curonyj' onclick='matching();' style='white-space:nowrap; z-index: 2;margin-bottom: 40px;margin-top: 40px;'>심부름완료</a>";
            	            				$('#matchingbtn').html(btnstr);
                                		}
            					});
            				}else{
            					return;
            				}	
            			}else if(str == "C"){
            				 if (confirm("완료신청을 하시겠습니까?(상대방도 동의해야 매칭이 완전히 완료됩니다.)") == true){
	            				if (confirm("상대방이 이미 완료를 신청해둔 상태입니다.'확인'버튼을 누를 시 매칭이 완전히 완료됩니다.") == true){
	            					location.href = "updatestatustofinal.do?helpno="+${help.helpno};
	            				}else{
	            					return;
	            				}
            				}else{
            					return;
            				}
        				}	
        			}
        		});
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
                    <h1 class="white-text">매칭페이지</h1>

                </div>
            </div>
        </div>

    </div>
    <!-- /Hero-area -->

    <script>
         function chatting(helpno){
            window.open("chatting.do?helpno=" + helpno,"","height=400px, width=300px,top=400,left=1350, location=no, resizable=no, status=no, menubar=no,toolbar=no");
         }
    </script>

    <!-- My Info -->
    <div id="information" class="section">

        <!-- container -->
        <div class="container">
            <h2>매칭 정보</h2>
            <!-- <button onclick="chatting('${help.helpno}');" class="main-button" style="position: fixed; top: 900px; right: 100px; background-image: url('resources/imge/message.png');">대화방</button><br> -->
            <img id="message" src="resources/img/message.png" onclick="chatting('${help.helpno}');" width="100px" height="100px" style="position: fixed; top: 900px; right: 50px; cursor: pointer; z-index: 100; border: 5px solid #fcc159; border-radius: 30px; padding: 5px;">
            <!-- <style>
                img#message:hover{
                    src: url("resources/img/1p.png");
                }
    
            </style> -->
            <hr style="border-color: #fcc159">
            <br>
            <!-- row -->

            <div class="row">
                <div class="col-md-12 mapyj">
                    <div class="row">

                        <div class="col-xs-6" valign="top" style="line-height:20px; border-right:1px solid #fcc159;">
                            <div class="yellowlabelyj" style="margin-bottom:40px;">게시글 정보</div>
                            <div class="row">
                                <div class="col-xs-6">
                                    <div class="row">
                                        <div class="tdyj1 yellowlabelyj col-xs-6">카테고리</div>
                                        <div class="col-xs-6" id="helptitle">${help.category}</div>
                                    </div>
                                </div>
                                <div class="col-xs-6">
                                    <div class="row">
                                        <div class="tdyj1 yellowlabelyj col-xs-6">전화번호</div>
                                        <div class="col-xs-6" id="helptitle">${help.phone}</div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-6">
                                    <div class="row">
                                        <div class="tdyj1 yellowlabelyj col-xs-6">닉네임</div>
                                        <div class="col-xs-6" id="helptitle">${help.nickname}</div>
                                    </div>
                                </div>
                                <div class="col-xs-6">
                                    <div class="row">
                                        <div class="tdyj1 yellowlabelyj col-xs-6">요청비용</div>
                                        <div class="col-xs-6 uiprice" id="helptitle"> ${help.pay}원</div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-6">
                                    <div class="row">
                                        <div class="tdyj1 yellowlabelyj col-xs-6">예상시간</div>
                                        <div class="col-xs-6" id="helptitle">${help.usingtime}</div>
                                    </div>
                                </div>
                                <div class="col-xs-6">
                                    <div class="row">
                                        <div class="tdyj1 yellowlabelyj col-xs-6">결제방식</div>
                                        <div class="col-xs-6" id="helptitle">${help.paym}</div>
                                    </div>
                                </div>
                            </div>

                            <div class="row" style="margin-bottom:40px;">

                                <div class="tdyj1 col-xs-6"><span class="myinfo">주소</span></div>
                                <div class="tdyj4 col-xs-6"><span>${help.roadaddress} ${help.detailaddress}</span></div>
                            </div>

                            <div class="row" style="margin-bottom:40px;">
	                            <div class="tdyj1 col-xs-6 yellowlabelyj">요청제목</div>
	                            <div class="tdyj4 col-xs-6" id="helptitle">${help.helptitle}</div>
	                        </div>
                            <label for="contents" class="tdyj1 yellowlabelyj">요청내용</label>
                            <div class="tdyj2" id="contents" style="float: left;-ms-overflow-style:none; width: 100%;"><span>${help.contents}</span></div>
                        </div>
                        <div class="col-xs-6">
                            <div class="yellowlabelyj" style="margin-bottom:40px;">다님이 정보</div>
                            <div class="row">
                                <div class="col-xs-6">
                                    <div class="row">
                                        <div class="tdyj1 yellowlabelyj col-xs-6">닉네임</div>
                                        <div class="col-xs-6" id="helptitle">${help.helpername}</div>
                                    </div>
                                </div>
                                <div class="col-xs-6">
                                    <div class="row">
                                        <div class="tdyj1 yellowlabelyj col-xs-6">전화번호</div>
                                        <div class="col-xs-6" id="helptitle">${help.helperphone}</div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                               <div class="col-xs-6 " style="border-right: 1px solid #fcc159;">
                                    <label for="helptitle" class="tdyj1 yellowlabelyj" >등급</label>



                                    <div style="text-align: center;" class="row justify-content-md-center">
                                        <c:if test="${help.helperreview ge 0 and help.helperreview lt 1}">
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
                                        <c:if test="${help.helperreview ge 1 and help.helperreview lt 1.5}">
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
                                        <c:if test="${help.helperreview ge 1.5 and help.helperreview lt 2}">
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
                                        <c:if test="${help.helperreview ge 2 and help.helperreview lt 2.5}">
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
                                        <c:if test="${help.helperreview ge 2.5 and help.helperreview lt 3}">
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
                                        <c:if test="${help.helperreview ge 3 and help.helperreview lt 3.5}">
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
                                        <c:if test="${help.helperreview ge 3.5 and help.helperreview lt 4}">
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
                                        <c:if test="${help.helperreview ge 4 and help.helperreview lt 4.5}">
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
                                        <c:if test="${help.helperreview ge 4.5 and help.helperreview lt 5}">
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
                                        <c:if test="${help.helperreview eq 5}">
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
                                <div class="tdyj2 row " id="danimcount" style="text-align: center; margin-top: 20px;"><div style="font-size: 60pt;" class=" yellowlabelyj" >${help.helperdanimcount}</div></div>
                            </div>
                            
                            <div class="col-xs-12">
	                            <div class="mapyj" style="padding-bottom: 20px;">
	                                <label for="map" class="yellowlabelyj">요청지역</label>
	                                <div class="map_wrap" cellpadding="30px" style="height:215px;">
	                                    <div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
	                                    <!-- <div class="hAddr">
	                                        <span class="title">지도중심기준 행정동 주소정보</span> <span id="centerAddr"></span>
	                                    </div> -->
	                                    <div class="mylocbg" id="mylocbg" onclick="myloc();" title="내위치"><img src="/danim/resources/img/myloc3.png" alt="" id="myloc"></div>
	                                </div>
	                            </div>

                        	</div>
                            </div>
                        </div>

                    </div>

                </div>

            </div>
            <div class="row">

                <c:if test="${!empty help.image}">
                    <div class="col-xs-12">
                    	<div class="row">
	                        <label for="uploadedimage" class="tdyj2 yellowlabelyj col-md-12">업로드이미지</label>
	                        <div id="uploadedimage" class="col-md-12 tryj uploadwindowyj input-field" style="margin-bottom: 10px;">
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
                        </div>
                    </div>
                </c:if>

                <br> <br>
                <!-- /row -->
				</div>

                <div class="row">
	
	                    		<div class="col-xs-6 pull-left">
	                                    <a class="main-button icon-button curonyj" onclick="javascript:history.back();" style="white-space:nowrap; z-index: 2;margin-bottom: 40px;margin-top: 40px; margin-right:20px;">뒤로가기</a>
	                        	</div>
	                   			<div class="col-xs-6">
	                   				<div class="pull-right row">
	                   				<c:if test="${help.helpid eq loginUser.userid and help.status ne '완료' }">
		                   				<c:if test="${help.cancelstatus eq loginUser.userid}">
			                   				<span id="cancelbtn" class="">
			                   					<a class="main-button icon-button curonyj" onclick="cancel();" style="white-space:nowrap; background-color:#EBEBEB; z-index: 2;margin-bottom: 40px;margin-top: 40px; margin-right:20px;">취소대기중</a>
			                                </span>
			                            </c:if>
		                   				<c:if test="${help.cancelstatus eq null or help.cancelstatus eq help.helperid}">
			                   				<span id="cancelbtn" class="">
			                                    <a class="main-button icon-button curonyj" onclick="cancel();" style="white-space:nowrap; z-index: 2;margin-bottom: 40px;margin-top: 40px; margin-right:20px;" >매칭취소</a>
			                                </span>
			                            </c:if>
			                            <c:if test="${help.matchingstatus eq loginUser.userid }">
				                            <span id="matchingbtn">
			                                    <a class="main-button icon-button curonyj" onclick="matchingcancel();" style="background-color:#EBEBEB; white-space:nowrap; z-index: 2;margin-bottom: 40px;margin-top: 40px;">완료대기중</a>
			                    			</span>
			                    		</c:if>
			                            <c:if test="${help.matchingstatus eq null or help.matchingstatus eq help.helperid}">
				                            <span id="matchingbtn">
			                                    <a class="main-button icon-button curonyj" onclick="matching();" style="white-space:nowrap; z-index: 2;margin-bottom: 40px;margin-top: 40px;">심부름완료</a>
			                    			</span>
			                    		</c:if>
		                    		</c:if>
	                    			</div>
	                    		</div>
	                    	
	                <!-- /container -->
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
