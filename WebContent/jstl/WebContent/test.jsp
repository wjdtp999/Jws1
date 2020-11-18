<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    // int num=10; //이런식으로 만들어진 변수는 EL로 표현이 불가
    //request.setAttribute("num1", 100);
     //request.getParameter("name"); 
    %>  <!--  El로 파라미터값을 가져오는 방법 -->
    
    ${param("name") }
    
    <%=//num %>
    <!--  
      EL출력방식 출력만가능 jsp 출력방식보다 좀더 광범위한 클래스라던가 출력의 쉽게를하기위해사용 내장객체의데이터만 사용가능 -->
      <%=// request.getAttribute("num1") %> <%// 이방식과같음 %>
 ${num1 }
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
     session.setAttribute("age", 34);
%>
<form method='get' action='eltest.jsp'>
<input type='text' name='name'>
<button>전달</button>


</form>

</body>
</html>