<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>		
	
<c:if test="${user==null }">
 <script>
 	alert("로그인후 이용해주세요");
 	location.href='member/login.jsp';
 </script>
</c:if>
		
		
			<table>
				<tr>
				<td>작성자</td>
				<td>${data.getName() }</td>
				</tr>
				<tr>
				<td>작성일</td>
				<td>${data.getDATE() }</td>
				</tr>
				<tr>
				<td colspan='2'>
						<% String[] img = ((com.exchange.exchange)request.getAttribute("data")).getImg(); 
						for(int i=0; i<img.length; i++){
						if(img[i].equals("null"))continue;		
						%>
					<img src='img/<%=img[i]%>' style='width:100px; height:100px'>
						<%	} %>
				</td>
				</tr>
				<tr>
				<td colspan='2'>
						${data.getContent() }
				</td>
				</tr>
				<tr>
				<td><input type="button" onclick='sugWrite()' value="제안"></td>
				</tr>
				</table>
		<c:if test="${!data.getName().equals(user.getName()) }">
		<div id='sug'>
		<p>================================================</p>
		<form method="post" action="sug.chg">
			<input type="hidden" name="writer" value="$user.getName()">
			<input type="hidden" name='part' value='sug'>
			<input type='hidden' name='num' value='${data.getNum() }'>
			<input type="hidden" name='kind' value='${m }'>
			<input type="hidden" name='who' value='${data.getName() }'>
		제안자 ${user.getName() }<br>
		제안내용 <textarea name="sug_content" rows='5' cols='50'></textarea>
		<button>등록</button> 
		</form>
		</div>
		
		<div id='reply'>
			<p>=============한줄질문 =========</p>
			<form method="get" action='${m }.chg'>
			<input type="hidden" name="part" value="reply">
			<input type="hidden" name="writer" value="${user.getName() }">
			<input type='text' name='rep'> <button>등록</button>
			</form>
		</div>
		</c:if>
		<script>
		var sug=document.querySelector("#sug");
		sug.style.display="none";
		function sugWrite(){
				sug.style.display="inline-block";
		}
		</script>