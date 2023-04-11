package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TeacherDAO;
import vo.TeacherVO;

@WebServlet("/teacherSelect")
public class TeacherSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public TeacherSelect() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		TeacherDAO dao = new TeacherDAO();
		ArrayList<TeacherVO> teacherList = dao.teacherSelect();
		
		request.setAttribute("teacherList", teacherList);
		request.getRequestDispatcher("./teacherSelect.jsp").forward(request, response);
	}

}
