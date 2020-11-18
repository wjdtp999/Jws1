<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 
 
 
 <form method='post' action='product_save.jsp' enctype="multipart/form-data"> 
   <table>
      <tr>
        <td>제품명</td>
       	<td><input type='text' name='pd_name'></td>
      </tr>
       <tr>
        <td>판매금액</td>
        <td><input type='number' name='pd_price'></td>
       </tr> 
 		<tr>
 		 <td>cpu</td>
 		 <td><input type='text' name='cpu'></td>
 		</tr>
 		<tr>
 		 <td>ram</td>
 		 <td><input type='text' name='ram'></td>
 		</tr>
 		<tr>
 		 <td>ssd</td>
 		 <td><input type='text' name='ssd'></td>
 		</tr>
 		<tr>
 		 <td>M.B</td>
 		 <td><input type='text' name='mb'></td>
 		</tr>
 		<tr>
 		 <td>수량</td>
 		 <td><input type='number' name='am'></td>
 		</tr>
 		<tr>
 		  <td>제품 상세 설명 이미지</td>
 		  <td><input type='file' name='detail_img'></td>
 		</tr>
 		<tr>
 		 <td>제품 이미지</td>
 		 <td><input type='file' name='pd_img'></td>
 		</tr>
 		<tr>
 		  <td>소프트웨어</td>
 		  <td><input type='file' name='pd_soft'></td>
 		</tr>
 		 <tr>
 		   <td colspan='2'><button>등록</button></td>
 		   </tr>
   </table>
 
 
 
 
 
 </form>