<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("UTF-8"); %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href='${path }my_style.css'>

<c:if test="${part !=null }">
	<link rel='stylesheet' href='${path }lib/${part }.css'>
	<script type='text/javascript' src='${path }lib/${part }.js'></script>
</c:if>

</head>
<body>

<div id='main_view'>
	<div id='head'>
		<%@include file="header.jsp" %>
	</div>
	
	<div id='middle'>
		<span id='menu'>
			<jsp:include page="menu.jsp"/>
		</span>
		<span id='main_content'>
			<c:choose>
				<c:when test="${part!=null }">
					<jsp:include page="${page_path }.jsp"/>
				</c:when>
				<c:otherwise>
					<jsp:include page="content.jsp"/>
				</c:otherwise>
			</c:choose>
		</span>
	</div>
	
	<div id='foot'>
		<%@include file="foot.jsp" %>
	</div>
</div>


</body>
</html>