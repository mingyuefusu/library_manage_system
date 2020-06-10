package servlet.admin;

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

@WebServlet("/admin/sortList")
public class SortList extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json; charset=utf8");
		// 接受参数

		// 准备参数
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		// 返回参数
		int code = 1;
		String msg = "error";
		int count = 0;
		String sql = "";
		PrintWriter out = resp.getWriter();
		// 开始查询
		try {
			connection = Base.getConnection();
			sql = "select * from book_sort";
			pstmt = connection.prepareStatement(sql);
			resultSet = pstmt.executeQuery();
			while (resultSet.next()) {
				jsonObject.put("id", resultSet.getString("id"));
				jsonObject.put("name", resultSet.getString("name"));
				jsonObject.put("description", resultSet.getString("description"));
				jsonArray.add(jsonObject.toString());
			}
			if (!jsonArray.isEmpty()) {
				code = 0;
				msg = "查询成功";
			} else {
				msg = "数据为空";
			}
		} catch (ClassNotFoundException e) {
			msg = "没找到";
			e.printStackTrace();
		} catch (SQLException e) {
			msg = "sql错误";
		} finally {
			try {
				Base.closeResource(connection, pstmt, resultSet);
			} catch (SQLException e) {
				msg = "关闭失败";
			}
		}
		out.print(Util.jsonResponse(code, msg, jsonArray.toString()));

	}

}
