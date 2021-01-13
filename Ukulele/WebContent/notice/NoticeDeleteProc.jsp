<%@page import="notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String pass = request.getParameter("password");
	int num = Integer.parseInt(request.getParameter("num"));
	
	NoticeDAO ndao = new NoticeDAO();
	String password = ndao.getPass(num);
	
	if(pass.equals(password)){
		ndao.deleteNotice(num);	
		response.sendRedirect("../index.jsp?page=notice/NoticeList");
	}
	else{
%>

<script>
	alert("패스워드를 확인해 주세요.");
	history.go(-1);
</script>
		
<%			
	}
%>   

 