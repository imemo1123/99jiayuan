package cn.memo.handle;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import cn.memo.sql.SqlConnection;

public class ActivityHandle {
	public static List<Map<String, String>> getActivityList() {
		SqlConnection conn = new SqlConnection();
		String sql = "select id,title from activity where stt='0'";
		List<String> paramList  = new ArrayList<String>();
		paramList.add("id");
		paramList.add("title");
		List<Map<String, String>> rst = conn.queryMulData(sql, paramList);
		return rst;
	}
}
