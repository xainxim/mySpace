package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;

@WebServlet("/memberSelect")
public class MemberSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MemberSelectController() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberVO> memberList = dao.memberSelect();
		
		request.setAttribute("memberList", memberList);
		request.getRequestDispatcher("./memberSelect.jsp").forward(request, response);
	}

}
