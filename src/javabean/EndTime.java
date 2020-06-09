package javabean;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class EndTime {

	public static String show(int n) {
		Date d = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currdate = format.format(d);
		System.out.println("现在的日期是：" + currdate);

		Calendar ca = Calendar.getInstance();
		ca.add(Calendar.DATE, n);// num为增加的天数，可以改变的
		d = ca.getTime();
		String enddate = format.format(d);
		return enddate;
	}

}
