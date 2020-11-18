<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.pc.product" %>
<%@ page import="java.util.*, com.pc.product, java.util.Date"  %>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%request.setCharacterEncoding("UTF-8"); %>
<%

	Connection conn=null;

	Context init =new InitialContext();
	DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
	conn =ds.getConnection();
	
	int num=Integer.parseInt(request.getParameter("num"));
	
	String sql="delete from pc where num="+num;
	
	Statement stmt=conn.createStatement();
	stmt.executeUpdate(sql);
	stmt.close();
	conn.close();
	
	response.sendRedirect("index.jsp?page=product_list");
	%>