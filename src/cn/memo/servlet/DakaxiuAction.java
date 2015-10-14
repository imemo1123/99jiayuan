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
 * Servlet implementation class DakaxiuAction
 */
public class DakaxiuAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DakaxiuAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SqlConnection conn = new SqlConnection();
		String sql = "select id,url,pic,title from dakaxiu";
		List<String> tabList = new ArrayList<String>();
		tabList.add("id");
		tabList.add("url");
		tabList.add("pic");
		tabList.add("title");
		List<Map<String, String>> rst = conn.queryMulData(sql, tabList);
		String json  = JsonHandle.toJson(rst);
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(json);
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
