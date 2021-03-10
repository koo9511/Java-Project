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

		<title>다님: 내 서비스 현황</title>

		<!-- Google font -->
		<link href="https://fonts.googleapis.com/css?family=Lato:700%7CMontserrat:400,600" rel="stylesheet">

		<!-- Bootstrap -->
		<link type="text/css" rel="stylesheet" href="/danim/resources/css/bootstrap.min.css"/>

		<!-- Font Awesome Icon -->
		<link rel="stylesheet" href="/danim/resources/css/font-awesome.min.css">

		<!-- Custom stlylesheet -->
		<link type="text/css" rel="stylesheet" href="/danim/resources/css/style.css"/>

		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
		<script>
				function logout(){
					alert("로그아웃 되었습니다.");
				}
		</script>
    </head>
	<body>

		<!-- Header -->
		<c:import url="headfoot/header.jsp" />
		<!-- /Header -->

		<!-- Hero-area -->
		<div class="hero-area section">

			<!-- Backgound Image -->
			<div class="bg-image bg-parallax overlay" style="background-image:url(/danim/resources/img/page-background.jpg)"></div>
			<!-- /Backgound Image -->
			
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 text-center">
						<ul class="hero-area-tree">
							<li><a href="#">Danim:</a></li>
						</ul>
						<h1 class="white-text">전체 서비스 현황</h1>
					</div>
				</div>
			</div>
		</div>
		<!-- /Hero-area -->
        <script>
        function serviceCheck(value){
            
            if(value == '전체'){
                $("#all").removeAttr('hidden');
				$("div#all").removeClass('hidden');
                $("#wait").attr('hidden',true);
                $("#ing").attr('hidden', true);
                $("#success").attr('hidden', true);
                $("#cancel").attr('hidden', true);
                return true;
            }
            if(value == '대기중'){
                $("#all").attr('hidden', true);
				$("div#all").addClass('hidden');
                $("#wait").removeAttr('hidden');
                $("#ing").attr('hidden', true);
                $("#success").attr('hidden', true);
                $("#cancel").attr('hidden', true);
                return true;
            }
            if(value == '진행중'){
                $("#all").attr('hidden', true);
				$("div#all").addClass('hidden');
                $("#wait").attr('hidden', true);
                $("#ing").removeAttr('hidden');
                $("#success").attr('hidden', true);
                $("#cancel").attr('hidden', true);
                return true;
            }
            if(value == '완료'){
                $("#all").attr('hidden', true);
				$("div#all").addClass('hidden');
                $("#wait").attr('hidden', true);
                $("#ing").attr('hidden', true);
                $("#success").removeAttr('hidden');
                $("#cancel").attr('hidden', true);
                return true;
            }
            if(value == '취소'){
                $("#all").attr('hidden', true);
				$("div#all").addClass('hidden');
                $("#wait").attr('hidden', true);
                $("#ing").attr('hidden', true);
                $("#success").attr('hidden', true);
                $("#cancel").removeAttr('hidden');
                return true;
            }

        };
        </script>
		<!-- Contact -->
		<div id="contact" class="section" >

			<!-- container -->
			<div class="container" >

				<!-- row -->
				<div class="row">


					<!-- login form -->
					<br><br>
					<div class="col-md-12">
                        <div class="pull-right" id="sel" style="font-size: 1.2em; font-weight: 500;">
                            <label><input type="radio" checked name="check" value="전체" onclick="serviceCheck(this.value);">전체 &nbsp;</label>
                            <label><input type="radio" name="check" value="대기중" onclick="serviceCheck(this.value);"><span style="color: rgb(241, 180, 12);">대기 </span>&nbsp;</label>
                            <label><input type="radio" name="check" value="진행중" onclick="serviceCheck(this.value);"><span style="color: rgb(12, 194, 12);">진행 </span>&nbsp;</label>
                            <label><input type="radio" name="check" value="완료" onclick="serviceCheck(this.value);"><span style="color: rgb(59, 129, 235);">완료 </span>&nbsp;</label>
                            <label><input type="radio" name="check" value="취소" onclick="serviceCheck(this.value);"><span style="color: #f75b5b;">취소</span></label>
                        </div>
						<div class="">
                            <h2 style="border-bottom: 2px solid #fcc159; padding-bottom: 30px; padding-left: 2%">전체 서비스 현황</h2>
                               
                            <!-- 전체 -->
							<table class="mycenter-table" id="all">
								
                                <tr style="border-bottom: 2px solid #fcc159; text-align: center;" class="mycenter-tr">
                                    <td class="mycentertitle center-title" style="padding-bottom: 10px; width: 50%;">
                                        <span>제 목</span>
                                    </td>
                                    <td class="mycentertitle center-catogory d-none d-md-table-cell" style="padding-bottom: 10px;">
                                        <span>종 류</span>
                                    </td>
                                    <td class="mycentertitle center-status" style="padding-bottom: 10px;">
                                        <span>상 태</span>
                                    </td>
                                    <td class="mycentertitle center-date-title" style="padding-bottom: 10px;">
                                        <span>날 짜</span>
                                    </td>
								</tr>   
								
								<c:forEach var="help" items="${requestScope.list }">
									<c:if test="${help.status != null}" >
										<c:if test="${help.status eq '대기중'}">
											<c:url var="hdt" value="helpdetail.do">
												<c:param name="helpno" value="${help.helpno}" />
												<c:param name="page" value="${ requestScope.currentPage }" />
											</c:url>
										</c:if>		
										<c:if test="${help.status ne '대기중'}">
											<c:if test="${help.helperid eq loginUser.getUserid()}">
												<c:url var="hdt" value="matchingstarthelper.do">
													<c:param name="helpno" value="${help.helpno}" />
													<c:param name="userid" value="${loginUser.getUserid()}"/>
													<c:param name="page" value="${ requestScope.currentPage }" />
												</c:url>			
											</c:if>	
											<c:if test="${help.helpid eq loginUser.getUserid()}">
												<c:url var="hdt" value="matchingstarthelp.do">
													<c:param name="helpno" value="${help.helpno}" />
													<c:param name="userid" value="${loginUser.getUserid()}"/>
													<c:param name="page" value="${ requestScope.currentPage }" />
												</c:url>			
											</c:if>
										</c:if>			
										<tr class="noti" onclick="javascript:location.href='${hdt}'" style="text-align: center; font-size: 1.1em; font-weight: 500; border: none; padding-top: 10px;">
											<td style="padding-top: 10px;" class="center-title">
												<span>${help.helptitle}</span>
											</td>
											<td style="padding-top: 10px;" class="center-catogory d-none d-md-table-cell">
												<span>${help.category}</span>
											</td>
											<td style="padding-top: 10px;" class="center-status">
												<c:if test="${help.status eq '취소'}"><span style="color: #f75b5b;"></c:if>
												<c:if test="${help.status eq '진행중'}"><span style="color: rgb(12, 194, 12);"></c:if>
												<c:if test="${help.status eq '대기중'}"><span style="color: rgb(241, 180, 12);"></c:if>
												<c:if test="${help.status eq '완료'}"><span style="color: rgb(59, 129, 235);"></c:if>
													${help.status}</span>
											</td>
											<td style="padding-top: 10px;" class="center-date d-none d-md-table-cell">
												<div>
												<fmt:formatDate value="${help.helpdate}" type="date" dateStyle="medium"/>
											</div>
										</td>
									</tr>
							</c:if>
								</c:forEach>
								
                            </table>
                            <!-- 진행중 -->
                            <table class="mycenter" id="ing" hidden="true">
								
                                <tr style="border-bottom: 2px solid #fcc159; text-align: center;" class="mycenter-tr">
                                    <td class="mycentertitle center-title" style="padding-bottom: 10px; width: 50%;">
                                        <span>제 목</span>
                                    </td>
                                    <td class="mycentertitle center-catogory d-none d-md-table-cell" style="padding-bottom: 10px;">
                                        <span>종 류</span>
                                    </td>
                                    <td class="mycentertitle center-status" style="padding-bottom: 10px;">
                                        <span>상 태</span>
                                    </td>
                                    <td class="mycentertitle center-date-title" style="padding-bottom: 10px;">
                                        <span>날 짜</span>
                                    </td>
								</tr>   
								
								<c:forEach var="help" items="${requestScope.list }">
									<c:if test="${help.status eq '진행중'}" >
										<c:if test="${help.helperid eq loginUser.getUserid()}">
											<c:url var="hdt" value="matchingstarthelper.do">
												<c:param name="helpno" value="${help.helpno}" />
												<c:param name="userid" value="${loginUser.getUserid()}"/>
												<c:param name="page" value="${ requestScope.currentPage }" />
											</c:url>			
										</c:if>	
										<c:if test="${help.helpid eq loginUser.getUserid()}">
											<c:url var="hdt" value="matchingstarthelp.do">
												<c:param name="helpno" value="${help.helpno}" />
												<c:param name="userid" value="${loginUser.getUserid()}"/>
												<c:param name="page" value="${ requestScope.currentPage }" />
											</c:url>			
										</c:if>				
										<tr class="noti" onclick="javascript:location.href='${hdt}'" style="text-align: center; font-size: 1.1em; font-weight: 500; border: none; padding-top: 10px;">
											<td style="padding-top: 10px;" class="center-title">
												<span>${help.helptitle}</span>
											</td>
											<td style="padding-top: 10px;" class="center-catogory d-none d-md-table-cell">
												<span>${help.category}</span>
											</td>
											<td style="padding-top: 10px;" class="center-status">
												<c:if test="${help.status eq '취소'}"><span style="color: #f75b5b;"></c:if>
												<c:if test="${help.status eq '진행중'}"><span style="color: rgb(12, 194, 12);"></c:if>
												<c:if test="${help.status eq '대기중'}"><span style="color: rgb(241, 180, 12);"></c:if>
												<c:if test="${help.status eq '완료'}"><span style="color: rgb(59, 129, 235);"></c:if>
													${help.status}</span>
											</td>
											<td style="padding-top: 10px;" class="center-date d-none d-md-table-cell">
												<div>
												<fmt:formatDate value="${help.helpdate}" type="date" dateStyle="medium"/>
											</div>
										</td>
									</tr>
							</c:if>
								</c:forEach>
								
                            </table>
                              <!-- 대기중 -->
                              <table class="mycenter" id="wait" hidden="true">
								
                                <tr style="border-bottom: 2px solid #fcc159; text-align: center;" class="mycenter-tr">
                                    <td class="mycentertitle center-title" style="padding-bottom: 10px; width: 50%;">
                                        <span>제 목</span>
                                    </td>
                                    <td class="mycentertitle center-catogory d-none d-md-table-cell" style="padding-bottom: 10px;">
                                        <span>종 류</span>
                                    </td>
                                    <td class="mycentertitle center-status" style="padding-bottom: 10px;">
                                        <span>상 태</span>
                                    </td>
                                    <td class="mycentertitle center-date-title" style="padding-bottom: 10px;">
                                        <span>날 짜</span>
                                    </td>
								</tr>   
								
								<c:forEach var="help" items="${requestScope.list }">
									<c:if test="${help.status eq '대기중'}" >
										<c:url var="hdt" value="helpdetail.do">
											<c:param name="helpno" value="${help.helpno}" />
											<c:param name="page" value="${ requestScope.currentPage }" />
										</c:url>					
										<tr class="noti" onclick="javascript:location.href='${hdt}'" style="text-align: center; font-size: 1.1em; font-weight: 500; border: none; padding-top: 10px;">
											<td style="padding-top: 10px;" class="center-title">
												<span>${help.helptitle}</span>
											</td>
											<td style="padding-top: 10px;" class="center-catogory d-none d-md-table-cell">
												<span>${help.category}</span>
											</td>
											<td style="padding-top: 10px;" class="center-status">
												<c:if test="${help.status eq '취소'}"><span style="color: #f75b5b;"></c:if>
												<c:if test="${help.status eq '진행중'}"><span style="color: rgb(12, 194, 12);"></c:if>
												<c:if test="${help.status eq '대기중'}"><span style="color: rgb(241, 180, 12);"></c:if>
												<c:if test="${help.status eq '완료'}"><span style="color: rgb(59, 129, 235);"></c:if>
													${help.status}</span>
											</td>
											<td style="padding-top: 10px;" class="center-date d-none d-md-table-cell">
												<div>
												<fmt:formatDate value="${help.helpdate}" type="date" dateStyle="medium"/>
											</div>
										</td>
									</tr>
							</c:if>
								</c:forEach>
								
                            </table>
                          <!-- 완료 -->
                          <table class="mycenter" id="success" hidden="true">
								
                            <tr style="border-bottom: 2px solid #fcc159; text-align: center;" class="mycenter-tr">
                                <td class="mycentertitle center-title" style="padding-bottom: 10px; width: 50%;">
                                    <span>제 목</span>
                                </td>
                                <td class="mycentertitle center-catogory d-none d-md-table-cell" style="padding-bottom: 10px;">
                                    <span>종 류</span>
                                </td>
                                <td class="mycentertitle center-status" style="padding-bottom: 10px;">
                                    <span>상 태</span>
                                </td>
                                <td class="mycentertitle center-date-title" style="padding-bottom: 10px;">
                                    <span>날 짜</span>
                                </td>
                            </tr>   
                            
                            <c:forEach var="help" items="${requestScope.list }"  >
                                <c:if test="${help.status eq '완료'}" >
									<c:if test="${help.helperid eq loginUser.getUserid()}">
										<c:url var="hdt" value="matchingstarthelper.do">
											<c:param name="helpno" value="${help.helpno}" />
											<c:param name="userid" value="${loginUser.getUserid()}"/>
											<c:param name="page" value="${ requestScope.currentPage }" />
										</c:url>			
									</c:if>	
									<c:if test="${help.helpid eq loginUser.getUserid()}">
										<c:url var="hdt" value="matchingstarthelp.do">
											<c:param name="helpno" value="${help.helpno}" />
											<c:param name="userid" value="${loginUser.getUserid()}"/>
											<c:param name="page" value="${ requestScope.currentPage }" />
										</c:url>			
									</c:if>					
                                    <tr class="noti" onclick="javascript:location.href='${hdt}'" style="text-align: center; font-size: 1.1em; font-weight: 500; border: none; padding-top: 10px;">
                                        <td style="padding-top: 10px;" class="center-title">
                                            <span>${help.helptitle}</span>
                                        </td>
                                        <td style="padding-top: 10px;" class="center-catogory d-none d-md-table-cell">
                                            <span>${help.category}</span>
                                        </td>
                                        <td style="padding-top: 10px;" class="center-status">
                                            <c:if test="${help.status eq '취소'}"><span style="color: #f75b5b;"></c:if>
                                            <c:if test="${help.status eq '진행중'}"><span style="color: rgb(12, 194, 12);"></c:if>
                                            <c:if test="${help.status eq '대기중'}"><span style="color: rgb(241, 180, 12);"></c:if>
                                            <c:if test="${help.status eq '완료'}"><span style="color: rgb(59, 129, 235);"></c:if>
                                                ${help.status}</span>
                                        </td>
                                        <td style="padding-top: 10px;" class="center-date d-none d-md-table-cell">
                                            <div>
                                            <fmt:formatDate value="${help.helpdate}" type="date" dateStyle="medium"/>
                                        </div>
                                    </td>
                                </tr>
                        </c:if>
                            </c:forEach>
                            
                        </table>
                      <!-- 취소 -->
                      <table class="mycenter" id="cancel" hidden="true">
								
                        <tr style="border-bottom: 2px solid #fcc159; text-align: center;" class="mycenter-tr">
                            <td class="mycentertitle center-title" style="padding-bottom: 10px; width: 50%;">
                                <span>제 목</span>
                            </td>
                            <td class="mycentertitle center-catogory d-none d-md-table-cell" style="padding-bottom: 10px;">
                                <span>종 류</span>
                            </td>
                            <td class="mycentertitle center-status" style="padding-bottom: 10px;">
                                <span>상 태</span>
                            </td>
                            <td class="mycentertitle center-date-title" style="padding-bottom: 10px;">
                                <span>날 짜</span>
                            </td>
                        </tr>   
                        
                        <c:forEach var="help" items="${requestScope.list }">
                            <c:if test="${help.status eq '취소'}" >
								<c:if test="${help.helperid eq loginUser.getUserid()}">
									<c:url var="hdt" value="matchingstarthelper.do">
										<c:param name="helpno" value="${help.helpno}" />
										<c:param name="userid" value="${loginUser.getUserid()}"/>
										<c:param name="page" value="${ requestScope.currentPage }" />
									</c:url>			
								</c:if>	
								<c:if test="${help.helpid eq loginUser.getUserid()}">
									<c:url var="hdt" value="matchingstarthelp.do">
										<c:param name="helpno" value="${help.helpno}" />
										<c:param name="userid" value="${loginUser.getUserid()}"/>
										<c:param name="page" value="${ requestScope.currentPage }" />
									</c:url>			
								</c:if>				
                                <tr class="noti" onclick="javascript:location.href='${hdt}'" style="text-align: center; font-size: 1.1em; font-weight: 500; border: none; padding-top: 10px;">
                                    <td style="padding-top: 10px;" class="center-title">
                                        <span>${help.helptitle}</span>
                                    </td>
                                    <td style="padding-top: 10px;" class="center-catogory d-none d-md-table-cell">
                                        <span>${help.category}</span>
                                    </td>
                                    <td style="padding-top: 10px;" class="center-status">
                                        <c:if test="${help.status eq '취소'}"><span style="color: #f75b5b;"></c:if>
                                        <c:if test="${help.status eq '진행중'}"><span style="color: rgb(12, 194, 12);"></c:if>
                                        <c:if test="${help.status eq '대기중'}"><span style="color: rgb(241, 180, 12);"></c:if>
                                        <c:if test="${help.status eq '완료'}"><span style="color: rgb(59, 129, 235);"></c:if>
                                            ${help.status}</span>
                                    </td>
                                    <td style="padding-top: 10px;" class="center-date d-none d-md-table-cell">
                                        <div>
                                        <fmt:formatDate value="${help.helpdate}" type="date" dateStyle="medium"/>
                                    </div>
                                </td>
                            </tr>
                    </c:if>
                        </c:forEach>
                        
                    </table>
							
							<!-- /row -->
						</div>
					</div>
				
				</div>
                <!-- /row -->
                <!-- pagination -->
							<div class="col-md-12" id="all">
								<div class="post-pagination">
									
									<c:if test="${requestScope.currentPage gt 1 }">
										<a href="myServiceMore.do?userid=${loginUser.getUserid()}&page=1" class="pagination-back pull-left">처음으로</a>
									</c:if>
																	
									<ul class="pages">
										<c:forEach var="p" begin="${requestScope.startPage }" end="${requestScope.endPage }" step="1">
											<c:if test="${p eq requestScope.currentPage }">
													<li class="active">${ p }</li>
											</c:if>
											<c:if test="${p ne requestScope.currentPage }">
												<li><a href="myServiceMore.do?userid=${loginUser.getUserid()}&page=${ p }">${ p }</a></li>
											</c:if>
										</c:forEach>
										
									</ul>
									<c:if test="${requestScope.listCount gt 10}">
                                        <a href="myServiceMore.do?userid=${loginUser.getUserid()}&page=${requestScope.page+1}" class="pagination-next pull-right">다음</a>
                                        
									</c:if>
								</div>
							</div>
                            <!-- pagination -->
                            <a href="serviceStatus.do?userid=${loginUser.getUserid()}&page=1" class="main-button pull-left"> < 돌아가기</a>
				
			</div>
			<!-- /container -->
		</div>
		<!-- /Contact -->

		<!-- Footer -->
		<footer id="footer" class="section">

				<!-- container -->
				<div class="container">
		
					<!-- row -->
					<div class="row">
		
						<!-- footer logo -->
						<div class="col-md-6">
							<div class="footer-logo">
								<a class="logo">
									<img src="resources/img/logo.png" alt="logo">
								</a>
							</div>
						</div>
					</div>
					<!-- /row -->
		
					<!-- row -->
					<div id="bottom-footer" class="row">
		
						<!-- social -->
						<div class="col-md-4 col-md-push-8">
							<ul class="footer-social">
								<li><a href="#" class="facebook"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#" class="instagram"><i class="fa fa-instagram"></i></a></li>
								<li><a href="#" class="github"><i class="fa fa-github"></i></a></li>
							</ul>
						</div>
						<!-- /social -->
		
						<!-- copyright -->
						<div class="col-md-8 col-md-pull-4">
							<div class="footer-copyright">
									<span>&copy; Copyright <a href="admin.do">Koo gun mo. </a>| This Poroject is made with Kim nam gyu & You young joon</a></span>
							</div>
						</div>
						<!-- /copyright -->
		
					</div>
					<!-- row -->
		
				</div>
				<!-- /container -->
		
			</footer>
		<!-- /Footer -->

		<!-- preloader -->
		<div id='preloader'><div class='preloader'></div></div>
		<!-- /preloader -->


		<!-- jQuery Plugins -->
		<script type="text/javascript" src="/danim/resources/js/jquery.min.js"></script>
		<script type="text/javascript" src="/danim/resources/js/bootstrap.min.js"></script>
		<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=true"></script>
		<script type="text/javascript" src="/danim/resources/js/google-map.js"></script>
		<script type="text/javascript" src="/danim/resources/js/main.js"></script>
	</body>
</html>
