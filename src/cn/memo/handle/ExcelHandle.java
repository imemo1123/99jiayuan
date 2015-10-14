package cn.memo.handle;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import cn.memo.data.UserData;
import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

public class ExcelHandle {
	static String path = "\\files\\user_info.xls";
	public static List readExcel(String path,int index) throws BiffException, IOException{
		List list = new ArrayList();
		Workbook rwb = null;
		Cell cell = null;
		    
		//创建输入流
		InputStream stream = new FileInputStream(path);
		//获取Excel文件对象
		 rwb = Workbook.getWorkbook(stream);
		    
		//获取文件的指定工作表 默认的第一个
		Sheet sheet0 = rwb.getSheet(index);
		//行数(表头的目录不需要，从1开始)
		for(int i=0; i<sheet0.getRows(); i++){
		      //创建一个数组 用来存储每一列的值
		     String[] str = new String[sheet0.getColumns()];
		     //列数
		     for(int j=0; j<sheet0.getColumns(); j++){
			     //获取第i行，第j列的值
			     cell = sheet0.getCell(j,i);
			     str[j] = cell.getContents();
		     }
		     //把刚获取的列存入list
		     list.add(str);
		}
		for(int i=0;i<list.size();i++){
			String[] str = (String[])list.get(i);
			for(int j=0;j<str.length;j++){
				System.out.println(str[j]);
			}
		}
		return list;
	}
	
	public static List getUsersFromExcel(String path) {
		try {
			List<UserData> users = new ArrayList<UserData>();
			List sheet0 = ExcelHandle.readExcel(path,0);
			List sheet1 = ExcelHandle.readExcel(path,1);
			List sheet2 = ExcelHandle.readExcel(path,2);
			for(int i=1;i<sheet0.size();i++){
				
				UserData user = new UserData();
				String[] str = (String[])sheet0.get(i);
				user.id = ExcelHandle.getId(str[0],str[5]);
				user.tel = str[1];
				user.nike = (str[2].length()<=0?str[3]:str[2]);
				user.name = str[3];
				user.psw = "123456";
				user.sex = str[5];
				user.addr = str[6];
				user.height = str[7];
				user.salary = str[8];
				user.edu=str[9];
				user.marital = str[10];
				user.date = str[11];
				for(int j=1;j<sheet1.size();j++){
					String[] str1 = (String[])sheet1.get(j);
					if(str[0].equals(str1[0])){
						user.school = str1[1];
						user.work = str1[2];
						user.car = str1[3];
						user.child = str1[4];
						user.weight = str1[5];
						user.charact = str1[6];
						break;
					}
				}
				for(int k=1;k<sheet2.size();k++){
					String[] str2 = (String[])sheet2.get(k);
					if(str[0].equals(str2[0])){
						user.t_age_min = str2[1];
						user.t_age_max = str2[2];
						user.t_edu = str2[3];
						user.t_salary = str2[4];
						user.t_addr =str2[5];
						user.t_marital = str2[6];
						user.t_height_min = str2[7];
						user.t_height_max = str2[8];
						user.t_charact = str2[9];
						user.t_child = str2[10];
						break;
					}
				}
				users.add(user);
			}
			return users;
		} catch (BiffException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public static String getId(String id,String sex) {
		StringBuffer sb = new StringBuffer();
		sb.append(sex);
		for(int i = id.length(); i<5; i++){
			sb.append("0");
		}
		sb.append(id);
		return sb.toString();
	}

//	public static void main(String[] args) {
//		ExcelHandle.getUsersFromExcel();
//	}
}
