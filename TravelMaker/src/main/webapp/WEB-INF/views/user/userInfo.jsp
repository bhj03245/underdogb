<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>uesrInfo</title>
</head>
<body>
<table border="1">
	<tr>
		<td>���̵�</td>
		<td>${UserVO.id }</td>
	</tr>
	<tr>
		<td>��й�ȣ</td>
		<td>${UserVO.password }</td>
	</tr>
	<tr>
		<td>�̸�</td>
		<td>${UserVO.name }</td>
	</tr>
	<tr>
		<td>�̸���</td>
		<td>${UserVO.email }</td>
	</tr>
<input type="button" value="��������" class="main-btn" onclick="location.href='/main'">
</table>
</body>
</html>