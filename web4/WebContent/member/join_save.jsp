<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("UTF-8"); %>

<sql:setDataSource var="conn" driver="oracle.jdbc.driver.OracleDriver"
url="jdbc:oracle:thin:@localhost:1521:orcl" 
user="jkr" password="123456"/>

<c:set var="num" value="1"/>
<sql:query var="rs" dataSource="${conn }">
	select Max(num) as m from member
</sql:query>

<c:forEach var="data" items="${rs.rows}">
	<c:set var="num" value="${data.m +1}"/>
</c:forEach>

<sql:update dataSource="${conn }">
insert into member(num,id,pw,name,tel,email) values(
${num },'${param.join_id }','${param.join_pw }','${param.join_name }',
'${param.join_tel }','${param.join_email }')
</sql:update>

   
   
   
   