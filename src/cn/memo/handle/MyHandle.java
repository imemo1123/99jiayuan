package cn.memo.handle;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MyHandle {
	public static String getDate(String fmt) {
		SimpleDateFormat df = new SimpleDateFormat(fmt);//设置日期格式
		return df.format(new Date());// new Date()为获取当前系统时间
	}
	public static String getDate() {
		return getDate("yyyyMMddHHmmss");//设置日期格式
	}
	public static int getOtherSex(int sex) {
		if(sex == 0){
			return 1;
		}else{
			return 0;
		}
	}
	public static String getOtherSex(String sex) {
		if(sex.equals("0")){
			return "1";
		}else{
			return "0";
		}
	}
	public static String nvl(String v,String w) {
		if(v==null){
			return w;
		}else {
			return v;
		}
	}
	public static String nvl(String v) {
		if(v==null){
			return "";
		}else {
			return v;
		}
	}
}
