<%@page import="notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="noticebean" class="notice.NoticeBean">
<jsp:setProperty name="noticebean" property="*" />
</jsp:useBean>

<%
	NoticeDAO ndao = new NoticeDAO();
	ndao.noticeSearch(request.getParameter("search"));
	response.sendRedirect("../index.jsp?page=notice/NoticeSearchList");
%>