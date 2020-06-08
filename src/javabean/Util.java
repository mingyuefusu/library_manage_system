package javabean;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
	
	/*
	 * 返回json数据
	 */
	public static String jsonResponse(int code, String msg, String data) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("code", code);
		jsonObject.put("msg", msg);
		if( data!=null ) {
			jsonObject.put("data", data);
		}
		return jsonObject.toString();
	}
	
	/*
	 * md5加密
	 */
	public static String stringToMD5(String plainText) {
        byte[] secretBytes = null;
        try {
            secretBytes = MessageDigest.getInstance("md5").digest(
                    plainText.getBytes());
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("没有这个md5算法！");
        }
        String md5code = new BigInteger(1, secretBytes).toString(16);
        for (int i = 0; i < 32 - md5code.length(); i++) {
            md5code = "0" + md5code;
        }
        return md5code;
    }
	
	public static String passMd5(String password) {
		String salt = "ew!.E";
		return Util.stringToMD5(password +salt);
	}
	
	public static void main(String[] args) {
		System.out.println(Util.passMd5("admin"));
		//java.util.Date date = new java.util.Date();
		//SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		//System.out.println(dateFormat.format(date));
	}
}
