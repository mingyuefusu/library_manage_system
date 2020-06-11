package javabean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Reader {
	@SuppressWarnings("null")
	public String login(String user, String psw) throws ClassNotFoundException, SQLException {

		if (user == null || user.trim().equals("")) {
			return "账号不能为空";
		} else if (psw == null || psw.trim().equals("")) {
			return "密码不能为空";
		}
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		String sql = "select * from borrow_card where ID=? and PASSWORD=?";
		connection = Base.getConnection();
		pstmt = (PreparedStatement) connection.prepareStatement(sql);
		pstmt.setString(1, user);
		pstmt.setString(2, psw);
		resultSet = pstmt.executeQuery();
		if (resultSet.next()) {
			return "1";
		}
		return "账号或密码错误";
	}
}
