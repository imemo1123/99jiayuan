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
 * Servlet implementation class EditMoreInfoAction
 */
public class EditMoreInfoAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditMoreInfoAction() {
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
		user.school = request.getParameter("school");
	        user.company = request.getParameter("company");
	        user.work = request.getParameter("work");
	        user.car = request.getParameter("car");
	        user.child = request.getParameter("child");
	        user.weight = request.getParameter("weight");
	        user.house = request.getParameter("house");
	        user.charact = request.getParameter("charact");
		UserHandle.editMoreInfo(user);
		session.setAttribute("house", user.house);
		session.setAttribute("weight", user.weight);
		session.setAttribute("car", user.car);
		session.setAttribute("work", user.work);
		session.setAttribute("company", user.company);
		session.setAttribute("school", user.school);
		session.setAttribute("child", user.child);
		session.setAttribute("charact", user.charact);
		String json = JsonHandle.toJson(user);
		System.out.println(json);
		 response.setContentType("text/xml;charset=utf-8");  
		PrintWriter out = response.getWriter();
		out.print(json);
		out.flush();
		out.close();
	}

}
