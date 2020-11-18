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
	String sql="select *from pc where num="+num;
	
	Statement stmt=conn.createStatement();
	ResultSet rs=stmt.executeQuery(sql);
	
	product pd=null;
	if(rs.next()){
		pd=new product(
				rs.getInt("num"),
				rs.getString("pc_name"),
				rs.getInt("pc_price"),
				rs.getFloat("cpu"),
				rs.getInt("ram"),
				rs.getInt("ssd"),
				rs.getString("mainboard"),
				rs.getInt("pc_ea"),
				rs.getString("detail"),
				rs.getString("pc_img"),
				rs.getString("soft"),
				rs.getDate("pc_date"),
				rs.getInt("hit")
				);
		 session.setAttribute("pd",pd );
	}
	rs.close();
	stmt.close();
	conn.close();
%>

    <table>
     	 <tr>
     	  <td>제품명</td>
     	  <td><%=pd.getPd_name() %></td>
     	 </tr>
     	  <tr>
     	  <td>제품가격</td>
     	  <td><%=pd.getPd_price() %></td>
     	  </tr>
     	  <tr>
     	  <td>cpu</td>
     	  <td><%=pd.getCpu() %></td>
     	  </tr>
     	  <tr>
     	  <td>ram</td>
     	  <td><%=pd.getRam() %></td>
     	  </tr>
     	  <tr>
     	  <td>ssd</td>
     	  <td><%=pd.getSsd() %></td>
     	  </tr>
     	  <tr>
     	  <td>메인보드</td>
     	  <td><%=pd.getMb() %></td>
     	  <tr>
     	  </tr>
     	  <td>수량</td>
     	  <td><%=pd.getAm() %>개</td>
     	  <tr>
     	  </tr>
     	 <tr>
     	  <td>상세설명이미지</td>
     	  <td><img src='../img/<%=pd.getDetail_img() %>' style='width:50px; height:50px;'></td>
     	  </tr>
     	  <tr>
     	  <td>제품이미지</td>
     	  <td><img src='../img/<%=pd.getPd_img() %>' style='width:50px; height:50px;'></td>
		  </tr>
		  <tr>
		  <td>소프트웨어</td>
     	  <td><img src='../img/<%=pd.getPd_soft() %>' style='width:50px; height:50px;'></td>
     	 </tr>
	</table>
	<a href='product_delete.jsp'>삭제</a> /
	<a href='index.jsp?page=product_mody&num=<%=num%>'>수정</a>

  
