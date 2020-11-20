<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<c:if test="${user ==null }"> 
  <span><a href='login.do'>로그인</a></span>  
  <span><a href='join.do'>회원가입</a></span>
</c:if>
<c:if test="${user!=null }">  
<span>${user.getName() } </span>
<span><a href='mybag.do'>내가방</a></span>  
<span><a href='info.do?part=info'>회원정보</a></span> 
<span><a href='logout.do'>로그아웃</a></span>  
</c:if>