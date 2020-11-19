<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	table tr td{text-align:center;}
</style>
<script>
function winopen(param){
	var url="http://localhost:8080/web6/"+param;
	window.open(url);
}

</script>
<a href='${m }.chg?part=write'>등록하기</a>

<table>
	<tr>
		<th width="80">번호</th><th width="200">제목</th><th width="100">작성자</th><th width="100">작성일</th><th width="80">제안</th>
	</tr>
	<c:choose>
		<c:when test="${list.hasPage() }">
				<c:forEach var="data" items="${list.getContent() }">
					<tr>  
						<td>${data.getNum() }</td>
						<td><a href="javascript:winopen('${m }.chg?part=view&num=${data.getNum() }')">${data.getTitle() }</a></td>
						<td>${data.getName() }</td>
						<td>${data.getDATE() }</td>
						<td>${data.getSug_count() }</td>
					</tr>				
				</c:forEach>
				<tr>
					<td colspan='5'>
					<c:if test="${list.getStartPage()> 10 }">
					<a href="${m }.chg?pnum=${list.getStartPage()-10}">[이전]</a>
					</c:if>
					<c:forEach var="pn" begin="${list.getStartPage() }" end="${list.getEndPage() }">
					 <a href="${m }.chg?pnum=${pn}">[${pn }]</a>
					</c:forEach>
					<c:if test="${list.getEndPage()<list.getTotalPage() }">
						<a href="${m }.chg?pnum=${list.getStartPage()+10}">[다음]</a>
					</c:if>
					</td>
				</tr>
		</c:when>
		<c:otherwise>
			등록된 글이 없습니다.
		</c:otherwise>
	</c:choose>
</table>