<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<header id="header">
    <script> // 세션이 종료돠었을 때, 다시 로그인하도록 유도.
        $(document).ready(function(){
            var check = "${loginUser}";
            if(check == ''){
                alert("로그인 후 이용하세요.");
                location.href="loginForm.do";
            }   
        });
    </script>
<div class="container">

        <div class="navbar-header" class="backimgs">
            <!-- Logo -->
            <div class="navbar-brand">
                <c:if test="${loginUser == null}">
					<a class="logo" href="index.do">
						<img src="/danim/resources/img/logo.png" alt="logo">
					</a>
				</c:if>
				<c:if test="${loginUser != null}">
					<a class="logo" href="userChange.do">
						<img src="/danim/resources/img/logo.png" alt="logo">
					</a>
				</c:if>
            </div>
            <!-- /Logo -->

            <!-- Mobile toggle -->
            <button class="navbar-toggle">
                <span></span>
            </button>
            <!-- /Mobile toggle -->
        </div>

       <!-- Navigation -->
		<c:if test="${loginUser == null}">
            <nav id="nav">
                <ul class="main-menu nav navbar-nav navbar-right">
                    <li><a href="index.do">메인으로</a></li>
                    <li><a href="loginForm.do">로그인</a></li>
                    <li><a href="enrollForm.do">회원가입</a></li>
                    <li><a href="contactForm.do">문의하기</a></li>
                    <li><a href="noticeForm.do?page=1">공지사항</a></li>
                    <!-- <li><a id="dark" class="btn" onclick="darkModeSwitch(true);">Dark Mode</a></li>
                    <li><a id="white" class="btn" onclick="darkModeSwitch(false);">Light Mode</a></li> -->
                </ul>
            </nav>
        </c:if>
        <c:if test="${loginUser != null}">
            <nav id="nav">
                <ul class="main-menu nav navbar-nav navbar-right">
                    <li><a href="myPage.do?userid=${loginUser.getUserid()}" style="color: #f5a61e;"> <span style="color: black;">'</span> ${loginUser.getNickname()}<span style="color: black;">'</span></a></li>
                    <li><a href="helperlist.do">메인으로</a></li>
                    <li><a href="myPage.do?userid=${loginUser.getUserid()}">내 정보</a></li>
                    <li><a href="serviceStatus.do?userid=${loginUser.getUserid()}&page=1">서비스 현황</a></li>
                    <li><a href="serviceCenter.do">고객센터</a></li>
                    <li><a href="mycenter.do?userid=${loginUser.userid}&page=1">내 문의함</a></li>
                    <li><a href="noticeForm.do?page=1">공지사항</a></li>
                    <!-- <li><a id="dark" class="btn" onclick="darkModeSwitch(true);">Dark Mode</a></li>
                    <li><a id="white" class="btn" onclick="darkModeSwitch(false);">Light Mode</a></li> -->
                    <li><a onclick="logout();" href="logout.do">로그아웃</a></li>
                </ul>
            </nav>
        </c:if>
        <!-- /Navigation -->
    </div>
</header>