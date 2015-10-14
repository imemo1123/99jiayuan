package cn.memo.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.memo.handle.ActivityHandle;
import cn.memo.handle.JsonHandle;
import cn.memo.handle.MyHandle;
import cn.memo.handle.UserHandle;

/**
 * Servlet implementation class LoginAction
 */
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String tel = (String)request.getParameter("tel");
		String psw = (String)request.getParameter("psw");
		boolean rst = UserHandle.login(tel, psw);
		request.setAttribute("rst", String.valueOf(rst));
		HttpSession session = request.getSession();
		if(rst){
			session.setAttribute("tel", tel);
			Map<String,String> info = UserHandle.getUserInfoByTel(tel);
			session.setAttribute("id", info.get("id"));
			session.setAttribute("nike", info.get("nike"));
			session.setAttribute("name", info.get("name"));
			session.setAttribute("sex", info.get("sex"));
			session.setAttribute("birthday", info.get("birthday"));
			session.setAttribute("addr", info.get("addr"));
			session.setAttribute("height", info.get("height"));
			session.setAttribute("salary", info.get("salary"));
			session.setAttribute("edu", info.get("edu"));
			session.setAttribute("marital", info.get("marital"));
			session.setAttribute("age", info.get("age"));
			session.setAttribute("pic", info.get("pic"));
			Map<String,String> more = UserHandle.getUserMoreInfo(info.get("id"));
			session.setAttribute("school", more.get("school"));
			session.setAttribute("company", more.get("company"));
			session.setAttribute("work", more.get("work"));
			session.setAttribute("house", more.get("house"));
			session.setAttribute("car", more.get("car"));
			session.setAttribute("weight", more.get("weight"));
			session.setAttribute("charact", more.get("charact"));
			session.setAttribute("t_age_min", more.get("t_age_min"));
			session.setAttribute("t_age_max", more.get("t_age_max"));
			session.setAttribute("t_height_min", more.get("t_height_min"));
			session.setAttribute("t_height_max", more.get("t_height_max"));
			session.setAttribute("t_edu", more.get("t_edu"));
			session.setAttribute("t_salary", more.get("t_salary"));
			session.setAttribute("t_addr", more.get("t_addr"));
			session.setAttribute("t_marital", more.get("t_marital"));
			session.setAttribute("t_charact", more.get("t_charact"));
			request.getRequestDispatcher("main.jsp").forward(request, response);
		}else{
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
