package javabean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class Admin {
	/**
	 * 用户登录
	 * 
	 * @param username
	 * @param password
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	@SuppressWarnings("null")
	public String login(String username, String password) throws ClassNotFoundException, SQLException {

		if (username == null || username.trim().equals("")) {
			return "账号不能为空";
		} else if (password == null || password.trim().equals("")) {
			return "密码不能为空";
		}
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		String sql = "select * from admin where username=? and password=? limit 1";
		connection = Base.getConnection();
		pstmt = (PreparedStatement) connection.prepareStatement(sql);
		pstmt.setString(1, username);
		pstmt.setString(2, password);
		resultSet = pstmt.executeQuery();
		try{
			if (resultSet.next()) {
				return "1";
			}
		}catch(Exception e) {
			return "发生未知错误";
		}finally {
			if(Base.closeResource(connection, pstmt, resultSet) == false) {
				System.out.println("关闭失败");
			}
		}
		
		return "账号或密码错误";
	}
	
	/**
	 * 获取图书列表
	 * @param page
	 * @param limit
	 * @return String json字符串
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public Map getBookList(String page, String limit, Map where) throws ClassNotFoundException, SQLException {
		Map<String, Object> map = new HashMap<String, Object>();
		String whereString = "";
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		connection = Base.getConnection();
		int number = Integer.valueOf(page);
		int size = Integer.valueOf(limit); 
		String sql = "select * from books ";
		if(where!=null && !where.isEmpty()) {
			whereString += " where "+where.get("condition") +" like '%" +where.get("conditionValue") +"%' ";
			sql += whereString;
		}
		sql += " limit ?,? ";
		System.out.println("sql: " +sql);
		pstmt = (PreparedStatement) connection.prepareStatement(sql);
		pstmt.setInt(1, (number-1) * size );
		pstmt.setInt(2, size);
		
		resultSet = pstmt.executeQuery();
		JSONObject json = new JSONObject();
		String result = "";
		int i = 1;
		
		// 获取行数据
		while( resultSet.next() ) {
			//System.out.println("????-------" +resultSet.getInt("count"));
			json.put("id", resultSet.getInt("id"));
			json.put("name", resultSet.getString("name"));
			json.put("library_id", resultSet.getInt("library_id"));
			json.put("sort_id", resultSet.getInt("sort_id"));
			json.put("position", resultSet.getString("position"));
			json.put("status", resultSet.getInt("status"));
			json.put("description", resultSet.getString("description"));
			if(i==1) {
				result = json.toString();
			}else {
				result += "," +json.toString();
			}
			i++;
		}
		System.out.println("result: " +result);
		map.put("data", result);
		
		// 获取总数count，重写sql
		int count = 0;
		sql = "select count(*) as count  from books ";
		if(where!=null && !where.isEmpty()) {
			//sql += " where "+where.get("condition") +" = " +where.get("conditionValue");
			sql += whereString;
		}
		System.out.println("countSql: " +sql);
		pstmt = connection.prepareStatement(sql);
		resultSet = pstmt.executeQuery();
		if(resultSet.next()) {
			count = resultSet.getInt("count");
		}
		System.out.println("count" +count);
		map.put("count:", count);
		Base.closeResource(connection, pstmt, resultSet);
		return map;
		
	}
	

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		//Common common = new Common();
		//System.out.println(common.getCount("books"));
		Admin admin = new Admin();
		//Map map =  admin.getBookList("1", "100");
		//System.out.println( map.get("count"));
	}
}
