<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:requestEncoding value="UTF-8"/>

<!--  지역 설정 -->
<fmt:setLocale value="en_US"/>

<c:set var="now" value="<%= new java.util.Date() %>"/>
<!-- value값 나라의 시간으로 설정됨 -->
<fmt:timeZone value="Hongkong">
<fmt:formatDate value="${now }" type="both" dateStyle="full" timeStyle="full"/>
</fmt:timeZone>



<!-- 접속한지역에따라 달러 엔화 원 등등 변환  -->
<fmt:formatNumber value="12340000" type="currency"/>
                                   <!-- currencySymblo="$"내지역이 한국이어도 달러도데이터를 받고싶다할때사용 -->
    
    
     <fmt:formatNumber value="0.7" type="percent"/>
     <br>
     <c:forEach var="i" begin="1" end="12" step="1">
     <fmt:formatNumber value="${i/12 }" type="percent"/>
     
     </c:forEach>
     <br>
     <!--                            3자리마다 . 이 생김 내가 표현하고싶은 숫자방식을선택 -->
     <fmt:formatNumber value="10000.10" pattern="#,###.###"/>
                                  <!--   0으로 채우면 비어있는 공백으로 되어있는 수도 같은 자리수로 출력 -->
     <fmt:formatNumber value="10000.10" pattern="0,000.00"/>
     <br>
     
     <!--  미국의 날짜표현식 -->
     <fmt:setLocale value="ja_jp"/>
     <fmt:formatDate value="${now }"/>
     <br>
     
     date<fmt:formatDate value="${now }" type="date"/>
     <br>
     time<fmt:formatDate value="${now }" type="time"/>
     <br>
     both<fmt:formatDate value="${now }" type="both"/>
     
     <br>
     <fmt:formatDate value="${now }" type="both" dateStyle="short" timeStyle="short"/>
     
     <br>
     <fmt:formatDate value="${now }" type="both" dateStyle="medium" timeStyle="medium"/>
     <br>
     <fmt:formatDate value="${now }" type="both" dateStyle="long" timeStyle="long"/>
     <br>
           <!-- 내가원하는형태의 시간으로 만들기 -->
     <fmt:formatDate value="${now }" pattern="yy.MM.dd hh시mm분ss초"/>
     
     
     
     
     
     
     <fmt:bundle basename="test">
      <fmt:message key="name"/><br>
      <fmt:message key="age"/> <br>
     </fmt:bundle>