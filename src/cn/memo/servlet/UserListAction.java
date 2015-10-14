package cn.memo.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.memo.handle.MyHandle;
import cn.memo.handle.UserHandle;
import cn.memo.handle.JsonHandle;

/**
 * Servlet implementation class UserListAction
 */
public class UserListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserListAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String take = (String)request.getParameter("take");
		String skip = (String)request.getParameter("skip");
		HttpSession session = request.getSession();
		String sex = (String) session.getAttribute("sex");
		String tsex = MyHandle.getOtherSex(sex);
		List<Map<String, String>> rstList = UserHandle.getUserList(tsex, skip,take);
		String jsonStr = JsonHandle.toJson(rstList);
		int total = UserHandle.getCount(tsex);
		//response.setHeader("Charset","GB2312");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		System.out.println("{\"data\":"+jsonStr+",\"total\":"+total+"}");
		out.print("{\"data\":"+jsonStr+",\"total\":"+total+"}");
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
