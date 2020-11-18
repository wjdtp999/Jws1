<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>물물교환</title>
<link rel='stylesheet' href='http://localhost:8080/web6/front_lib/share.css'>
<link rel='stylesheet' href='http://localhost:8080/web6/front_lib/menu.css'>
<link rel='stylesheet' href='http://localhost:8080/web6/front_lib/first_page.css'>
</head>
<body>
<div id='share'>
<div id='top'>
	<jsp:include page="client.jsp"/>
</div>
<div id='menu'>
	<jsp:include page="menu.jsp"/>
</div>
<div id='content'>
	<jsp:include page="body.jsp"/>
</div>
<div id='foot'>
	<jsp:include page="foot.jsp"/>
</div>
</div>
</body>
</html>