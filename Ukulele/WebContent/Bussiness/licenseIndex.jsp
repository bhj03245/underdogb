<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pagefile = request.getParameter("subpage");
      if(pagefile == null){
    	  pagefile = "licenseGuidance";
      }
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
<div id="left">
	<jsp:include page="licenseLeft.jsp"/>
</div>

<div id="center">
	<jsp:include page='<%=pagefile+".jsp" %>'/>
</div>
</body>
</html>