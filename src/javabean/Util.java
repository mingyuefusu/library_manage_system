package javabean;

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
	public static void main(String[] args) {
		System.out.println(Util.getCountString("234{sdf{sdf{", "{"));
	}
}
