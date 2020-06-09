package servlet.manager;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javabean.Base;
import javabean.Util;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class Announcement
 */
@WebServlet("/manager/announcement")
public class Announcement extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json; charset=utf8");
		// 准备数据
		Connection connection = null;
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet resultSet = null;
		// 返回数据
		int code = 1;
		String msg = "无数据";
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();

		try {
			connection = (Connection) Base.getConnection();
			sql = "select * from announcement";
			pstmt = connection.prepareStatement(sql);
			resultSet = pstmt.executeQuery();
			while (resultSet.next()) {
				jsonObject.put("id", resultSet.getString("id"));
				jsonObject.put("title", resultSet.getString("title"));
				jsonObject.put("detail", resultSet.getString("detail"));
				jsonObject.put("publish_date", resultSet.getString("publish_date"));

				jsonArray.add(jsonObject);
			}
			if (!jsonArray.isEmpty()) {
				code = 0;
				msg = "查询成功";
			} else {
				msg = "数据为空";
			}
		} catch (ClassNotFoundException e) {
			msg = "class找不到";
		} catch (SQLException e) {
			msg = "sql错误";
		} finally {
			try {
				Base.closeResource(connection, pstmt, resultSet);
			} catch (SQLException e) {
				msg = "关闭失败";
			}
		}
		PrintWriter out = resp.getWriter();
		out.print(Util.jsonResponse(code, msg, jsonArray.toString()));
	}
}
