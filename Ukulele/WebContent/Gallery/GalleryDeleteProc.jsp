<%@page import="file.FileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String pass=request.getParameter("password");
	int num = Integer.parseInt(request.getParameter("num"));
	
	FileDAO dao =new FileDAO();
	String password =dao.getPass(num);
	
	if(pass.equals(password)){
		dao.deleteGallery(num);	
		response.sendRedirect("../selectService");
	}
	else{
%>


<script>
	alert("패스워드가 틀려서 삭제 할 수 없습니다. 패스워드를 확인해 주세요.");
	history.go(-1);
</script>
		
<%		
		
	}
	
%>   

 