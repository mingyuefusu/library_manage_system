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
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class CardList
 */
@WebServlet("/admin/cardList")
public class CardList extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json; charset=utf8");
		// 接收参数
		String limit = req.getParameter("limit");
		String page = req.getParameter("page");
		String condition = (String) req.getParameter("condition");
		String conditionValue = (String) req.getParameter("conditionValue");
		String where = null; // 无限制条件
		if (page == null) {
			page = "1";
		}
		if (limit == null) {
			limit = "10";
		}
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		int code = 1;
		String msg = "error";
		int count = 0;
		String sql = "";
		// String countSql = ""
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonResult = new JSONObject();
		try {
			// 获取数据
			connection = (Connection) Base.getConnection();
			sql = "select id,password,reader,rule_id,status from borrow_card";
			// where
			if (condition != null && conditionValue != null && !condition.isEmpty() && !conditionValue.isEmpty()) {
				where = " where " + condition + " like '%" + conditionValue + "%'";
				sql = sql + where;
			}
			// 分页
			sql += "  order by id desc limit ?,?";
			pstmt = connection.prepareStatement(sql);
			try {
				pstmt.setInt(1, (Integer.parseInt(page) - 1) * Integer.parseInt(limit));
				pstmt.setInt(2, Integer.parseInt(limit));
			} catch (NumberFormatException | SQLException e1) {
			}
			resultSet = pstmt.executeQuery();
			while (resultSet.next()) {
				jsonObject.put("id", resultSet.getString("id"));
				jsonObject.put("password", resultSet.getString("password"));
				jsonObject.put("reader", resultSet.getString("reader"));
				jsonObject.put("rule_id", resultSet.getString("rule_id"));
				jsonObject.put("status", resultSet.getString("status"));
				jsonArray.add(jsonObject);
			}
			// 获取总数
			sql = "select count(*) as count from borrow_card ";
			// 有限制
			if (where != null) {
				sql = sql + where;
			}
			pstmt = connection.prepareStatement(sql);
			resultSet = pstmt.executeQuery();
			if (resultSet.next()) {
				count = resultSet.getInt("count");
			}

			if (!jsonArray.isEmpty()) {
				code = 0;
				msg = "成功";
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
		jsonResult.put("code", code);
		jsonResult.put("count", count);
		jsonResult.put("msg", msg);
		jsonResult.put("data", jsonArray.toString());
		PrintWriter out = resp.getWriter();
		out.print(jsonResult.toString());
		// out.print("{\"code\":0,\"msg\":\"\",\"count\":\"234\",\"data\":[{\"id\":\"1\",\"password\":\"23442\",\"reader\":\"minm\",\"rule_id\":\"1\",\"status\":\"2\"}]}");
	}

}
