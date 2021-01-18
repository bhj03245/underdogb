<%@page import="file.FileVO"%>
<%@page import="gallery.Paging"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="Header.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KHJSP</title>
<style>
#Gallery2 {
   float: left;
   position: relative;
   top: 100px;
   left: 250px;
}

.photo {
   width: 200px;
   height: 200px;
   border: 1px solid pink;
   margin: 10px;
}

.gal {
   display: inline-block;
}

#gal_line {
   display: flex;
}

#preview{
   display: flex;
}
</style>
</head>
<body>
   <div class="row">
      <div class="col-xs-2"></div>
      <div class="col-xs-8 col-md-8">
         <h2 class="text-center">갤러리</h2>
         <p class="text-right">
            <input type="button" value="글쓰기"
               onclick="location.href='index.jsp?page=Gallery/GalleryWrite'"
               class="btn">
         </p>


         <c:set var="i" value="0" />
         <c:set var="j" value="4" />
         <div>
            <c:forEach items="${requestScope.list }" var="l">
               <c:if test="${i%j == 0 }">
                  <div id="gal_line">
                     </c:if>
                     <table class="gal" border=1>
                     <tr>
                        <td colspan="3"><a id="preview" href="SelectOne?num=${l.num }"><img
                              src="Upload/${l.fileName }" class="photo"></a></td>
                     </tr>
                     <tr class="lll">
                        <td>${l.num}</td>
                        <td>${l.subject}</td>
                        <td>${l.writer}</td>
                     </tr>
                     </table>
                     <c:if test="${i%j == j-1 }">
                  </div>
               </c:if>
               <c:set var="i" value="${i+1 }" />
            </c:forEach>
         </div>
      </div>
   </div>
</body>
</html>