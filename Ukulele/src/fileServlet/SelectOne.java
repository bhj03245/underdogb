package fileServlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import file.FileBean;
import file.FileDAO;

@WebServlet("/SelectOne")
public class SelectOne extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int num = Integer.parseInt(request.getParameter("num"));

		FileDAO dao = FileDAO.getInstance();

		try {
			FileBean bean = dao.SelectOne(num);

			if (bean != null) {
				request.setAttribute("bean", bean);
			} else {
				System.out.println("조회실패..");
			}
			RequestDispatcher dis = request.getRequestDispatcher("Gallery/GalleryInfo.jsp");
			dis.forward(request, response);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
