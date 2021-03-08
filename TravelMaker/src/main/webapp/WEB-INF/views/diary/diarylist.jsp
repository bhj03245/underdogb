 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<style>
#table1 {
position: relative;
width: 70%; margin-left: 15%;
text-align: center;
}

#Btn{
float: right;
}
</style>
<meta charset="UTF-8">
<title>diary</title>
<!--jquery와 4버전부터 지원되는 popper.js를 사용하려면 추가-->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous">
</script>
<!-- <link rel="stylesheet" href="/resources/css/bootstrap1.min.css"> -->
</head>
<body>
<div id="table1">
	<table>
	<thead>
		<tr>
			<th>no</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
		</tr>
	</thead>
	<tbody>
    <c:forEach items="${diarylist}" var="diary">
        <tr>
            <td>${diary.diary_no}</td>
            <td><a class='move' href='<c:out value="${diary.diary_no}"/>'>
            <c:out value="${diary.title}"/></a></td>
            <td>${diary.writer}</td>
            <td><fmt:formatDate pattern="yyyy/MM/dd" value="${diary.regdate}"/></td>
        </tr>
    </c:forEach>
    </tbody>
	</table>
	
	<form id="actionForm" action="/diary/diarylist" method='get'></form>
	<button type="button" id="Btn" class="btn btn-outline-secondary">Write</button>
</div>
	<!-- modal 추가 -->
		<!-- <div class="modal" id="myModal">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title"></h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p>Modal body text goes here.</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
						<button type="button" class="btn btn-secondary"data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div> -->
	<script>
	$(document).ready(function() {
	$('#Btn').on('click',  function(){
	    location.href = "write";
	 });
	
	 var actionForm = $("#actionForm");
	 $(".move").on("click", function(e){
	    	e.preventDefault();
	    	
	    	var targetdiary_no = $(this).attr("href");
	    	console.log(targetdiary_no);
	    	
	    	actionForm.append("<input type='hidden' name='diary_no' value='"+targetdiary_no+"'>'");
	    	actionForm.attr("action", "/diary/info").submit();
	    	
	    });
	 
	});
	</script>

</body>
</html>