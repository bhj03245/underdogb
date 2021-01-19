package notice;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardBean;
import board.BoardDAO;

@WebServlet("*.no")
public class NoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NoticeBean bean;
	private NoticeDAO noticeDAO;

	public NoticeServlet() {
		try {
			noticeDAO = new NoticeDAO();
			bean = new NoticeBean();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());

		if (command.equals("/NoticeWrite.no")) { // 공지사항 등록
			bean.setWriter(request.getParameter("writer"));
			bean.setEmail(request.getParameter("email"));
			bean.setSubject(request.getParameter("subject"));
			bean.setPassword(request.getParameter("password"));
			bean.setContent(request.getParameter("content"));
			noticeDAO.insertNotice(bean);
			response.sendRedirect("index.jsp?page=notice/NoticeList");
		} // 공지사항 등록

		else if (command.equals("/NoticeDelete.no")) { // 공지사항 삭제
			String pw = request.getParameter("password");
			int num = Integer.parseInt(request.getParameter("num"));
			String password = noticeDAO.getPass(num);

			if (pw.equals(password)) {
				noticeDAO.deleteNotice(num);
				response.sendRedirect("index.jsp?page=notice/NoticeList");
			} else {
				out.print("<script>alert('패스워드가 틀려서 삭제 할 수 없습니다. 패스워드를 확인해 주세요.'); history.go(-1);</script>");
			}

		} // 공지사항 삭제
		
		else if(command.equals("/NoticeUpdate.no")) {//공지사항 수정
			bean.setSubject(request.getParameter("subject"));
			bean.setContent(request.getParameter("content"));
			bean.setNum(Integer.parseInt(request.getParameter("num")));
			String pass=noticeDAO.getPass(Integer.parseInt(request.getParameter("num")));
			
			if(pass.equals(request.getParameter("password"))){
				noticeDAO.updateNotice(bean);
				response.sendRedirect("index.jsp?page=notice/NoticeList");		
			}
			else{
				out.print("<script>alert('패스워드가 틀려서 수정 할 수 없습니다. 패스워드를 확인해 주세요.'); history.go(-1);</script>");
			}	
		} //공지사항 수정
	}

}
