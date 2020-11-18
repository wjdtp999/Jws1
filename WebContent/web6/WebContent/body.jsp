<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:if test="${pg!=null }">
	<jsp:include page="${pg }"/>
</c:if>

<c:if test="${pg == null }">
	<c:if test="${part ==null }">
	    <div class='most'>
	    	<span class='item'>
	    	물물교환 최근 소식
	<c:set var="item" value="<%=new mytag.db_lib().item() %>"/>
	<c:choose>
		<c:when test="${item!=null }">
			<table>
				<tr>
					<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>제안</th>
				</tr>
				<c:forEach var="data" items="${item }" varStatus='st'>
				<tr>
					<td>${st.count}</td>
					<td>${data.getTitle() }</td>
					<td>${data.getName() }</td>
					<td>${data.getDATE() }</td>
					<td>${data.getSug() }</td>
				</tr>
				</c:forEach>
			</table>
		</c:when>
		<c:otherwise>
			등록된 글이 없습니다.
		</c:otherwise>
	</c:choose>
	    	</span>
	    	<span class='labor'>
	    	품앗이 최근 소식
	<c:set var="labor" value="<%=new mytag.db_lib().labor() %>"/>
	
	<c:choose>
		<c:when test="${labor!=null }">
			<table>
				<tr>
					<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>제안</th>
				</tr>
				<c:forEach var="data" items="${labor}" varStatus='st'>
				<tr>
					<td>${st.count}</td>
					<td>${data.getTitle() }</td>
					<td>${data.getName() }</td>
					<td>${data.getDATE() }</td>
					<td>${data.getSug() }</td>
				</tr>
				</c:forEach>
			</table>		
		</c:when>
		<c:otherwise>
			등록된 글이 없습니다.
		</c:otherwise>
	</c:choose>
	    	</span>
	    </div>
	    <div class='notice'>
	      	공지사항
	<c:set var="notice" value="<%=new mytag.tag().notice_list() %>"/>
	<c:forEach var="data" items="${notice }">
	${data.getNum() } 
	${data.getTitle() }
	${data.getDate() }
	<br>
	</c:forEach>
	
	    </div>
	</c:if>
	<c:if test="${part!=null}">
		<jsp:include page="${part }.jsp"/>
	</c:if>
</c:if>