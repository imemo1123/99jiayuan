package cn.memo.handle;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import cn.memo.data.UserData;
import cn.memo.sql.SqlConnection;

public class UserHandle {
	public static boolean regist(UserData user) {
		SqlConnection conn = new SqlConnection();
		String checkSql = "select * from user_info where tel='" + user.tel +"';";
		if(conn.checkExist(checkSql)){
			return false;
		}
		String registSql = "insert into user_info(tel,nike,name,psw,sex,addr,height,salary,edu,marital,birthday,pic,date) "
						+ "values ('"+user.tel+"','"
								  +user.nike+"','"
								  +user.name+"','"
								  +user.psw+"','"
								  +user.sex+"','"
								  +user.addr+"','"
								  +user.height+"','"
								  +user.salary+"','"
								  +user.edu+"','"
								  +user.marital+"','"
								  +user.date+"','"
								  +user.pic+"','"
								  +MyHandle.getDate()+"');";
		System.out.println(registSql);
		int rst = conn.executeUpdate(registSql);
		if(rst > 0)
			return true;
		else 
			return false;
	}
	
	public static boolean regist1(UserData user) {
		SqlConnection conn = new SqlConnection();
		String checkSql = "select * from user_info where tel='" + user.tel +"';";
		if(conn.checkExist(checkSql)){
			return false;
		}
		String registSql = "insert into user_info(id,tel,nike,name,psw,sex,addr,height,salary,edu,marital,birthday,pic,date) "
						+ "values ('"+user.id+"','"
								  +user.tel+"','"
								  +user.nike+"','"
								  +user.name+"','"
								  +user.psw+"','"
								  +user.sex+"','"
								  +user.addr+"','"
								  +user.height+"','"
								  +user.salary+"','"
								  +user.edu+"','"
								  +user.marital+"','"
								  +user.date+"','"
								  +user.pic+"','"
								  +MyHandle.getDate()+"');";
		System.out.println(registSql);
		int rst = conn.executeUpdate(registSql);
		if(rst > 0)
			return true;
		else 
			return false;
	}
	
	
	public static boolean login(String tel,String psw) {
		SqlConnection conn = new SqlConnection();
		String checkString = "select * from user_info where tel='"+tel+"' and psw='"+psw+"';";
		return conn.checkExist(checkString);
	}
	
	
	public static int getAgeByBirthday(String dateString) { 
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM");
		Date birthday = null;
		try {
			birthday = df.parse(dateString);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
		Calendar cal = Calendar.getInstance();

		if (cal.before(birthday)) {
			throw new IllegalArgumentException(
					"The birthDay is before Now.It's unbelievable!");
		}

		int yearNow = cal.get(Calendar.YEAR);
		int monthNow = cal.get(Calendar.MONTH) + 1;
		int dayOfMonthNow = cal.get(Calendar.DAY_OF_MONTH);

		cal.setTime(birthday);
		int yearBirth = cal.get(Calendar.YEAR);
		int monthBirth = cal.get(Calendar.MONTH) + 1;
		int dayOfMonthBirth = cal.get(Calendar.DAY_OF_MONTH);

		int age = yearNow - yearBirth;

		if (monthNow <= monthBirth) {
			if (monthNow == monthBirth) {
				// monthNow==monthBirth 
				if (dayOfMonthNow < dayOfMonthBirth) {
					age--;
				}
			} else {
				// monthNow>monthBirth 
				age--;
			}
		}
		return age;
	}
	
	public static Map<String, String> getUserInfoByTel(String tel) {
		SqlConnection conn = new SqlConnection();
		String sql = "select id,nike,name,birthday,sex,addr,height,salary,edu,marital,pic from user_info where tel='"+tel+"';";
		List<String> paramList  = new ArrayList<String>();
		paramList.add("id");
		paramList.add("nike");
		paramList.add("name");
		paramList.add("birthday");
		paramList.add("sex");
		paramList.add("addr");
		paramList.add("height");
		paramList.add("salary");
		paramList.add("edu");
		paramList.add("marital");
		paramList.add("pic");
		Map<String, String> rstList = conn.querySingleData(sql, paramList);
		int age = UserHandle.getAgeByBirthday(rstList.get("birthday"));
		rstList.put("age", Integer.toString(age));
		return rstList;
	}

	
	
	public static List<Map<String, String>> getNominateList(String sex) {
		SqlConnection conn = new SqlConnection();
		String sql = "select a.id,nike,birthday,edu,pic from nomination a left join user_info b on a.id=b.id where b.sex='"+sex+"'";
		List<String> paramList  = new ArrayList<String>();
		paramList.add("id");
		paramList.add("nike");
		paramList.add("birthday");
		paramList.add("edu");
		paramList.add("pic");
		List<Map<String, String>> rst = conn.queryMulData(sql, paramList);
		List<Map<String, String>> rstList = new ArrayList<Map<String,String>>();
		for (Iterator iterator = rst.iterator(); iterator.hasNext();) {
			Map<String, String> map = (Map<String, String>) iterator.next();
			int age = UserHandle.getAgeByBirthday(map.get("birthday"));
			map.put("age", Integer.toString(age));
			rstList.add(map);
		}
		return rstList;
	}
	
	public static Map<String, String> getUserDetail(String id) {
		SqlConnection conn = new SqlConnection();
		String sql = "select id,nike,name,birthday,sex,addr,height,salary,edu,marital,pic from user_info where id='"+id+"';";
		List<String> paramList  = new ArrayList<String>();
		paramList.add("id");
		paramList.add("nike");
		paramList.add("name");
		paramList.add("birthday");
		paramList.add("sex");
		paramList.add("addr");
		paramList.add("height");
		paramList.add("salary");
		paramList.add("edu");
		paramList.add("marital");
		paramList.add("pic");
		Map<String, String> rstList = conn.querySingleData(sql, paramList);
		int age = UserHandle.getAgeByBirthday(rstList.get("birthday"));
		rstList.put("age", Integer.toString(age));
		rstList.put("age", Integer.toString(age));
		String pic = rstList.get("pic");
		rstList.put("pic", handlePic(pic,rstList.get("sex")));
		return rstList;
	}
	
	public static Map<String, String> getUserMoreInfo(String id) {
		SqlConnection conn = new SqlConnection();
		String sql = "select school,company,work,house,car,child,weight,charact,t_age_min,t_age_max,t_height_min,t_height_max,t_edu,t_salary,t_addr,t_marital,t_charact from user_more where id='"+id+"';";
		List<String> paramList  = new ArrayList<String>();
		paramList.add("school");
		paramList.add("company");
		paramList.add("work");
		paramList.add("house");
		paramList.add("car");
		paramList.add("child");
		paramList.add("weight");
		paramList.add("charact");
		paramList.add("t_age_min");
		paramList.add("t_age_max");
		paramList.add("t_height_min");
		paramList.add("t_height_max");
		paramList.add("t_edu");
		paramList.add("t_salary");
		paramList.add("t_addr");
		paramList.add("t_marital");
		paramList.add("t_charact");
		Map<String, String> rstList = conn.querySingleData(sql, paramList);
		return rstList;
	}
	
	public static List<Map<String, String>> getUserList(String sex, String index,String take) {
		SqlConnection conn = new SqlConnection();
		List<String> paramList  = new ArrayList<String>();
		paramList.add("id");
		paramList.add("nike");
		paramList.add("birthday");
		paramList.add("edu");
		paramList.add("pic");
		String sql = "select id,nike,birthday,edu,pic from user_info where sex='"+sex+"' limit "+index+","+take+" ;";
		List<Map<String, String>> rstList = conn.queryMulData(sql, paramList);
		List<Map<String, String>> rst = new ArrayList<Map<String,String>>();
		for (Iterator iterator = rstList.iterator(); iterator.hasNext();) {
			Map<String, String> map = (Map<String, String>) iterator.next();
			int age = UserHandle.getAgeByBirthday(map.get("birthday"));
			map.put("age", Integer.toString(age));
			String pic = map.get("pic");
			map.put("pic", handlePic(pic,sex));
			rst.add(map);
		}
		return rst;
	}
	
	
	public static String handlePic(String pic,String sex){
		if(pic==null || pic.equals("null") || pic.length()<=0){
			if(sex.equals(0)){
				return "images/ico_female1.jpg";
			}else{
				return "images/ico_male1.jpg";
			}
		}else{
			return pic;
		}
	}
	
	public static boolean like(String id,String tid) {
		return false;
	}
	
	public static int getCount(String sex) {
		SqlConnection conn = new SqlConnection();
		return conn.getCount("user_info", "sex="+sex);
	}
	
	public static boolean editBaseInfo(UserData info) {
		SqlConnection conn = new SqlConnection();
		String sql = "update user_info set nike='"+info.nike+"',"
						+ "addr='"+info.addr+"',"
						+ "height='"+info.height+"',"
						+ "salary='"+info.salary+"',"
						+ "edu='"+info.edu+"',"
						+ "marital='"+info.marital+"',"
						+ "birthday='"+info.date+"' "
						+ "where id='"+info.id+"';";
		System.out.println(sql);
		int rst = conn.executeUpdate(sql);
		if(rst>0)
			return true;
		return false;
	}
	
	public static boolean editMoreInfo(UserData info) {
		SqlConnection conn = new SqlConnection();
		String checkSql = "select * from user_more where id='"+info.id+"';";
		String sql = "";
		if(conn.checkExist(checkSql)){
			sql = "update user_more set school='"+info.school+"',"
							+ "company='"+info.company+"',"
							+ "work='"+info.work+"',"
							+ "car='"+info.car+"',"
							+ "child='"+info.child+"',"
							+ "weight='"+info.weight+"',"
							+ "house='"+info.house+"', "
							+ "charact='"+info.charact+"' "
							+ "where id='"+info.id+"';";
		}else{
			sql = "insert into user_more(id,school,company,work,car,child,weight,house,charact) values ("
							+ "'"+info.id+"',"
							+ "'"+info.school+"',"
							+ "'"+info.company+"',"
							+ "'"+info.work+"',"
							+ "'"+info.car+"',"
							+ "'"+info.child+"',"
							+ "'"+info.weight+"',"
							+ "'"+info.house+"',"
							+ "'"+info.charact+"');";
		}
		System.out.println(sql);
		int rst = conn.executeUpdate(sql);
		if(rst>0)
			return true;
		return false;
	}
	
	public static boolean editTargetInfo(UserData info) {
		SqlConnection conn = new SqlConnection();
		String checkSql = "select * from user_more where id='"+info.id+"';";
		String sql = "";
		if(conn.checkExist(checkSql)){
			sql = "update user_more set t_age_min='"+info.t_age_min+"',"
							+ "t_edu='"+info.t_edu+"',"
							+ "t_height_min='"+info.t_height_min+"',"
							+ "t_height_max='"+info.t_height_max+"',"
							+ "t_salary='"+info.t_salary+"',"
							+ "t_addr='"+info.t_addr+"',"
							+ "t_marital='"+info.t_marital+"',"
							+ "t_charact='"+info.t_charact+"',"
							+ "t_age_max='"+info.t_age_max+"' "
							+ "where id='"+info.id+"';";
		}else{
			sql = "insert into user_more(id,t_age_min,t_height_min,t_height_max,t_edu,t_salary,t_addr,t_marital,t_charact,t_age_max) values ("
							+ "'"+info.id+"',"
							+ "'"+info.t_age_min+"',"
							+ "'"+info.t_height_min+"',"
							+ "'"+info.t_height_max+"',"
							+ "'"+info.t_edu+"',"
							+ "'"+info.t_salary+"',"
							+ "'"+info.t_addr+"',"
							+ "'"+info.t_marital+"',"
							+ "'"+info.t_charact+"',"
							+ "'"+info.t_age_max+"');";
		}
		System.out.println(sql);
		int rst = conn.executeUpdate(sql);
		if(rst>0)
			return true;
		return false;
	}

	public static boolean updatePic(String id, String pic) {
		SqlConnection conn = new SqlConnection();
		String sql = "update user_info set pic='"+pic+"' where id='" + id + "';";
		int rst = conn.executeUpdate(sql);
		return rst >= 1;
	}
}
