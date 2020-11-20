<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/web6/front_lib/my.css">
<link rel='stylesheet' href='http://localhost:8080/web6/front_lib/share.css'>
<script type="text/javascript" src="http://localhost:8080/web6/front_lib/my.js"></script>
</head>
<body>
<div id='top'>
<jsp:include page="../client.jsp"/>
</div>
<br>


<div id='select_list'>
<ul>
	<li><a href='mybag.do?part=prd'>등록 상품</a></li>
	<li><a href='mybag.do?part=sug'>제안 목록</a></li>
	<li><a href='mybag.do?part=most'>최근본상품</a></li>
	<li><a href='mybag.do?part=recommender'>추천상품</a></li>
	<li><a href='mybag.do?part=call'>찜한상품</a></li>
</ul>
</div>

<div id='my_list'>
<jsp:include page="${pg }"/>
</div>
</body>
</html>