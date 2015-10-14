package cn.memo.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.memo.data.UserData;
import cn.memo.handle.JsonHandle;
import cn.memo.handle.UserHandle;

/**
 * Servlet implementation class EditBaseInfoAction
 */
public class EditBaseInfoAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditBaseInfoAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserData user = new UserData();
		user.id = (String) session.getAttribute("id");
		user.nike = request.getParameter("nike");
	        System.out.println(user.nike);
	        user.date = request.getParameter("date");
	        user.addr = request.getParameter("addr");
	        user.height = request.getParameter("height");
	        user.salary = request.getParameter("salary");
	        user.edu = request.getParameter("edu");
	        user.marital = request.getParameter("marital");
	        System.out.println(user.height);
		UserHandle.editBaseInfo(user);
		session.setAttribute("nike", user.nike);
		session.setAttribute("date", user.date);
		session.setAttribute("addr", user.addr);
		session.setAttribute("height", user.height);
		session.setAttribute("salary", user.salary);
		session.setAttribute("edu", user.edu);
		session.setAttribute("marital", user.marital);
		String json = JsonHandle.toJson(user);
		System.out.println(json);
		 response.setContentType("text/xml;charset=utf-8");  
		PrintWriter out = response.getWriter();
		out.print(json);
		out.flush();
		out.close();
		//request.getRequestDispatcher("jsp/info.jsp").forward(request, response);
	}

}
