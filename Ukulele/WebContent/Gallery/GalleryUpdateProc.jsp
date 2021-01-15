<%@page import="gallery.GalleryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="gallerybean" class="gallery.GalleryBean">
  <jsp:setProperty name="gallerybean" property="*" />
</jsp:useBean>
<%
 	GalleryDAO dao =new GalleryDAO();
	String pass=dao.getPass(gallerybean.getNum());
	if(pass.equals(gallerybean.getPassword())){
		dao.updateGallery(gallerybean);
		response.sendRedirect("../index.jsp?page=Gallery/GalleryList");
		
	}
	else{
%>
<script>
	alert("패스워드가 일치 하지 않습니다. 다시 확인 후 수정해주세요.");
	history.go(-1);
</script>
<%
	}
%>





