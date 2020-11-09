<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.* , javax.sql.*, javax.naming.*" %>
<%request.setCharacterEncoding("UTF-8"); %>
     <%
     Connection conn=null;
 	
 	Context init = new InitialContext();
 	DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
 	conn = ds.getConnection();
 	
      String sql="select * from uploadfile";
      Statement st=conn.createStatement();
      ResultSet rs=st.executeQuery(sql);
     %>
    <style>
table tr td{border :1px solid black; padding-left:20px;}    
td{font-size:15pt;}
tr{height:40px;}
    </style>
    
    <table>
    <tr><th width=50>번호</th><th width=300 >파일이름</th><th width=80>확장자</th></tr>
    <% while(rs.next()){ %>
 <tr> 
 	<td><%=rs.getInt("num") %></td>
 	      <!--             jsp 뒤에 ? 는 파라미터를 주겠다는뜻 다운받을 파일이뭐냐 그뒤에 filename rsgetint num값을줌 -->
 	<td> <a href='file_down.jsp?filename=<%=rs.getInt("num")%>'><%=rs.getString("fname") %></a></td>
 	<td><%=rs.getString("enc")  %></td>
     <% } %>
    </table>