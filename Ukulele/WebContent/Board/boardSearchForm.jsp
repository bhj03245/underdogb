<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp"/>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
<div id = "boardTitle">
<form action ="boardSearchProc.jsp" method = "get">
<ul>
<div class="col-xs-2 col-md-2"></div>
	<div class="col-xs-8 col-md-8"><br>
	<h2 class="text-center">검색</h2><p>&nbsp;</p>
	<div class="table table-responsive">
<li><input type = "hidden" name = "readcount" value = "0"></li>
<li><label for = "제목">제목</label>
<input type = "text" name = "titleSearch" autofocus="autofocus" required="required" placeholder="제목입력">
</li>
<li><input type = "image" src = "images/search.jpg" class = "kh01"></li>
</ul>
</form>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	String num = request.getParameter("num");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String writer = request.getParameter("writer");
	String reg_date = request.getParameter("reg_date");
	String readcount = request.getParameter("readcount");
	if(num==null||num.equals("0")){
		out.print("");
	}
	else{
%>	
<a href="index.jsp?page=Board/BoardList">게시판 목록</a>&nbsp;
<a href="index.jsp?page=Board/BoardWrite">게시판 작성</a>
</div>
<div id="boardResult">
<table border="1" cellspacing="0" cellpadding="0"> 
<tr>
	<th>번호</th>
	<th>제목</th>
	<th>내용</th>
	<th>작성자</th>
	<th>날짜</th>
	<th>조회수</th>
</tr>
<tr>
<% out.print("<td>"+num+"&nbsp</td><td>"+subject+"&nbsp</td><td>"+content+"&nbsp</td><td>"+writer+"&nbsp</td><td>"+reg_date+"&nbsp</td><td>"+readcount+"</td>");%>
</tr>
<% } %>
</table>
</div>
</div>
</body>
</html>