<%@page import="license.LicenseDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="licensebean" class="license.LicenseBean">
	<jsp:setProperty name="licensebean" property="*" />
</jsp:useBean>
<%
	LicenseDAO ldao = new LicenseDAO();
	ldao.apply(licensebean);
%>
<script type="text/javascript">
	alert("��û �Ϸ� �Ǿ����ϴ�.");
	location.href='../index.jsp'
</script>

