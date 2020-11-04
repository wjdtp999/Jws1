<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="com.member.member" %>
    
    <%
      member my=new member();
     my.setJoin_name("김유신");
     my.setJoin_id("kim");
     request.setAttribute("my",my);
      %>
      ${my.getJoin_name() }
      ${my.getJoin_id()}  <% member m = (member)request.getAttribute("my"); //와같은방식 %>
                                   <%=m.getJoin_name() //이렇게해야출력이될걸 El로 간단화%>      
      
    ${param.name}
    
    ${sessionScope.age}
    
    <br>
    
    
    ${3+5}
    
    ${3 == 5? 10 : 5}