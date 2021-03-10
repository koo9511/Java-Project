<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		 <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<title>다님: 대화창</title>

		<!-- Google font -->
		<!-- Bootstrap -->
		<link type="text/css" rel="stylesheet" href="resources/css/bootstrap.min.css"/>

		<!-- Font Awesome Icon -->
		<link rel="stylesheet" href="resources/css/font-awesome.min.css">

		<!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="resources/css/style.css"/>
        <!-- <link rel="stylesheet" href="resources/css/yjstyle.css" /> -->

		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
		<script>
			$(document).ready(function(){
                setInterval(check, 300);
               
                document.body.scrollIntoView(false)

                $('#message').focus();
                
                var chatnoo = $('#helpno').val();

                // alert(lastDate);
                function check(){
                var lastDate = $('#lastdate').val();
                    $.ajax({
                        type: 'POST',
                        url: 'contentCheck.do',
                        data: {chatno : chatnoo, lastdate : lastDate},
                        success: function(result) {
                            switch(result){
                                case "100" :  $("#board").load(window.location.href + "#board");
                                                break;
                                case "900" : alert("새로운 글 없음");
                                                break;
                            }
                        }
                    });
                }
 
            });
            
		</script>

    </head>
	<body style=" background-color: #faf0d3;">
        <div style="height: 80%; overflow: scroll;" id="board">
            <div id="board" style="margin-top: 5%; height: 80%; width: 100%;">
                <input type="hidden" id="userid" value="${loginUser.getUserid()}">
                <input type="hidden" id="helpno" value="${help.helpno}">
                 <input type="hidden" id="lastdate" value="${lastDate}">
                
                <c:if test="${loginUser.getUserid() eq chat.chathelp}">
                    <c:forTokens var="content" items="${chat.chatcontent}" delims="," varStatus="status">
                        <c:set var="doneLoop" value="false"/>
                        <c:if test="${st eq '1' && content ne '1' && content ne '2'}">
                            <span class="main-button" style=" border-radius: 15px; background-color: #fff; color: black; float: right; border: 2px solid black; margin-right: 3%;">
                                <c:out value="${content}"></c:out>
                            </span>
                            <br><br><br>
                        </c:if>
                        <c:if test="${st eq '2'&& content ne '1' && content ne '2'}">
                            <span class="main-button" style=" border-radius: 15px; background-color: #ffdc6b;color: black; float: left; border: 2px solid black; margin-left: 3%;">
                                <c:out value="${content}"></c:out>
                            </span>
                            <br><br><br>
                        </c:if>
                        <c:if test="${content eq '1'}">
                            <c:set var="st" value="1"></c:set>
                            <c:set var="doneLoop" value="true"/>
                        </c:if>
                        <c:if test="${content eq '2'}">
                                <c:set var="st" value="2"></c:set>
                                <c:set var="doneLoop" value="true"/>
                        </c:if>                    
                    </c:forTokens>
                </c:if>
                <c:if test="${loginUser.getUserid() eq chat.chathelper}">
                    <c:forTokens var="content" items="${chat.chatcontent}" delims="," varStatus="status">
                        <c:set var="doneLoop" value="false"/>
                        <c:if test="${st eq '1' && content ne '1' && content ne '2'}">
                            <span class="main-button" style=" border-radius: 15px; background-color: #ffdc6b;color: black; float: left; border: 2px solid black; margin-left: 3%;">
                            <c:out value="${content}"></c:out>
                        </span>
                        <br><br><br>
                    </c:if>
                    <c:if test="${st eq '2'&& content ne '1' && content ne '2'}">
                        <span class="main-button" style=" border-radius: 15px; background-color: #fff; color: black; float: right; border: 2px solid black; margin-right: 3%;">
                                <c:out value="${content}"></c:out>
                            </span>
                            <br><br><br>
                        </c:if>
                        <c:if test="${content eq '1'}">
                            <c:set var="st" value="1"></c:set>
                            <c:set var="doneLoop" value="true"/>
                        </c:if>
                        <c:if test="${content eq '2'}">
                                <c:set var="st" value="2"></c:set>
                                <c:set var="doneLoop" value="true"/>
                        </c:if>                    
                    </c:forTokens>
                </c:if>

             </div>
                 <div style="height: 20% !important;">
                    <br><br>
                </div>
            </div>
            <div style="width: 100%; position: fixed; bottom: 0px;">
               <input type="text" onkeydown="onKeyDown();" onclick="inputclick();"id="message" placeholder="메시지 입력" style="border-color: white; border-radius: 0px; width: 80% !important; float: left; background-color: white;">
               <button type="submit" onclick="onKeyDown();" style="width: 20%; background-color: #fcc159; color: white; height: 40px; border-color: white; float: right; font-weight: 500;" >보내기</button>

              

               <c:if test='${loginUser.getUserid() eq help.helpid}'>
                    <input type="hidden" id="status" value="help">
               </c:if>
               <c:if test='${loginUser.getUserid() eq help.helperid}'>
                    <input type="hidden" id="status" value="helper">
               </c:if>
            </div>


           <script>
               function inputclick(){
                   location.href="chatting.do?helpno=${chat.chatno}";
               }

               function onKeyDown(){
                    var text = $('#message').val();
                    var userid = $('#userid').val();
                    var status = $('#status').val();
                    var chatno = $('#helpno').val();

                    if(event.keyCode == 13)
                    {
                    $.ajax({
                        type : 'POST',
                        url : 'chatInput.do',
                        data : {text: text, userid : userid, status : status, chatno : chatno},
                        success: function(result){
                            switch(result){
                                case "100" : $('#message').val("");
                                            $('#message').focus();
                                            location.href="chatting.do?helpno=${chat.chatno}";
                                            break;
                            }
                        }
                    });
               }
                    }

                   
           </script>
            
            
           
       

	

		<!-- jQuery Plugins -->
		<script type="text/javascript" src="resources/js/jquery.min.js"></script>
		<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
		<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=true"></script>
		<script type="text/javascript" src="resources/js/google-map.js"></script>
		<script type="text/javascript" src="resources/js/main.js"></script>

	</body>
</html>
