package cn.memo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.memo.handle.JsonHandle;
import cn.memo.sql.SqlConnection;

/**
 * Servlet implementation class CheckTelExistedAction
 */
public class CheckTelExistedAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckTelExistedAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String tel = request.getParameter("tel");
		String checkSql = "select * from user_info where tel='"+tel+"';";
		SqlConnection conn = new SqlConnection();
		boolean rst = conn.checkExist(checkSql);
		String rstJson = JsonHandle.toJson(rst);
		PrintWriter out = response.getWriter();
		out.print(rstJson);
		out.flush();
		out.close();
	}

}
