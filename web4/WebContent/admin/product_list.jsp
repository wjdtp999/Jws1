<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>

<%@ page import="java.util.*, com.pc.product"  %>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%request.setCharacterEncoding("UTF-8"); %>
<%

	Connection conn=null;

	Context init =new InitialContext();
	DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
	conn =ds.getConnection();
	
%>
  <style>
  
  </style>
  
  <div>
   <a href='index.jsp?page=pc_product'>제품등록</a>
  </div>
   <div>
    <form method='get' action='index.jsp'>
      <input type='hidden' name='page' value='product_list'>
      <input type='hidden' name='cmd' value='search'>
      제품명<input type="text" name="search">
      <button>검색</button>
      제품가격<input type='number' name='min'>~
      <input type='number' name='max'>
      <button>검색</button>
    </form>
   </div>
   
    <div>
    <table>
      <tr>
        <th width=50>제품번호</th>
        <th width=300>제품 명</th>
        <th width=150>가격</th>
        <th width=150>등록일</th>
        <th width=80>조회수</th>
    </table>
    </div>
       
     <div>
        <table id="product">
             <%             
                        //내가 include를 사용했는지 forward를사용했는지 구분해야됨
                String cmd=request.getParameter("cmd");  //getparameter로 name cmd 가져옴
                String ser=request.getParameter("search"); //getparameter로 name search가져옴 
                String num1=request.getParameter("min");
                String num2=request.getParameter("max");
                
                int min = num1!=null ? Integer.parseInt(num1):0;
            	int max = num2!=null ? Integer.parseInt(num2):0;
            	 String sql="select * from pc order by num desc"; //sql문생성
                if(cmd!=null){ 
                	if(max>=1)
                	    sql="select * from pc wher pc_price>="+min+" and pc_price<="+max+" order by num desc";   // 등록된금액이 min보다 크거나 같거나 그리고 max보다 작을떄 데이터를 불러옴 	
                	else
                	sql="select * from pc where pc_name like'%"+ser+"%' order by num desc"; // 양쪽에 %를붙여주면 %의의미는 다른글씨기떄문에 찾을 제목에 완전히이름을 안맞춰도 검색이됨 =equlas 사용이아니라 like 를사용  
                															//p% p로시작하는모두 %p p로끝나는 모두 %p% p가하나라도있는
                }                                                    
                    
                	
                	
             // order by 컬럼이름 정렬해주는 문  데이터가 많을경우에는 불가 자바에서 어레이리스트로 담은뒤 자바스크립트로 넘겨야됨
             // order by num desc << 내림차순
 				//String sql="select * from pc order by num"; 
                
                //stmt문으로 데이터가져옴
             	Statement stmt=conn.createStatement();
                          //resultset 으로 데이터담음
             	ResultSet rs=stmt.executeQuery(sql);
                          while(rs.next()){
             %>
              <tr>
                  <td width=80 align="center"><%= rs.getInt("num") %></th>
       			  <td width=300 align="center"><a href="index.jsp?page=product_view&num=<%=rs.getInt("num")%>"><%= rs.getString("pc_name") %></a></th>
      			  <td width=150 align="center"><%= rs.getInt("pc_price") %></th>
      			  <td width=150 align="center"><%= rs.getDate("pc_date") %></th>
     		      <td width=80 align="center"><%= rs.getInt("hit") %></th>
     		      <td width=40 ><a href='product_delete.jsp?num=<%=rs.getInt("num") %>'>삭제</a></td>
              </tr>
             <%}
              rs.close(); 
              stmt.close();
              conn.close(); //데이터를 모두 가져온뒤 닫음
             %>
      </table>
     </div>