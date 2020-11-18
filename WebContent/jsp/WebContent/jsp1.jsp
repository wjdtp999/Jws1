<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="e1.jsp" import="java.util.*" session="true" %>
   <%@ page import="java.text.*" %>
   <%!
      //변수, 메소드 선언문 if for문 사용불가
    int num=10;
   String name="홍길동";
   public String view(){
	   return "자바 메소드";
   }
    	%>
    	
<%  // if for사용가능 html을 섞고싶을때  !빼기
int age=24;
if(age==24){
	for(int i=1; i<=3;i ++){
		
	
%>     
<h2>24세이다</h2>
<% } } %>   
<!DOCTYPE html>  
<html>

<head>
<meta charset="UTF-8">
<title>jsp</title>
</head>

<body>
<% int[] b=new int[25];
  for(int i=0;i<b.length;i++)
	  b[i]=(int)(Math.random()*50)+1;
%>
<table border=1>
<% for(int i=0; i<5;i++){ %>
<tr>
<% for (int k=0;k<5;k++){ %>
<td><%=b[i*5+k] %></td>
<% } %>
</tr>
<% } %>
</table>



<%=name%>
<%=num %>
<%=view() %>



 <%@ include file="menu.jsp" %> 
 
 <form method='get' action='test.jsp'>
 이름 :<input type='text' name='my_name'> <br>
 나이 :<input type='text' name="my_age"> <br>
 직업 :<input type='text' name='my_job'> <br>
 <input type='checkbox' value='car' name='interest'>자동차
 <input type='checkbox' value='animal' name='interest'>동물
 <input type='checkbox' value='toon' name='interest'>만화
 <input type='checkbox' value='movie' name='interest'>영화
 <input type='checkbox' value='travel' name='interest'>여행 
 <button>전송</button>
 </form>
</body>
</html>