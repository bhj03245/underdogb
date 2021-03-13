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
						<div class="plus">
						<div class="section1">
							<div class="bigTitle">
								<div id="title" class="journal_title"><c:out value="${list.title}" /><input type="hidden" value="${list.journal_no}"></div>
								<div id="author"><c:out value="${list.author}"/></div>
								<img src="${pageContext.request.contextPath}/resources/img/plus.png" id="plusBtn">
								<div id="btn">
									<button type="button" value="${list.journal_no}" class="btnUpdate">수정</button>
									<button type="button" value="${list.journal_no}" class="btnDelete">삭제</button>
								</div>
							</div>
							<div class="bigReply">
								<div id="regdate"><c:out value="${list.start_dt}" /> ~ <c:out value="${list.end_dt}" /></div>								
								<img src="${pageContext.request.contextPath}/resources/img/view.png" id="viewImg">
								<div id="view"><c:out value="${list.view_cnt}" /></div>
							</div>
						</div>
						<div class="section2">
							<div id="img"></div>
							<div id="img"></div>
							<div id="img"></div>
						</div>
						</div>
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
   
   $(document).on('click', '#plusBtn', function(){
       $('#btn').show();
       $('#plusBtn').hide();
   });
   
 //수정 버튼 클릭 이벤트
	$(document).on('click', '.btnUpdate', function(){
		var url = "${pageContext.request.contextPath}/journal/update";
		url = url + "?journal_no="+event.target.value;
		url = url + "&mode=edit";
		location.href = url;
	});
 
	//삭제 버튼 클릭 이벤트
	$(document).on('click', '.btnDelete', function(){
    var url = "${pageContext.request.contextPath}/journal/delete";
    url = url + "?journal_no="+event.target.value;
		location.href = url;
	});

	$(document).on('click', '.journal_title', function(){
	    var url = "${pageContext.request.contextPath}/diary/diarylist";
	    url = url + "?journal_no="+event.target.children[0].value;
			location.href = url;
	});
</script>