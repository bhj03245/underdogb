<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pagefile = request.getParameter("subpage");
      if(pagefile == null){
    	  pagefile = "licenseManage";
      }
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div id="left">
	<jsp:include page="MasterLeft.jsp"/>
</div>

<div id="center">
	<jsp:include page='<%=pagefile+".jsp" %>'/>
</div>
</body>
</html>