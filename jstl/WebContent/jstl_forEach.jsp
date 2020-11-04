<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
    <c:forEach var="i" begin="1" end="10" step="1">
    ${1 }<br>
    
    
    </c:forEach>
    
    <% 
      int[] arr=new int[]{11,22,33,44,55,66,77,88};
      request.setAttribute("arr",arr);
     %>
     
     
     <c:forEach var="n" items="${arr}">
     ${n }
     
     </c:forEach>
     
     <c:set var="subject" value="국어-영어-수학-과학-체육"/>
     <!--  forTokens 은 주로 문자열을 위해 사용하는 반복문 -->
     <c:forTokens items="${subject }" delims="-" var="sub">
        ${ sub }
     
     </c:forTokens>