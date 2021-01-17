<%@page import="gallery.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="gallery.GalleryBean"%>
<%@ page import="java.util.Vector"%>
<%@ page import="gallery.GalleryDAO"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp" />
<%-- <jsp:include page="../top.jsp" /> --%>
</head>
<body>
	<%
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		GalleryDAO dao = new GalleryDAO();

		Paging paging = new Paging(pageNum);

		paging.setTotalCount(dao.getAllCount());

		Vector<GalleryBean> vec = dao.getAllgallery(paging.getStartRow(), paging.getEndRow());
	%>
	<div class="row">
		<div class="col-xs-2"></div>
		<div class="col-xs-8 col-md-8">
			<h2 class="text-center">갤러리</h2>
			<p class="text-right">
				<input type="button" value="글쓰기"
					onclick="location.href='index.jsp?page=Gallery/GalleryWrite'"
					class="btn btn-warning">
			</p>
			<div class="gallery_list">
				<h1 class="gallery1">
					<strong class="blind">갤러리</strong>
				</h1>
				<ul>
					<li><p class="haha">
							<a href="#"></a>
				</ul>

				<%
					for (int i = 0; i < vec.size(); i++) {
						GalleryBean bean = vec.get(i); //벡터에 저장되어 있는 빈클래스를 하나씩 추출
				%>
				<tr>
					<td><%=paging.getNumber() - i%></td>

					<td><a
						href="index.jsp?page=Gallery/GalleryInfo&&num=<%=bean.getNum()%>">

							<%
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
								<li><a
									href="index.jsp?page=Gallery/GalleryList.jsp&&pageNum=<%=paging.getPrev()%>"
									aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
								<%
									}
									for (int i = paging.getStartPage(); i <= paging.getEndPage(); i++) {
								%>
								<li
									<%if (i == Integer.parseInt(pageNum))
					out.print("class='active'");%>><a
									href="index.jsp?page=Gallery/GalleryList&&pageNum=<%=i%>"><%=i%><span
										class="sr-only">(current)</span></a></li>

								<%
									}
									if (paging.getEndPage() < paging.getPageCount()) {
								%>

								<li><a
									href="index.jsp?page=Gallery/GalleryList&&pageNum=<%=paging.getNext()%>"
									aria-label="next"><span aria-hidden="true">&raquo;</span></a></li>
								<%
									}
								%>
							</ul>
						</nav>
					</td>
				</tr>

			</div>

		</div>
	</div>
</body>
</html>





