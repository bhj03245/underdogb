package member;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
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
	private ArrayList<MemberDTO> memberList;
	private ResultSet rs;



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
				out.print("<script>alert('로그인되었습니다.'); location.href='index.jsp'</script>");
				session.setAttribute("id", id);
				session.setAttribute("pw", pw);
				session.setAttribute("email", memberDTO.getEmail());
				//response.sendRedirect("index.jsp?page=center");
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
			out.print("<script>alert('가입되었습니다.'); location.href='index.jsp'</script>");

		}
		//아이디찾기
		else if(command.equals("/memberSearch.mb")) {
			System.out.print("1");
			String idSearch = request.getParameter("email");
			try {
				String id = memberDAO.memberSearch(idSearch);
				out.print("찾는 아이디 : "+id);
			//	response.sendRedirect("index.jsp?page=center");
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
			//	response.sendRedirect("index.jsp?page=center");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		//회원목록
		else if(command.equals("/memberList.mb")) {
			try {
				memberList = memberDAO.memberList();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher dis = request.getRequestDispatcher("index.jsp?page=member/member/memberList");
			request.setAttribute("memberList", memberList);
			dis.forward(request, response);
		}
		//회원탈퇴
		else if(command.equals("/memberDelete.mb")) {
			String pw = request.getParameter("pw");
			if(pw.equals((String)session.getAttribute("pw"))){
				
				try {
					
					String idDelete = (String)session.getAttribute("id");
					String pwDelete = (String)session.getAttribute("pw");
					
					cnt = memberDAO.memberDelete(idDelete, pwDelete);
					
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				out.print("<script>alert('탈퇴되었습니다.'); location.href='index.jsp'</script>");
				session.invalidate();
				
			}else {
				out.print("<script>alert('패스워드가 틀렸습니다.');historty.back();</script>");
				
				
			}
			
		}
		//회원수정
		else if(command.equals("/memberUpdate.mb")) {
			memberDTO.setId(request.getParameter("id"));
			memberDTO.setPw(request.getParameter("pw"));
			memberDTO.setEmail(request.getParameter("email"));
			String UpdateId = request.getParameter("MemberUpdate");
			try {
				cnt = memberDAO.memberUpdate(memberDTO,UpdateId);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			out.print("<script>alert('변경되었습니다.'); location.href='index.jsp'</script>");
			
		}
		//아이디 중복체크
		else if(command.equals("/nodoubleid")) {
			String doubleid = request.getParameter("id");
			try {
				rs = memberDAO.doubleIDcheck(doubleid);
				while(rs.next()) {
					if(doubleid.equals(memberDTO.getId())) {
						out.print("이미 사용 중인 아이디 입니다.<br>");
						out.print("<input type = 'button' value = '종료' onclick = 'self.close()'>");
					}else {
						out.print("사용 가능한 아이디 입니다!.");
						out.print("<input type = 'button' value = '종료' onclick = 'self.close()'>");
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		//로그아웃
		else if(command.equals("/memberLogout.mb")) {
			session.invalidate();
			response.sendRedirect("index.jsp?page=center");
		}
		
	

	}

}
