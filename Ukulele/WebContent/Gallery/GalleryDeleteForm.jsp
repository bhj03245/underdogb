<%@page import="file.FileBean"%>
<%@page import="file.FileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
<%
	FileDAO dao = new FileDAO();
	int num = Integer.parseInt(request.getParameter("num"));
	// 하나의 게시글을 리턴
	FileBean bean = dao.getOneUpdateGallery(num);
%>
<div class="row">
 <div class="col-xs-2 col-md-2"></div>
 	<div class="col-xs-8 col-md-8">
 		<h2 class="text-center">글 삭제하기</h2><p>&nbsp;</p>
 		<form action="Gallery/GalleryDeleteProc.jsp" method="post" >
 		  <div class="table table-responsive">
	 		<table class="table">
	 			<tr>
	 				<td class="danger">작성자</td>
	 				<td><%= bean.getWriter() %></td>
	 				<td class="danger">작성일</td>
	 				<td><%= bean.getReg_date() %></td>
	 			</tr>
	 			<tr>
	 			  <td class="danger">제목</td>
	 			  <td colspan="3"><%= bean.getSubject() %></td>
	 			</tr>
	 			
	 			<tr>
	 			 <td class="danger">패스워드</td>
	 			 <td><input type="password" name="password"  class="form-control"></td>
	 			</tr>
	 			
	 			<tr>
	 			  <td colspan="4" class="text-center">
	 			  	 <input type="hidden"  value="<%= bean.getNum() %>"  name="num" >
	 			  	 <input type="submit" value="글삭제" class="btn btn-danger">&nbsp;&nbsp;
	 			  	 <input type="button" class="btn btn-primary" onclick="location.href='selectService'" value="목록보기">
	 			  </td>
	 			</tr>
	 			
	 		 </table>
	 	   </div>
 		</form>
	 </div>
</div>

</body>
</html>