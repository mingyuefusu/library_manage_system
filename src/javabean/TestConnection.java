package javabean;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.sql.Connection;

public class TestConnection {
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		// 获取rule
		Connection connection = null;
		PreparedStatement  pstmt = null;
		ResultSet resultSet = null;
		int result = 0;
		String password = "1234";
		String reader = "1234";
		String rule_id = "1";
		String status = "1";
		connection = (Connection) Base.getConnection();
		String sql = "insert into borrow_card(password, reader, rule_id, status) values(?,?,?,?)";
		pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, password);
		pstmt.setString(2, reader);
		pstmt.setString(3, rule_id);
		pstmt.setString(4, status);
		result = pstmt.executeUpdate();
		System.out.println(result);
		//获取id
		//connection1= (Connection) Base.getConnection();
		String findIdSql = "select id from borrow_card where password=? and reader=? and rule_id=? and status=? limit 1";
		pstmt = connection.prepareStatement(findIdSql);
		pstmt.setString(1, password);
		pstmt.setString(2, reader);
		pstmt.setString(3, rule_id);
		pstmt.setString(4, status);
//		pstmt1 = connection.prepareStatement(findIdSql);
//		pstmt1.setString(1, password);
//		pstmt1.setString(2, reader);
//		pstmt1.setString(3, rule_id);
//		pstmt1.setString(4, status);
		resultSet = pstmt.executeQuery();
		while(resultSet.next()) {
			System.out.println(resultSet.getString("id"));
		}
		
	}
}
