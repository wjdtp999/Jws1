<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
  <%@ page import="com.pc.product" %>
  
  <%
     int num=Integer.parseInt(request.getParameter("num"));
     product pd=(product)session.getAttribute("pd");
     if(pd!=null && num == pd.getNum()) {
  %>  
   		<form method="post" action="product_save.jsp" enctype="multipart/form-data">
   		<input type='hidden' name='cmd' value='mody'>  <!--product save 파일에서 구현해논 데이터베이스의 저장방법에서 새등록이아닌 수정을하기위한작업인지 구별하기위해서 생성 -->
          <table>
     	 <tr>
     	  <td>제품명</td>
     	  <td> <input value='<%=pd.getPd_name() %>' type='text' name='pd_name'></td>
     	 </tr>
     	  <tr>
     	  <td>제품가격</td>
     	  <td> <input value='<%=pd.getPd_price() %>' type='text'name='pd_price'></td>
     	  </tr>
     	  <tr>
     	  <td>cpu</td>
     	  <td> <input value='<%=pd.getCpu() %>' type='text' name='cpu'></td>
     	  </tr>
     	  <tr>
     	  <td>ram</td>
     	  <td><input value='<%=pd.getRam() %>' type='text' name='ram'></td>
     	  </tr>
     	  <tr>
     	  <td>ssd</td>
     	  <td> <input value='<%=pd.getSsd() %>' type='text' name='ssd'></td>
     	  </tr>
     	  <tr>
     	  <td>메인보드</td>
     	  <td> <input value='<%=pd.getMb() %>' type='text' name='mb'></td>
     	  <tr>
     	  </tr>
     	  <td>수량</td>
     	  <td> <input value='<%=pd.getAm() %>' type-='text' name='am'>개</td>
     	  <tr>
     	  </tr>
     	 <tr>
     	  <td>상세설명이미지</td>
     	  <td> <input type='file' name='detail_img'><%=pd.getDetail_img()%></td>
     	  </tr>
     	  <tr>
     	  <td>제품이미지</td>
     	  <td> <input  type='file' name='pd_img'><%=pd.getPd_img() %></td>
		  </tr>
		  <tr>
		  <td>소프트웨어</td>
     	  <td> <input type='file' name='pd_soft'><%=pd.getPd_soft() %></td>
     	 </tr>
	</table>
	<button>수정</button>
	</form>
  <% }%>