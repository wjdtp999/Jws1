<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${fail }">
	<script>
		alert("아이디또는 비밀번호가 잘못되었습니다.");
	</script>
	<c:remove var="fail" scope="session"/>
</c:if>


<link rel="stylesheet" type="text/css" href='http://localhost:8080/web6/front_lib/login.css'>
<div id='login_form'>
<div id='logo'>
	물물교환
</div>    
<form method='post' action='login.do'>
<input type='hidden' name='part' value='login'>

<div id='id'>
<input type='text' name='login_id' id='login_id' placeholder='아이디'>
</div>
<div id='pw'>
<input type='password' name='login_pw' id='login_pw' placeholder='비밀번호'>
</div>
<button id='login_bt'>로그인</button>
</form>
</div> 
