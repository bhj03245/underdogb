package member;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("*.mb")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MemberDTO memberDTO;
	private MemberDAO memberDAO;
	private int cnt;



	public MemberServlet() {
		memberDTO = new MemberDTO();
		memberDAO = new MemberDAO(); 
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);               
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		HttpSession session = request.getSession();

		//로그인
		if(command.equals("/memberLogin.mb")){
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");

			try {
				memberDTO = memberDAO.memberLogin(id,pw);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			if(!id.equals(memberDTO.getId())) {
				out.print("<script>alert('아이디가 일치하지 않습니다');"
						+ "history.back();</script>");
			}else if(!pw.equals(memberDTO.getPw())) {
				out.print("<script>alert('비밀번호가 틀렸습니다');"
						+"history.back();</script>");
			}else {
				out.print("환영합니다");
				session.setAttribute("id", id);
				session.setAttribute("pw", pw);
				response.sendRedirect("index.jsp?page=center");
			}

		}
		//회원가입
		else if(command.equals("/memberRegister.mb")) {
			memberDTO.setId(request.getParameter("id"));
			memberDTO.setPw(request.getParameter("pw"));
			memberDTO.setEmail(request.getParameter("email"));
			try {
				cnt = memberDAO.memberRegister(memberDTO);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			out.print(cnt+"건 회원이 등록되었습니다.");
			response.sendRedirect("index.jsp?page=center");

		}
		//아이디찾기
		else if(command.equals("/memberSearch.mb")) {
			String idSearch = request.getParameter("email");
			try {
				String id = memberDAO.memberSearch(idSearch);
				out.print("찾는 아이디 : "+id);
				response.sendRedirect("index.jsp?page=center");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} 
		//비밀번호 찾기
		else if(command.equals("/pwSearch.mb")) {
			String pwSearch = request.getParameter("email");
			try {
				String pw = memberDAO.pwSearch(pwSearch);
				out.print("찾는 비밀번호는 :"+pw);
				response.sendRedirect("index.jsp?page=center");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		

	}

}
