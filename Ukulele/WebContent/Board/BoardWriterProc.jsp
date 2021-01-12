<%@page import="Board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="boardbean" class="Board.BoardBean">
 <jsp:setProperty name="boardbean" property="*" />
</jsp:useBean>

<%
	BoardDAO bdao =new BoardDAO();
	bdao.insertBoard(boardbean);
	response.sendRedirect("../index.jsp?page=Board/BoardList");
%>





    