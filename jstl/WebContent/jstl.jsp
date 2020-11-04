<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  <!--jstl 사용방법  core 조건문 반복문 출력이 들어있는태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

   변수생성        변수에 데이터 저장      기본은 requset로 들어감 scope=저장할방식
<c:set var="num" value="10" scope="session"/>

<%
// session.setAttribute("num",10);
%>

  <!--  jstl출력방식--> 
<c:out value="${num }"/>
   ${num}
  ${sessionScope.num }

<!-- 데이터를 지워주는작업 -->
<c:remove var="num" scope="session"/>
<!-- response.sendRedirect와같음 -->
<!--<c:redirect url=""/>-->



<!-- 코어에있는 if문 -->
<c:choose>
    <c:when test="${1<3}">
    
    </c:when>
    <c:when test="${122<32 }"> 
    </c:when>
    <c:otherwise> <!-- 위에조건문이둘다 거짓이라면실행 else if -->
    
    </c:otherwise>
</c:choose>
<c:if test="${4<5 }" >
<p>4는 5보다 작다.</p>
</c:if> 

<!-- 코어의 반복문 -->
<c:forEach var="i" begin="1" end="10" step="1">
   ${i }<br>

</c:forEach>