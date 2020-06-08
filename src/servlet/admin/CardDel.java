package servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;

import javabean.Base;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@WebServlet("/admin/cardDel")
public class CardDel extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json; charset=utf8");
		// 接收数据
		String id = req.getParameter("id");
		// 处理数据
		Connection connection = null;
		PreparedStatement delCardPstmt = null;
		PreparedStatement delHistoryPstmt = null;
		String delCardSql = null;
		String delHistorySql = null;
		int delCardResult = 0;
		int delHistoryResult = 0;
		// 返回数据
		String code = "1";
		String msg = "error";
		JSONObject jsonObject = new JSONObject();
		JSONObject jsonData = new JSONObject();
		// 开始处理
		if(id != null && !id.equals("")) {
			try {
				// 公共连接
				connection = (Connection) Base.getConnection();
				// 删除借书记录
				delHistorySql = "delete from borrow_books where card_id=?";
				delHistoryPstmt = connection.prepareStatement(delHistorySql);
				delHistoryPstmt.setString(1, id);
				delHistoryResult = delHistoryPstmt.executeUpdate();
				// 返回删除记录条数
				jsonData.put("num", delHistoryResult);
				// 删除阅读证
				delCardSql = "delete from borrow_card where id=? limit 1";
				delCardPstmt = connection.prepareStatement(delCardSql);
				delCardPstmt.setString(1, id);
				delCardResult = delCardPstmt.executeUpdate();
				
			} catch (ClassNotFoundException e) {
				msg = "连接失败";
			} catch (SQLException e) {
				msg = "sql错误";
			} finally {
				try {
					delCardPstmt.close();
					Base.closeResource(connection, delCardPstmt, null);
				} catch (SQLException e) {
					msg = "关闭失败";
				}
			}
		}
		PrintWriter out = resp.getWriter();
		if(delCardResult == 1) {
			code = "0";
			msg = "删除借阅证成功";
		}
		jsonObject.put("code", code);
		jsonObject.put("msg", msg);
		jsonObject.put("data", jsonData);
		out.print(jsonObject.toString());
	}

}
