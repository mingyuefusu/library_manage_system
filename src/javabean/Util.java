package javabean;

import java.text.SimpleDateFormat;

import net.sf.json.JSONObject;

public class Util {
	/**
	 * 主要用来计算json字符串中对象的个数
	 * @param str
	 * @param contain
	 * @return
	 */
	public static int getCountString(String str, String contain) {
		int count = ( str.length()-str.replace(contain, "").length() ) / contain.length();
		return count;
	}
	
	/**
	 * 数据库取出来的datetime有 .0 ,用来去掉
	 * @param dateTime
	 * @return
	 */
	public static String getFormatDateTime(String dateTime) {
		if(dateTime != null && dateTime.indexOf(".0") != -1) {
			return dateTime.substring(0, dateTime.length()-2);
		}else if(dateTime != null) {
			return dateTime;
		}
		return null;
	}
	
	/**
	 * 获取当前时间
	 * @return
	 */
	public static String getCurrentTimeString() {
		java.util.Date date = new java.util.Date();
		SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return dateFormat.format(date);
	}
	
	public static String jsonResponse(int code, String msg, String data) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("code", code);
		jsonObject.put("msg", msg);
		if( data!=null ) {
			jsonObject.put("data", data);
		}
		
		return jsonObject.toString();
	}
	
	public static void main(String[] args) {
		java.util.Date date = new java.util.Date();
		SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		System.out.println(dateFormat.format(date));
	}
}
