package javabean;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTime {

	public static String show() {
		SimpleDateFormat myFmt2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 等价于now.toLocaleString()
		Date now = new Date();

		return myFmt2.format(now);

	}

}
