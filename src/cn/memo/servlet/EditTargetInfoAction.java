package cn.memo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.memo.data.UserData;
import cn.memo.handle.JsonHandle;
import cn.memo.handle.UserHandle;

/**
 * Servlet implementation class EditTargetInfoAction
 */
public class EditTargetInfoAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditTargetInfoAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserData user = new UserData();
		user.id = (String) session.getAttribute("id");
		user.t_age_max = request.getParameter("t_age_max");
	        user.t_age_min = request.getParameter("t_age_min");
		user.t_height_max = request.getParameter("t_height_max");
	        user.t_height_min = request.getParameter("t_height_min");
	        user.t_marital = request.getParameter("t_marital");
	        user.t_addr = request.getParameter("t_addr");
	        user.t_salary = request.getParameter("t_salary");
	        user.t_edu = request.getParameter("t_edu");
	        user.t_charact = request.getParameter("t_charact");
		UserHandle.editTargetInfo(user);
		session.setAttribute("t_age_min", user.t_age_min);
		session.setAttribute("t_marital", user.t_marital);
		session.setAttribute("t_edu", user.t_edu);
		session.setAttribute("t_salary", user.t_salary);
		session.setAttribute("t_age_max", user.t_age_max);
		session.setAttribute("t_addr", user.t_addr);
		session.setAttribute("t_height_min", user.t_height_min);
		session.setAttribute("t_height_max", user.t_height_max);
		session.setAttribute("t_charact", user.t_charact);
		String json = JsonHandle.toJson(user);
		System.out.println(json);
		 response.setContentType("text/xml;charset=utf-8");  
		PrintWriter out = response.getWriter();
		out.print(json);
		out.flush();
		out.close();
	}

}
