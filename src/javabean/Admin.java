package javabean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class Admin {
	/**
	 * 用户登录
	 * @param username
	 * @param password
	 * @return
	 * @throws ClassNotFoundException 
	 * @throws SQLException 
	 */
	@SuppressWarnings("null")
	public String login(String username, String password) throws ClassNotFoundException, SQLException {
		
		if(username == null || username.trim().equals("")) {
			return "账号不能为空";
		}else if(password == null || password.trim().equals("")) {
			return "密码不能为空";
		}
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		String sql = "select * from admin where username=?  and password=? limit 1";
		connection = Base.getConnection();
		pstmt = (PreparedStatement) connection.prepareStatement(sql);
		pstmt.setString(1, username);
		pstmt.setString(2, password);
		resultSet = pstmt.executeQuery();
		if(resultSet.next()) {
			return "1";
		}
		return "账号或密码错误";
	}
}
