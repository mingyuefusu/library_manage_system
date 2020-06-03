package javabean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Common {
	/**
	 * 获取行总数
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public static int getCount(String table) throws SQLException, ClassNotFoundException {
		if(table == null || table.equals("")) {
			return 0;
		}
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		connection = Base.getConnection();
		try {
			pstmt = connection.prepareStatement("select count(*) as count from " +table);
			resultSet = pstmt.executeQuery();
			resultSet.next();
			return resultSet.getInt("count");
		}catch(Exception e) {
			return 0;
		}finally {
			Base.closeResource(connection, pstmt, resultSet);
		}
		
	}
}
