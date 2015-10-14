package cn.memo.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.memo.handle.JsonHandle;
import cn.memo.sql.SqlConnection;

/**
 * Servlet implementation class ListTest
 */
public class ListTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListTest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SqlConnection conn = new SqlConnection();
		String take = (String)request.getParameter("take");
		String skip = (String)request.getParameter("skip");
		String pageSize = (String)request.getParameter("pageSize");
		System.out.println(request.getParameter("skip"));
		System.out.println(request.getParameter("pageSize"));
		String sql = "select id from nomination limit "+skip+","+take;
		System.out.println(sql);
		List<String> tabNames = new ArrayList<String>();
		tabNames.add("id");
		List<Map<String, String>> rst = conn.queryMulData(sql, tabNames);
		String json = JsonHandle.toJson(rst);
		
		int total = conn.getCount("nomination");
		PrintWriter out = response.getWriter();
		System.out.println("{\"data\":"+json+",\"totle\":"+total+"}");
		out.print("{\"data\":"+json+",\"total\":"+total+"}");
		//out.print(json);
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
