package javabean;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateTime {

	public static String show() {
		SimpleDateFormat myFmt2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 等价于now.toLocaleString()
		Date now = new Date();

		return myFmt2.format(now);

	}
	
	public static String show(int n) {
		Date d = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currdate = format.format(d);
		Calendar ca = Calendar.getInstance();
		ca.add(Calendar.DATE, n);// num为增加的天数，可以改变的
		d = ca.getTime();
		String enddate = format.format(d);
		return enddate;
	}
	
	// 只要年月日
	public static String showDate(int n) {
		Date d = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String currdate = format.format(d);
		Calendar ca = Calendar.getInstance();
		ca.add(Calendar.DATE, n);// num为增加的天数，可以改变的
		d = ca.getTime();
		String enddate = format.format(d);
		return enddate;
	}
	// 只要月日
	public static String showMD(int n) {
		Date d = new Date();
		SimpleDateFormat format = new SimpleDateFormat("MM-dd");
		String currdate = format.format(d);
		Calendar ca = Calendar.getInstance();
		ca.add(Calendar.DATE, n);// num为增加的天数，可以改变的
		d = ca.getTime();
		String enddate = format.format(d);
		return enddate;
	}


}
