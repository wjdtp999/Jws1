<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${login !=null }">
	<c:remove var="login" scope="session"/>
</c:if>
<c:redirect url="../index.jsp" />
  
    