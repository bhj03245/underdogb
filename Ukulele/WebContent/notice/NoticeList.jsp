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

   <div class="row">
      <div class="col-xs-2"></div>
      <div class="col-xs-8 col-md-8">
         <h2 class="text-center">공지사항</h2>
         <p class="text-right">
            <input type="button" value="글쓰기"
               onclick="location.href='index.jsp?page=notice/NoticeWrite'" class="btn">
         </p>
         <div class="table-responsive">
           <table class="table table-striped"> <!-- bordered 세로줄 / -->
               <tr>
                  <th class="th1">번호</th>
                  <th>제목</th>
                  <th class="th2">작성자</th>
                  <th class="th2">작성일</th>
                  <th class="th1">조회수</th>
               </tr>
               <%
                  for (int i = 0; i < vec.size(); i++) {
                  NoticeBean bean = vec.get(i); //벡터에 저장되어 있는 빈클래스를 하나씩 추출
               %>
               <tr>
                  <td><%=paging.getNumber() - i%></td>
                  <td><a href="index.jsp?page=notice/NoticeInfo&&num=<%=bean.getNum()%>"> <%
                         if (bean.getRe_step() > 1) {
                            for (int j = 0; j < (bean.getRe_step() * 5); j++) {%> &nbsp; 
                            <%}
                         } %> <%=bean.getSubject()%></a></td>
                  <td><%=bean.getWriter()%></td>
                  <td><%=bean.getReg_date()%></td>
                  <td><%=bean.getReadcount()%></td>
               </tr>
               <%
                  }
               %>
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
                     <p class="text-left">
            <div class="search" style="position: center;">
            <select name="shwhere" size="1" style="vertical-align:text-top; font-size:12pt; 
            text-align-last:center; width:50px; height:30px; background-color:#D4F4FA; 
            color:black; border: 1px solid gray;">
            <option value="subject">제목</option>
            <option value="writer">작성자</option>
            </select>
            <input type="text" name="search" autocomplete="off" 
            style="vertical-align:sub; border:1px solid #888ca5; 
            border-width:1 0 1 0; width:150px; height:30px; overflow:visible;">
            <input type="button" value="검색" onclick="location.href='index.jsp?page=notice/NoticeSearchProc'" 
            class="btn1" style="vertical-align:text-top; color:white; font-size:12pt; 
            width:50px; height:33px; background-color:#8C8C8C; border-width:0 0 0 0;">
            </div>
                     </nav>
                  </td>
               </tr>
            </table>
            </div>
         </div>
      </div>
</body>
</html>



