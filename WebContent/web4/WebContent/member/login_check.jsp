<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.member.member , java.sql.*, javax.sql.*, javax.naming.*" %>
    
<%
Connection conn=null;

Context init = new InitialContext();
DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
conn = ds.getConnection();


	String id = request.getParameter("login_id");
	String pw = request.getParameter("login_pw");
	
	String sql ="select * from member where id='"+id+"' and pw='"+pw+"'";
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	if(rs.next()){
		member user = new member();
		user.setJoin_id(id);
		user.setJoin_name(rs.getString("name"));
		user.setJoin_tel(rs.getString("tel"));
		user.setJoin_email(rs.getString("email"));
		session.setAttribute("login", user);
%>
	<script>
		location.href="index.jsp";
	</script>
<% } else{%>
	<script>
		alert("비밀번호가 맞지않습니다.");
		location.back(-1);
	</script>	
<%}%>
	<script>
		alert("아이디가 존재하지않습니다.");
		location.back(-1);
	</script>




