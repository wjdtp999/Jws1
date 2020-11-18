<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>물품 등록</title>
</head>
<body>
<c:if test="${user==null }">
 <script>
 	alert("로그인후 이용해주세요");
 	location.href='member/login.jsp';
 </script>
</c:if>
<form method='post' action='${m}.chg?part=board_save' enctype='multipart/form-data'>

<p>작성자</p>
<p>${user.getName() }</p>
<p>제목<input type='text' name='title'></p>
	
<p>내용</p>
<textarea name='content' rows=10 cols=50></textarea> <br>

<input type='file' name='img1'>
<input type='file' name='img2'>
<input type='file' name='img3'>

<button>등록</button>
</form>


</body>
</html>