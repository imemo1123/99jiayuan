package cn.memo.servlet;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import cn.memo.handle.UserHandle;

import com.sina.sae.storage.SaeStorage;
import com.sina.sae.util.SaeUserInfo;

/**
 * Servlet implementation class ChangePicAction
 */
public class ChangePicAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePicAction() {
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
		System.out.println("memo");
		HttpSession session = request.getSession();
		String tel = (String) session.getAttribute("tel");
		String id = (String) session.getAttribute("id");
		String pic="";
		DiskFileItemFactory factory=new DiskFileItemFactory();
	        ServletFileUpload sfu=new ServletFileUpload(factory);
	        sfu.setHeaderEncoding("UTF-8");  //处理中文问题
	        sfu.setSizeMax(1024*1024*10);   //限制文件大小
	        try {
	        	List<FileItem> fileItems= sfu.parseRequest(request);  //解码请求 得到所有表单元素
	        	for (FileItem fi : fileItems) {
	        		if (fi.isFormField()) {
	        			continue;
	        		}else{
	        			// 是文件
	        			String realPath= SaeUserInfo.getSaeTmpPath()+"/"; 
	        			File fullFile=new File(fi.getName());
	        			System.out.println(realPath+fullFile.getName());
	        			File uploadFile=new File(realPath,fullFile.getName());
	        			fi.write(uploadFile);
			           	//上传完毕后 使用SaeStorage往storage里面写
			           	SaeStorage ss = new SaeStorage();
			           	//使用upload方法上传到域为image下
			           	String newName=tel+fullFile.getName().substring(fullFile.getName().lastIndexOf("."));
			           	ss.upload("images", realPath+fullFile.getName(), newName);
			           	pic = ss.getUrl("images", newName);
	        			
//	        			ServletContext sctx = getServletContext();
//	        			String path = sctx.getRealPath("/upload");
//	        			System.out.println(path);
//	        			String fileName = fi.getName();
//	        			System.out.println(fileName); 
//	        			fileName = fileName.substring(fileName.lastIndexOf("/")+1); 
//	        			File file = new File(path+"\\"+fileName); 
//	        			if(!file.exists()){ 
//	        				fi.write(file);
//	        			}
//	        			pic = path+"\\" +fileName;
	        		}
	        	}
	        	boolean rst = UserHandle.updatePic(id,pic);
	        	request.setAttribute("rst", String.valueOf(rst));
	        }catch(Exception e){
	        	request.setAttribute("rst", "false");
	        }
	}

}
