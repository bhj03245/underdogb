<%@page import="file.FileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	request.setCharacterEncoding("UTF-8");
 
 %>
<jsp:useBean id="filebean" class="file.FileBean">
	<jsp:setProperty  name="filebean"  property="*"/>
</jsp:useBean>
<%
	FileDAO dao =new FileDAO();
	dao.reWriteGallery(filebean);
	
	response.sendRedirect("../selectService");
%>






