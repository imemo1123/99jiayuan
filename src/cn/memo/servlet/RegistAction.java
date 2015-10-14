package cn.memo.servlet;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.sina.sae.storage.SaeStorage;
import com.sina.sae.util.SaeUserInfo;

import cn.memo.data.UserData;
import cn.memo.handle.UserHandle;

/**
 * Servlet implementation class RegistAction
 */
public class RegistAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		UserData user = new UserData();
		user.tel = (String)request.getParameter("tel");
		user.psw = (String)request.getParameter("psw");
		user.nike = (String)request.getParameter("nike");
		user.name = (String)request.getParameter("name");
		user.sex = (String)request.getParameter("sex");
		user.date = (String)request.getParameter("date");
		user.height = (String)request.getParameter("height");
		user.salary = (String)request.getParameter("salary");
		user.edu = (String)request.getParameter("edu");
		user.marital = (String)request.getParameter("marital");
		user.addr = (String)request.getParameter("addr");
		String pic="";
		DiskFileItemFactory factory=new DiskFileItemFactory();
	        ServletFileUpload sfu=new ServletFileUpload(factory);
	        sfu.setHeaderEncoding("UTF-8");  //处理中文问题
	        sfu.setSizeMax(1024*1024*10);   //限制文件大小
	        try {
	        	List<FileItem> fileItems= sfu.parseRequest(request);  //解码请求 得到所有表单元素
	        	for (FileItem fi : fileItems) {
	        		if (fi.isFormField()) {
	        			String titleString = fi.getFieldName();
	        			if("tel".equals(titleString)){
	        				String tel = fi.getString();
	        				user.tel = tel;
	        			}else if("psw".equals(titleString)){
	        				String psw = fi.getString();
	        				user.psw = psw;
	        			}else if("nike".equals(titleString)){
	        				String nike = new String(fi.getString().getBytes("ISO-8859-1"),"UTF-8");
	        				user.nike = nike;
	        			}else if("name".equals(titleString)){
	        				String name = new String(fi.getString().getBytes("ISO-8859-1"),"UTF-8");
	        				user.name = name;
	        			}else if("sex".equals(titleString)){
	        				String sex = fi.getString();
	        				user.sex = sex;
	        			}else if("date".equals(titleString)){
	        				String date = fi.getString();
	        				user.date = date;
	        			}else if("height".equals(titleString)){
	        				String height = fi.getString();
	        				user.height = height;
	        			}else if("salary".equals(titleString)){
	        				String psw = fi.getString();
	        				user.salary = psw;
	        			}else if("edu".equals(titleString)){
	        				String psw = new String(fi.getString().getBytes("ISO-8859-1"),"UTF-8");
	        				user.edu = psw;
	        			}else if("marital".equals(titleString)){
	        				String psw = fi.getString();
	        				user.marital = psw;
	        			}else if("addr".equals(titleString)){
	        				String psw = new String(fi.getString().getBytes("ISO-8859-1"),"UTF-8");
	        				user.addr = psw;
	        			}
	        		}else{
	        			// 是文件
//	        			String realPath= SaeUserInfo.getSaeTmpPath()+"/"; 
//	        			File fullFile=new File(fi.getName());
//	        			System.out.println(realPath+fullFile.getName());
//	        			File uploadFile=new File(realPath,fullFile.getName());
//	        			fi.write(uploadFile);
//			           	//上传完毕后 使用SaeStorage往storage里面写
//			           	SaeStorage ss = new SaeStorage();
//			           	//使用upload方法上传到域为image下
//			           	String newName=user.tel+fullFile.getName().substring(fullFile.getName().lastIndexOf("."));
//			           	ss.upload("images", realPath+fullFile.getName(), newName);
//			           	user.pic = ss.getUrl("images", newName);
	        			
	        			ServletContext sctx = getServletContext();
	        			String path = sctx.getRealPath("/upload");
	        			System.out.println(path);
	        			String fileName = fi.getName();
	        			System.out.println(fileName); 
	        			fileName = fileName.substring(fileName.lastIndexOf("/")+1); 
	        			File file = new File(path+"\\"+fileName); 
	        			if(!file.exists()){ 
	        				fi.write(file);
	        			}
	        			user.pic = "upload/" +fileName;
	        		}
	        	}
	        	boolean rst = UserHandle.regist(user);
	        	request.setAttribute("rst", String.valueOf(rst));
	        }catch(Exception e){
	        	request.setAttribute("rst", "false");
	        }
		request.getRequestDispatcher("/jsp/regist_step3.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
