<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div>
<ul>
<li><a href="index.jsp?page=Bussiness/licenseIndex&subpage=licenseGuidance" id="guidance">�ڰ��� ����</a></li>
<li><a href="index.jsp?page=Bussiness/licenseIndex&subpage=applyLicenseGuidance" id="apply" onclick="sessioncheck()">�ڰ��� ��û</a></li>
</ul>
</div>
<script type="text/javascript">
function sessioncheck() {
	if(<%=session.getAttribute("id")%>==null){
		alert("���� �α��� ���ּ���.");
		event.preventDefault();
	}
}
</script>
	
</body>
</html>