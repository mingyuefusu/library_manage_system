package javabean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBCBean {
	private static String driver = "com.mysql.cj.jdbc.Driver";
	private static String url = "jdbc:mysql://localhost:3306/library?&useSSL=false&serverTimezone=UTC&useUnicode=true&characterEncoding=UTF-8";
	private static String username = "root";
	private static String password = "root";
	private Connection conn = null;
	private Statement stmt = null;

	public JDBCBean() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, username, password);
			stmt = conn.createStatement();
			System.out.println("同数据库建立连接！");
		} catch (Exception ex) {
			System.out.println("无法同数据库建立连接！");
		}
	}

	public int executeUpdate(String s) {
		int result = 0;
		try {
			System.out.println(s + "------" + stmt + "-----");
			result = stmt.executeUpdate(s);
		} catch (Exception e) {
			System.out.println("执行更新错误！");
		}
		return result;
	}

	public ResultSet executeQuery(String s) {
		ResultSet rs = null;
		try {
			rs = stmt.executeQuery(s);
		} catch (Exception e) {
			System.out.println("执行查询错误！ " + e.getMessage());
		}
		return rs;
	}

	public void close() {
		try {
			stmt.close();
			conn.close();
		} catch (Exception e) {

		}
	}
}
