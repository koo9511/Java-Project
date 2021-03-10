<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>


<style type="text/css">
/* 보유다님코인 나의결제내역 포인트전환 */
.area_navigation {
   position: relative;
   margin: 0 auto;
   width: 1080px;
   zoom: 1;
}

.area_navigation .an_l li {
   position: relative;
   float: left;
   padding-top: 16px;
   padding-right: 114px;
   zoom: 1;
}

.area_navigation .an_item {
   float: left;
}

li {
   display: list-item;
   text-align: -webkit-match-parent;
}
body {
  font-family: Tahoma;
}
header {
  text-align: center;
}
#calendar {
  width: 100%;
}
#calendar a {
  color: #8e352e;
  text-decoration: none;
}
#calendar ul {
  list-style: none;
  padding: 0;
  margin: 0;
  width: 100%;
}
#calendar li {
  display: block;
  float: left;
  width: 14.342%;
  padding: 5px;
  box-sizing: border-box;
  border: 1px solid #ccc;
  margin-right: -1px;
  margin-bottom: -1px;
}
#calendar ul.weekdays {
  height: 40px;
  background: #fcc159;
}
#calendar ul.weekdays li {
  text-align: center;
  text-transform: uppercase;
  line-height: 20px;
  border: none !important;
  padding: 10px 6px;
  color: #fff;
  font-size: 15px;
  background-color:#fcc159;
}
#calendar .days li {
  height: 180px;
}
#calendar .days li:hover {
  background: #d3d3d3;
}
#calendar .date {
  text-align: center;
  margin-bottom: 5px;
  padding: 4px;
  background: #333;
  color: #fff;
  width: 20px;
  border-radius: 50%;
  float: right;
}
#calendar .event {
  clear: both;
  display: block;
  font-size: 13px;
  border-radius: 4px;
  padding: 5px;
  margin-top: 0px;
  margin-bottom: 5px;
  line-height: 14px;
  background: #e4f2f2;
  border: 1px solid #b5dbdc;
  color: #009aaf;
  text-decoration: none;
}
#calendar .event-desc {
  color: #666;
  margin: 3px 0 7px 0;
  text-decoration: none;
}
#calendar .other-month {
  background: #f5f5f5;
  color: #666;
}
/* ============================
                Mobile Responsiveness
   ============================*/
@media (max-width: 768px) {
  #calendar .weekdays, #calendar .other-month {
    display: none;
  }
  #calendar li {
    height: auto !important;
    border: 1px solid #ededed;
    width: 100%;
    padding: 10px;
    margin-bottom: -1px;
  }
  #calendar .date {
    float: none;
  }
}

.closeboximg{
   cursor: pointer; 
   width: 70%; 
   height: 70%; 
   margin-left: 15%; 
   margin-top: 7%;
}

.openboximg{
   cursor: pointer; 
   width: 90%; 
   height: 90%; 
   margin-left:7%;
   margin-top: 2px;
}

.lockboximg{
   cursor: pointer; 
   width: 70%; 
   height: 70%; 
   margin-left: 15%; 
   margin-top: 7%;
}
/* img{
   display:none;
} */
</style>


<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<title>특별한 이벤트</title>

<!-- Google font -->
<link
   href="https://fonts.googleapis.com/css?family=Lato:700%7CMontserrat:400,600"
   rel="stylesheet">

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet"
   href="/danim/resources/css/bootstrap.min.css" />

<!-- Font Awesome Icon -->
<link rel="stylesheet" href="/danim/resources/css/font-awesome.min.css">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet" href="/danim/resources/css/style.css" />

<link type="text/css" rel="stylesheet" href="/danim/resources/css/nkstyle.css" />

<link type="text/css" rel="stylesheet" href="/danim/resources/css/nkcalendar.css" />

<link rel="stylesheet" type="text/css" href="https://unpkg.com/magic-input/dist/magic-input.min.css">

<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
   function logout() {
      alert = "로그아웃 되었습니다.";
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
      <div class="bg-image bg-parallax overlay"
         style="background-image: url(/danim/resources/img/page-background.jpg)"></div>
      <!-- /Backgound Image -->

      <div class="container">
         <div class="row">
            <div class="col-md-10 col-md-offset-1 text-center">
               <ul class="hero-area-tree">
                  <li><a href="userChange.do">Danim:</a></li>
               </ul>
               <h1 class="white-text">다님의 특별한 이벤트!</h1>
            </div>
         </div>
      </div>

   </div>
   <!-- /Hero-area -->
   <!-- container -->
      <div class="container">
         <div class="area_navigation" role="navigation" style="margin: 0;">
            <div class="a">
               <h2>특별한 이벤트</h2>
            </div>
            <div class="b">
               <a href="payment2.do?userid=${loginUser.getUserid()}" style="color: #fcc159">다님코인 충전</a><a>></a>   
               <a href="paylist.do?userid=${loginUser.getUserid()}" style="color: #fcc159">나의 결제내역 보기</a><a>></a>
               <a href="change.do?userid=${loginUser.getUserid()}" style="color: #fcc159">포인트 전환하기</a><a>></a>
               <a href="coupon.do?userid=${loginUser.getUserid()}" style="color: #fcc159">쿠폰 받으러가기</a><a>></a>
               <!-- <a style="color: #fcc159" onclick="asdasd();">눌러보시지</a><a>></a> -->
            </div>
         </div>
         <!-- container/ -->
         <hr style="border-color: #fcc159; margin-top: 0;">
         <br>
<%-- <jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" var="today" />
오늘 날짜 : <c:out value="${today}"/> --%>


<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="dd" var="today" />
<c:set var="nowday" value="${today }"/>
<!-- 시작날짜 -->
<fmt:parseDate value="20" pattern="dd" var="startDate" />
<!-- 종료날짜 -->
<fmt:parseDate value="26" pattern="dd" var="endDate" />

<c:set var="temp" value="${temp }"/>
<!-- <div style=" min-width:1200px; border:2px solid green;"> -->
<c:forEach var="sub" begin="1" end="7" step="1">
   <!-- list에 값이 있을 경우 스플릿 돌림 -->
   <c:if test="${list != null }">
      <c:set var="slist" value="${fn:split(list, ',') }"/>
      <%-- <c:set var="dlist" value="${slist.size()-1 }"/> --%>
      <c:set var="str" value="${fn:length(slist) }" />
   </c:if>
   <!-- list에 값이 없을 경우 바로 통과함 -->
   <c:if test="${list == null }">
      <c:set var="str" value="${fn:length(list) }" />
   </c:if>
      <!-- 출석체크한 상자 열림 -->
      <c:if test="${str ge sub }">
      <div style="text-align:center; border:1px solid #fcc159; float:left; margin-left:0%; width:160px; margin-left:0.1%" >
         <div style=" background-color:#fcc159; color:#fff;"><p>${sub}일자</p></div>
         <div><img src="/danim/resources/img/openbox.png" width=150px height=130px ></div>
         <div style="height:30px;"></div>
      </div>
      </c:if>
      
      <!-- 다음날 상자 활성화 시킴(단, 출석체크 버튼은 아래 조건으로 움직임 -->
      <c:if test="${str+1 eq sub}">
      <div style="text-align:center; border:1px solid #fcc159; float:left; margin-left:0%; width:160px; margin-left:0.1%" >
         <div style="background-color:#fcc159; color:#fff;"><p>${sub}일자</p></div>
         <div><img src="/danim/resources/img/closebox.png" width=120px height=130px ></div><!-- width=100px height=120px -->
      <!-- 당일 날짜일 경우 버튼 활성화 -->
      <c:if test="${temp+1 eq nowday or temp eq null}" >
         <div style="height:30px;"><button onclick="clickMe('${nowday}');">출석체크</button></div>
      </c:if>
      <!-- 당일 날짜가 아닐 경우 버튼 없음 -->
      
      <c:if test="${temp+1 ne nowday and temp ne null}" >
         <div style="height:30px;"></div>
      </c:if>
      </div>
      </c:if>
      
      <!-- 다다음날 상자 숨겨짐 -->
      <c:if test="${str+2 <= sub }">
      <div style="text-align:center; border:1px solid #fcc159; float:left; margin-left:0%; width:160px; margin-left:0.1%" >
         <div style="background-color:#fcc159; color:#fff;"><p>${sub}일자</p></div>
         <div><img src="/danim/resources/img/lockbox.png" width=120px height=130px ></div>
         <div style="height:30px;"></div>
      </div>
      </c:if>
</c:forEach>
</div>
<!-- Footer -->
   <footer id="footer" class="section">

      <!-- container -->
      <div class="container">

         <!-- row -->
         <div class="row" style="z-index:-3;">

            <!-- footer logo -->
            <div class="col-md-6">
               <div class="footer-logo">
                  <a class="logo" href="userChange.do"> <img
                     src="/danim/resources/img/logo.png" alt="logo">
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
                  <li><a href="#" class="facebook"><i
                        class="fa fa-facebook"></i></a></li>
                  <li><a href="#" class="instagram"><i
                        class="fa fa-instagram"></i></a></li>
                  <li><a href="#" class="github"><i class="fa fa-github"></i></a></li>
               </ul>
            </div>
            <!-- /social -->

            <!-- copyright -->
            <div class="col-md-8 col-md-pull-4">
               <div class="footer-copyright">
                  <span>&copy; Copyright Koo gun mo. | This Poroject is made
                     with Kim nam gyu & You young joon
                  </span>
               </div>
            </div>
            <!-- /copyright -->

         </div>
         <!-- row -->

      </div>
      <!-- /container -->

   </footer>
   <!-- /Footer -->       

<!-- nkenventsub 열기 -->
<input type="text" id="userid" value="${loginUser.getUserid() }"
      hidden="true">

<script>
   function clickMe(sub){
      alert("controller 로 보내는 값" + sub);
      
      var a = $('#userid').val();
      var coin = 200;
      var b = "이벤트";
      var c = "실패";
      
      location.href="updateEvent.do?userid=" + a + "&day=" + sub + "&money=" + coin;
      /* location.href="successEvent.do?userid=" + a + "&what=" + b;  */
      alert("출석체크 완료!")
      history.go(0);
      
      }
   
   
   
</script>

<script>
   //페이지 켜짐과 동시에 발동
   $(document).ready(function(){
      $('.eventbutton img').removeClass('lockboximg'); //기존 클래스를 삭제 (크기까지 삭제)
      $('.eventbutton img').addClass('lockboximg'); //삭제된 클래스 자리에 새로운 클래스 삽입 (크기까지 삽입)
      $('.eventbutton img').attr('src', '/danim/resources/img/lockbox.png'); //이미지는 그대로 남아있으니, 이미지 교체까지 마무리
   }) //document.ready function
   
   //상자 클릭시 발동
   function getcoin(){
         alert("열림")
         $('.eventbutton img').removeClass('lockboximg'); //기존 클래스를 삭제 (크기까지 삭제)
         $('.eventbutton img').addClass('openboximg'); //삭제된 클래스 자리에 새로운 클래스 삽입 (크기까지 삽입)
         $('.eventbutton img').attr('src', '/danim/resources/img/openbox.png'); //이미지는 그대로 남아있으니, 이미지 교체까지 마무리
   }
   
   function asdasd(nowday){
      alert("asdasd");
   }
   
   
</script>
    
</body>
</html>




