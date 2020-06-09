package javabean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CompareDate {
	public static long show(String Str1, String Str2) {
		long between = 0;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			Date date1 = format.parse(Str1);
			Date date2 = format.parse(Str2);
			between = (date2.getTime() - date1.getTime());
			System.out.println(date1);
			System.out.println(date2);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		long days = between / (24 * 60 * 60 * 1000);
		return days;
	}

}
