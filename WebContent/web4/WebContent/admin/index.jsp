<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
       	String pg=request.getParameter("page");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <div>
     <jsp:include page="menu.jsp"/>  
   </div>
   <div>
      <% if(pg!=null){ pg += ".jsp";%>
         <jsp:include page="<%=pg%>"/>
        <%} %>	  
    	  
   </div>
</body>
</html>