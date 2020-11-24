package javabean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Base {
	private static String driver = "com.mysql.cj.jdbc.Driver";
	private static String url = "jdbc:mysql://localhost:3306/library?&useSSL=false&serverTimezone=UTC&useUnicode=true&characterEncoding=UTF-8";
	private static String username = "root";
	private static String password = "root";

	/**
	 * 获取数据库连接
	 * 
	 * @return
	 * @throws ClassNotFoundException
	 */
	public static Connection getConnection() throws ClassNotFoundException {
		Connection connection = null;
		try {
			Class.forName(driver);
			connection = (Connection) DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}

	/**
	 * 公共查询
	 * 
	 * @param connection
	 *            连接
	 * @param preparedStatement
	 * @param resultSet
	 *            结果集
	 * @param sql
	 * @param params
	 * @return
	 * @throws SQLException
	 */
	public static ResultSet executequery(Connection connection, PreparedStatement preparedStatement,
			ResultSet resultSet, String sql, Object[] params) throws SQLException {
		if (preparedStatement == null) {
			preparedStatement = (PreparedStatement) connection.prepareStatement(sql);
		}
		for (int i = 0; params != null && i < params.length; i++) {
			preparedStatement.setObject(i + 1, params[i]);
		}
		resultSet = preparedStatement.executeQuery();
		return resultSet;

	}

	/**
	 * 公共修改方法
	 * 
	 * @param connection
	 * @param preparedStatement
	 * @param sql
	 * @param params
	 * @return
	 * @throws SQLException
	 */
	public static int executeUpdate(Connection connection, PreparedStatement preparedStatement, String sql,
			Object[] params) throws SQLException {
		if (preparedStatement == null) {
			preparedStatement = (PreparedStatement) connection.prepareStatement(sql);
		}
		for (int i = 0; params != null && i < params.length; i++) {
			preparedStatement.setObject(i + 1, params[i]);
		}
		int updateRows = preparedStatement.executeUpdate();
		return updateRows;

	}

	/**
	 * 释放资源
	 * 
	 * @param connection
	 * @param preparedStatement
	 * @param resultSet
	 * @return
	 * @throws SQLException
	 */
	public static boolean closeResource(Connection connection, PreparedStatement preparedStatement, ResultSet resultSet)
			throws SQLException {
		boolean flag = true;
		if (resultSet != null) {
			try {
				resultSet.close();
				resultSet = null;
			} catch (SQLException e) {
				e.printStackTrace();
				flag = false;
			}
		}
		if (preparedStatement != null) {
			try {
				preparedStatement.close();
				preparedStatement = null;
			} catch (SQLException e) {
				e.printStackTrace();
				flag = false;
			}
		}
		if (connection != null) {
			try {
				connection.close();
				connection = null;
			} catch (SQLException e) {
				e.printStackTrace();
				flag = false;
			}
		}
		return flag;
	}

}
