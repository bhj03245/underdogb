<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String pass=request.getParameter("password");
	int num = Integer.parseInt(request.getParameter("num"));
	
	BoardDAO bdao =new BoardDAO();
	String password =bdao.getPass(num);
	
	if(pass.equals(password)){
		bdao.deleteBoard(num);	
		response.sendRedirect("../index.jsp?page=Board/BoardList");
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

 