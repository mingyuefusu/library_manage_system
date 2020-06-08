package servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;

import javabean.Base;
import javabean.Util;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


@WebServlet("/admin/ruleList")
public class RuleList extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json; charset=utf8");
    	// 准备查询
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		String sql = "";
		// 准备返回参数
		int code = 1;
		String msg = "error";
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject = new JSONObject();
		try {
			connection = (Connection) Base.getConnection();
			sql = "select * from rules";
			pstmt = connection.prepareStatement(sql);
			resultSet = pstmt.executeQuery();
			while(resultSet.next()) {
				jsonObject.put("id", resultSet.getString("id"));
				jsonObject.put("limit_day", resultSet.getString("limit_day"));
				jsonObject.put("borrow_num", resultSet.getString("borrow_num"));
				jsonObject.put("borrow_library", resultSet.getString("borrow_library"));
				jsonObject.put("overtime_fee", resultSet.getString("overtime_fee"));
				jsonArray.add(jsonObject);
			}
			code = 0;
			if(!jsonArray.isEmpty()) {
				msg = "查询成功";
			}else {
				msg = "没有数据";
			}
		} catch (SQLException e) {
			msg = "sql错误";
		} catch (ClassNotFoundException e) {
			msg = "class没找到";
		} finally {
			try {
				Base.closeResource(connection, pstmt, resultSet);
			} catch (SQLException e) {
				msg = "关闭失败";
			}
		}
		
		PrintWriter out = resp.getWriter();
		out.print( Util.jsonResponse(code, msg, jsonArray.toString()) );
	}

}
