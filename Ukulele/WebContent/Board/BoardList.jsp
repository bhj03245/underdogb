<%@page import="model.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.BoardBean"%>
<%@ page import="java.util.Vector"%>
<%@ page import="model.BoardDAO"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp" />
</head>
<body>
	<%
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		BoardDAO bdao = new BoardDAO();

		Paging paging = new Paging(pageNum);
	
		paging.setTotalCount(bdao.getAllCount());

		Vector<BoardBean> vec = bdao.getAllBoard(paging.getStartRow(), paging.getEndRow());
	%>

	<div class="row">
		<div class="col-xs-2"></div>
		<div class="col-xs-8 col-md-8">
			<h2 class="text-center">자유게시판</h2>
			<p class="text-right">
				<input type="button" value="글쓰기"
					onclick="location.href='BoardWrite.jsp'" class="btn btn-warning">
			</p>
			<div class="table-responsive">
				<table class="table table-bordered table-striped">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
		
					<%
						for (int i = 0; i < vec.size(); i++) {
							BoardBean bean = vec.get(i); //벡터에 저장되어 있는 빈클래스를 하나씩 추출
					%>
					<tr>
						<td><%=paging.getNumber() - i%></td>

						<td><a href="BoardInfo.jsp?num=<%=bean.getNum()%>"> <%
 	if (bean.getRe_step() > 1) {
 			for (int j = 0; j < (bean.getRe_step() * 5); j++) {
 %> &nbsp; <%
 	}
 		}
 %> <%=bean.getSubject()%></a></td>


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
									<li><a href="BoardList.jsp?pageNum=<%=paging.getPrev()%>"
										aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
									<%
										}
										for (int i = paging.getStartPage(); i <= paging.getEndPage(); i++) {
									%>
									<li
										<%if (i == Integer.parseInt(pageNum))
					out.print("class='active'");%>><a
										href="BoardList.jsp?pageNum=<%=i%>"><%=i%><span
											class="sr-only">(current)</span></a></li>

									<%
										}
										if (paging.getEndPage() < paging.getPageCount()) {
									%>

									<li><a href="BoardList.jsp?pageNum=<%=paging.getNext()%>"
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





