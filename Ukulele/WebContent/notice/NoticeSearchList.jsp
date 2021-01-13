<%@page import="java.sql.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="notice.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="notice.NoticeBean"%>
<%@ page import="java.util.Vector"%>
<%@ page import="notice.NoticeDAO"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp" />
<jsp:include page="../top.jsp" />
<style>
.btn {
   background-color: gray;
   color: white;
}

.table, th {
text-align : center;
}

.th1 {
width: 70px;
}

.th2 {
width: 130px;
}
</style>

</head>
<body>
   <%
      String pageNum = request.getParameter("pageNum");
      if (pageNum == null) {
         pageNum = "1";
      }
      NoticeDAO ndao = new NoticeDAO();
      Paging paging = new Paging(pageNum);
      paging.setTotalCount(ndao.getAllCount());
      Vector<NoticeBean> vec = ndao.getAllNotice(paging.getStartRow(), paging.getEndRow());
   %>
<%
	NoticeBean bean = (NoticeBean)request.getAttribute("bean");
%>
   <div class="row">
      <div class="col-xs-2"></div>
      <div class="col-xs-8 col-md-8">
         <h2 class="text-center">공지사항</h2>
         
         <div class="table-responsive">
           <table class="table table-striped"> <!-- bordered 세로줄 / -->
               <tr>
                  <th class="th1">번호</th>
                  <th>제목</th>
                  <th class="th2">작성자</th>
                  <th class="th2">작성일</th>
                  <th class="th1">조회수</th>
               </tr>
               <tr>
             	<td><%=bean.getNum() %></td>
             	<td><%=bean.getSubject() %></td>
             	<td><%=bean.getWriter() %></td>
             	<td><%=bean.getReg_date() %></td>
             	<td><%=bean.getReadcount() %></td>
             	</tr>
               <tr>
                  <td colspan="5" class="text-center">
                     <nav>
                        <ul class="pagination">
                           <%
                              if (paging.getStartPage() > 10) {
                           %>
                           <li><a href="index.jsp?page=notice/NoticeList.jsp&&pageNum=<%=paging.getPrev()%>"
                              aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
                           <%
                              }
                              for (int i = paging.getStartPage(); i <= paging.getEndPage(); i++) {
                           %>
                           <li
                              <%if (i == Integer.parseInt(pageNum))
               				  out.print("class='active'");%>><a
                              href="index.jsp?page=notice/NoticeList&&pageNum=<%=i%>"><%=i%><span
                                 class="sr-only">(current)</span></a></li>
                           <%
                              }
                              if (paging.getEndPage() < paging.getPageCount()) {
                           %>

                           <li><a href="index.jsp?page=notice/NoticeList&&pageNum=<%=paging.getNext()%>"
                              aria-label="next"><span aria-hidden="true">&raquo;</span></a></li>
                           <%
                              }
                           %>                          
                        </ul>
                     </nav>
                  </td>
               </tr>
            </table>
            </div>
         </div>
      </div>
</body>
</html>




