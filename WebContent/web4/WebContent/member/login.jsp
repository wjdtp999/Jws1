<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${fail!=null }">
<script>
	alert("아이디또는 비밀번호가 틀렸습니다.");
</script>
</c:if>

 <div id='login_write'>
 
 <form name='login_f' method='post' action='login.do'>
 <input type='hidden' name='part' value='login'>
 
 <div class='login_list'>
 	<div class='login_title'>아이디</div>
 	<div class='login_input'>
 		<input type='text' id='login_id' name='login_id'>
 	</div>
 </div>
 <div class='login_list'>
 	<div class='login_title'>비밀번호</div>
 	<div class='login_input'>
 		<input type='password' id='login_pw' name='login_pw'>
 	</div>
 </div>
 <div>
 	<button type='button' id='login_bt'>로그인</button>
 </div>
 </form>
 </div>