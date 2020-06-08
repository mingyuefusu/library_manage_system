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
import javabean.JDBCBean;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class CardAdd
 */
@WebServlet("/admin/cardAdd")
public class CardAdd extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json; charset=utf8");
		// 获取参数
		String reader = req.getParameter("reader");
		String password = req.getParameter("password");
		String rule_id = req.getParameter("rule_id");
		String status = req.getParameter("status");
		// 准备资源
		String code = "1";
		String msg = "error";
		String data = "";
		JSONObject json = new JSONObject();
		JSONObject jsonData = new JSONObject();
		Connection connection = null;
		Connection connection1 = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt1 = null;
		String sql = null;
		int result = 0;
		ResultSet dataSet = null;
		// 参数不能为空
		if(reader == null || password == null || rule_id == null || rule_id == null || status == null) {
			code = "1";
			msg = "值不能为空";
		}else {
			try {
				connection = (Connection) Base.getConnection();
				sql = "insert into borrow_card(password, reader, rule_id, status) values(?,?,?,?)";
				pstmt = connection.prepareStatement(sql);
				pstmt.setString(1, password);
				pstmt.setString(2, reader);
				pstmt.setString(3, rule_id);
				pstmt.setString(4, status);
				result = pstmt.executeUpdate();
				
				//获取id
				connection1= (Connection) Base.getConnection();
				String findIdSql = "select id from borrow_card where password=? and reader=? and rule_id=? and status=? limit 1";
				pstmt1 = connection1.prepareStatement(findIdSql);
				pstmt1.setString(1, password);
				pstmt1.setString(2, reader);
				pstmt1.setString(3, rule_id);
				pstmt1.setString(4, status);
				dataSet = pstmt1.executeQuery();
				if(dataSet.next()) {
					jsonData.put("id", dataSet.getString("id"));
				}
			} catch (ClassNotFoundException e) {
				msg = "发生异常";
			} catch (SQLException e) {
				msg = "sql错误";
				System.out.println("sql失败");
			} 
			try {
				Base.closeResource(connection, pstmt, null);
				Base.closeResource(connection1, pstmt1, dataSet);
			} catch (SQLException e) {
				msg = "关闭资源失败";
			}
			if(result == 1 && !jsonData.isNullObject() && !jsonData.isEmpty()) {
				System.out.println(jsonData.toString());  //debug
				code = "0";
				msg = "添加成功";
			}else {
				code = "1";
				msg = "执行失败";
			}
		}
		json.put("code", code);
		json.put("msg", msg);
		json.put("data", jsonData.toString());
		PrintWriter out = resp.getWriter();
		out.print(json.toString());
	}

}
