<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test1</title>
</head>
<body>
	<h2>
		에러 발생 : <%=request.getAttribute("message")%>
	</h2>
	<h3>
		<a href="/Sector/index.html">홈으로</a>
	</h3>
	<h3>
		<a href="javascript:history.go(-1);">이전페이지로 이동</a>
	</h3>
</body>
</html>






