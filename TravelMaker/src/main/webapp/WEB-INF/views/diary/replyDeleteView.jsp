<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% int journal_no = Integer.parseInt(request.getParameter("journal_no")); %>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>게시판</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='deleteForm']");
			
			$(".cancel_btn").on("click", function(){
				location.href = "/diary/info?diary_no=${replyDelete.diary_no}"+"&journal_no="+<%=journal_no%>
			})
			
		})
		
	</script>
	<body>
	
		<div id="root">
			<header>
				<h1> 게시판</h1>
			</header>

			
			<section id="container">
				<form name="deleteForm" role="form" method="post" action="/diary/replyDelete">
					<input type="hidden" name="diary_no" value="${replyDelete.diary_no}" readonly="readonly"/>
					<input type="hidden" id="reply" name="reply" value="${replyDelete.reply}" />
					<input type="hidden" id="journal_no" name="journal_no" value="<%=journal_no %>"/>
					<div>
						<p>삭제 하시겠습니까?</p>
						<button type="submit" class="delete_btn">예 삭제합니다.</button>
						<button type="button" class="cancel_btn">아니오. 삭제하지 않습니다.</button>
					</div>
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>