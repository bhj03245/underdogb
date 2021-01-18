<%@page import = "gallery.GalleryBean"%>
<%@page import = "gallery.GalleryDAO"%>
<%@page import = "file.FileDAO" %>
<%@page import = "file.FileVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp"/>
</head>
<body>
<%
	int num =Integer.parseInt(request.getParameter("num").trim());//공백제거후 정수형으로 바뀜
	//데이터 베이스 접근
	FileDAO dao =new FileDAO();
	//boardbean 타입으로 하나의 게시를 리턴
	FileVO vo =dao.SelectOne(num);
	
%>

<div class="row">
	<div class="col-xs-2 col-md-2"></div>
	<div class="col-xs-8 col-md-8">
	<h2 class="text-center">게시글 보기</h2><p>&nbsp;</p>
	<div class="table table-responsive">
		<table class="table">
		<tr>
			<th class="success">글번호</th>
			<td>${requestScope.vo.num}</td>
			<th class="success">조회수</th>
			<td>${requestScope.vo.readcount}</td>
		</tr>
		  
		
		<tr>
			<th class="success">작성자</th>
			<td>${requestScope.vo.writer}</td>
			<th class="success">작성일</th>
			<td>${requestScope.vo.reg_date}</td>
		</tr>
		
		<tr>
			<th class="success">이메일</th>
			<td colspan="3">${requestScope.vo.email}</td>
		</tr>
		
		<tr>
			<th class="success">제목</th>
			<td colspan="3">${requestScope.vo.subject}</td>
		</tr>
		
		<tr>
			<th class="success">글 내용</th>
			<td colspan="3">${requestScope.vo.content}</td>
		</tr>
		<tr>
			<th class = "success">이미지</th>
			<td colspan = "3"><img src = "Upload/${requestScope.vo.fileName}" class = "photo" style = "width:300px; height: 300px;"></td> 
		</tr>
		
		<tr>
			<td colspan="4" class="text-center">
			  <input type="button" class="btn btn-success"  value="답글 쓰기" 
onclick="location.href='index.jsp?page=Gallery/GalleryReWriteForm&&num=<%=vo.getNum()%>&ref=<%=vo.getRef() %>&re_step=<%= vo.getRe_step() %>&re_level=<%=vo.getRe_level() %>'"  		  >
	<input type="button" class="btn btn-warning" value="수정하기" onclick="location.href='index.jsp?page=Gallery/GalleryUpdateForm&num=<%= vo.getNum()%>'">		  
<input type="button" class="btn btn-danger" value="삭제하기" onclick="location.href='index.jsp?page=Gallery/GalleryDeleteForm&num=<%= vo.getNum()%>'">
<input type="button" class="btn btn-primary" value="목록보기" onclick="location.href='index.jsp?page=Gallery/GalleryList'">
			</td>
		</tr>
	
			
		
		</table>
	</div>
	
	</div>
</div>
</body>
</html>