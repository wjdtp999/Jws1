<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<sql:setDataSource var="conn" driver="oracle.jdbc.driver.OracleDriver" 
 url="jdbc:oracle:thin:@localhost:1521:orcl" 
 user="wjdtp999" password="123456"/>
 
 <%-- 
 <sql:update dataSource="${conn}">
  	create table jstl (num number(3) primary key, name varchar(20),
  	age number(2))
 </sql:update> //테이블생성
 --%>
 
 
 <%-- 테이블안에 데이터 넣어줌
 <% String[] name=new String[]{"김유신","이순신","최무선","최영","문익점"};
     request.setAttribute("name", name);
 %>
 <c:set var="i" value="1"/>
 <c:forEach var="n" items="${name }">
 <sql:update dataSource="${conn}">
  	insert into jstl(num,name,age) values(${i },'${n }',25)
 </sql:update>
 <c:set var="i" value="${i+1 }"/>
 </c:forEach>
 --%>
 
 <sql:query var="rs" dataSource="${conn }">
     select * from jstl 
 
 </sql:query>
 
 <c:forEach var="data" items="${rs.rows }">
    ${data.num }
    ${data.name }
    ${data.age }
    <br> 
 </c:forEach>
 
 
 somenaeil
 byte