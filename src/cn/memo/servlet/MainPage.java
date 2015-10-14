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
import cn.memo.handle.MyHandle;
import cn.memo.handle.UserHandle;
import cn.memo.handle.JsonHandle;

/**
 * Servlet implementation class MainPage
 */
public class MainPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String tel = (String) session.getAttribute("tel");
		Map<String,String> info = UserHandle.getUserInfoByTel(tel);
		session.setAttribute("nike", info.get("nike"));
		session.setAttribute("name", info.get("name"));
		session.setAttribute("sex", info.get("sex"));
		session.setAttribute("addr", info.get("addr"));
		session.setAttribute("height", info.get("height"));
		session.setAttribute("salary", info.get("salary"));
		session.setAttribute("edu", info.get("edu"));
		session.setAttribute("marital", info.get("marital"));
		session.setAttribute("age", info.get("age"));
		List<Map<String, String>> activityList = ActivityHandle.getActivityList();
		request.setAttribute("activityList", JsonHandle.toJson(activityList));
		String tsex = MyHandle.getOtherSex(info.get("sex"));
		List<Map<String, String>> nominateList = UserHandle.getNominateList(tsex);
		request.setAttribute("nominateList", JsonHandle.toJson(nominateList));
		request.getRequestDispatcher("/jsp/main.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
