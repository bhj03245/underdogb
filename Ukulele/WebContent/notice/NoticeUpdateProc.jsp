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
	String pass = ndao.getPass(noticebean.getNum());
	if(pass.equals(noticebean.getPassword())){
		ndao.updateNotice(noticebean);
		response.sendRedirect("../index.jsp?page=notice/NoticeList");	
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





