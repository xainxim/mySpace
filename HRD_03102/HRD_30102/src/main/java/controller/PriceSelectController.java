package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.PriceVO;
@WebServlet("/priceSelect")
public class PriceSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PriceSelectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		MemberDAO dao = new MemberDAO();
		ArrayList<PriceVO> priceList = dao.priceSelect();
		
		request.setAttribute("priceList", priceList);
		request.getRequestDispatcher("./priceSelect.jsp").forward(request, response);
	}

}
