<%@page import="gallery.GalleryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	request.setCharacterEncoding("UTF-8");
 
 %>
<jsp:useBean id="gallerybean" class="gallery.GalleryBean">
	<jsp:setProperty  name="gallerybean"  property="*"/>
</jsp:useBean>
<%
	GalleryDAO dao =new GalleryDAO();
	dao.reWriteGallery(gallerybean);
	
	response.sendRedirect("../index.jsp?page=Gallery/GalleryList");
%>






