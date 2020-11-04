<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
 String name=request.getParameter("my_name");
 int age=Integer.parseInt(request.getParameter("my_age"));
 String job=request.getParameter("my_job");
 String[] hob=request.getParameterValues("interest");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>저장 페이지</title>
<script>
window.onload=function(){
	var name='<%=name %>';
	var age=<%=age %>;
		alert(name);
		alert(age);
		
}

</script>
</head>
<body>
<%="이름 :"+name+"<br>" %>
<%="나이 :"+age +"<br>"%>
<%="직업 :"+job+"<br>" %>
<% for(int i=0; i<hob.length;i++){ %>
 <%=hob[i]+" " %>
<% } %>
              <!-- include 는 menu jsp에 페이지내용과 현재페이지내요을같이 띄워주고 forward는 forward된것만 보여줌  -->
              나는text.jsp이비낟.
<%pageContext.forward("menu.jsp"); %>
include되었다.
<%=request.getParameter("my_age") %>
</body>
</html>