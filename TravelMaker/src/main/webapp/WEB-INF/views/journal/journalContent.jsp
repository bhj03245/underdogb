<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<div id="journalContentContainer">
	<h1>내 여행일지</h1>
	<div id="myJournalList">
		<table>
			<tbody>
				<c:choose>
					<c:when test="${empty journalList }">
						<tr>
							<td colspan="4" align="center">데이터가 없습니다.</td>
						</tr>
					</c:when>
					<c:when test="${!empty journalList}">
						<c:forEach var="list" items="${journalList}">
							<tr>
								<td><c:out value="${list.title}" /></td>
								<td><c:out value="${list.start_dt}" /></td>
								<td><c:out value="${list.end_dt}" /></td>
								<td><c:out value="${list.view_cnt}" /></td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
			</tbody>
		</table>
	</div>
	<div id="createJournalBox">+일지생성</div>
</div>

<script>
   $(document).on('click', '#createJournalBox', function(e){
      e.preventDefault();   
      location.href = "${pageContext.request.contextPath}/journal/create";
   });
</script>