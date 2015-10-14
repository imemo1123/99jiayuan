package cn.memo.handle;

public class JspHandle {
	private static String[] addrs = {"冷水滩","零陵","东安","祁阳","双牌","宁远","新田","江华","江永","道县","蓝山"};
	public static String[] charact = {"活泼开朗","乐观积极","多愁善感","风趣幽默","内向害羞","温柔贤惠","认真仔细","忠厚老实","成熟稳重","童心未泯","新潮时尚","精明睿智"};
	public static String getHeightOptions() {
		String optionHtml = "";
		optionHtml += "<option value=''>185以上</option>";
		for(int i=185;i>=160;i--){
			optionHtml += "<option value='"+i+"'>"+i+"</option>";
		}
		optionHtml += "<option value=''>160以下</option>";
		return optionHtml;
	}
	public static String getAgeOptions() {
		String optionHtml = "";
		for(int i=18;i<=60;i++){
			optionHtml += "<option value='"+i+"'>"+i+"</option>";
		}
		optionHtml += "<option value='60岁以上'>60岁以上</option>";
		return optionHtml;
	}
	public static String getAddrOptions(){
		String optionHtml = "";
		for (int i = 0; i < addrs.length; i++) {
			optionHtml += "<option value='"+addrs[i]+"'>"+addrs[i]+"</option>";
		}
		optionHtml += "<option value='其他'>其他</option>";
		return optionHtml;
	}
	
	public static String getCharactCheck(String name){
		String checkHtml = "";
		for(int i=0;i<charact.length;i++){
			checkHtml += "<li ><label><input type='checkbox' name='"+name+"' value='"+i+"'/>"+charact[i]+"</label></li>";
		}
		return checkHtml;
	}
}
