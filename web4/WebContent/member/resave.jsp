<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.* , javax.sql.*, javax.naming.*" %>
<%request.setCharacterEncoding("UTF-8"); %>
<%
	Connection conn=null;
	
	Context init = new InitialContext();
	DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
	conn = ds.getConnection();
	
%>
   <jsp:useBean id="user" class="com.member.member" scope="page"/> 
   <jsp:setProperty name="user" property="*"/>
   
<%
	String sql = "update member set pw='"+user.getJoin_pw()+"'";
	sql += ", tel='"+user.getJoin_tel()+"', email='"+user.getJoin_email()+"'";
	sql += " where id='"+user.getJoin_id()+"'";
	
	Statement stmt = conn.createStatement();
	stmt.executeUpdate(sql);
%>
<script>
	location.href="../index.jsp";
</script>


