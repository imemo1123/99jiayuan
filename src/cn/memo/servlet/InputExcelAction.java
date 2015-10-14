package cn.memo.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.memo.data.UserData;
import cn.memo.handle.ExcelHandle;
import cn.memo.handle.UserHandle;

/**
 * Servlet implementation class InputExcelAction
 */
public class InputExcelAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InputExcelAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext sctx = getServletContext();
		String path = sctx.getRealPath("/files/user_info.xls");
		System.out.println(path);
		List userList = ExcelHandle.getUsersFromExcel(path);
		for(int i=0;i<userList.size();i++){
			UserData user = (UserData) userList.get(i);
			UserHandle.regist1(user);
			UserHandle.editMoreInfo(user);
			UserHandle.editTargetInfo(user);
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
