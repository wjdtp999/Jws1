<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="com.member.member" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<script>
function chk(my){
	var login=false;
<c:if test="${login!=null}">
	login=true;
</c:if>
	if(login){
		location.href=my.href;
	}else{
		alert("로그인을 먼저 해주세요");
		my.href='';
	}
}
</script>

 <ul class='menu_list'>
 <c:choose>
 	<c:when test="${login==null }">
	 	<li><a href='login.do?part=login_in'>login</a> / 
	 		<a href='join.do?part=join_write'>join</a></li>
	</c:when>
	<c:otherwise>
	 	<li> ${login.getJoin_name() } / 
	 	<a href="index.jsp?part=member&page=mody">정보수정</a> /
	 	<a href="login.do?part=logout">로그아웃</a> </li>	
	</c:otherwise>
</c:choose>
 	<li><a href='${pageContext.request.requestURL}'>HOME</a></li>
 	<li><a href='' onclick='chk(this)'>데스크탑</a></li>
 	<li><a href='login.jsp' onclick='chk(this)'>노트북</a></li>
 	<li><a href='' onclick='chk(this)'>모바일</a></li>
 	<li><a href='' onclick='chk(this)'>주변기기</a></li>
 </ul>