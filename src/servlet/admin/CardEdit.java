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
import net.sf.json.JSONObject;


@WebServlet("/admin/cardEdit")
public class CardEdit extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json; charset=utf8");
		// 接受数据
		String id = req.getParameter("id");
		String password = req.getParameter("password");
		String reader = req.getParameter("reader");
		String rule_id = req.getParameter("rule_id");
		String status = req.getParameter("status");
		// 准备资源
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		int result = 0;
		String sql = null;
		// 返回数据
		String code = "1";
		String msg = "error";
		JSONObject json = new JSONObject();
		PrintWriter out = resp.getWriter();
		// 判断数据
		if(id == null || password == null || reader == null || reader == null || status == null || 
				id.equals("") || password.equals("") || reader.equals("") || rule_id.equals("") || status.equals("")) {
			code = "1";
			msg = "参数不能为空";
		}else {
			sql = "update borrow_card set password=?, reader=?, rule_id=?, status=? where id=?";
			try {
				connection = (Connection) Base.getConnection();
				pstmt = connection.prepareStatement(sql);
				pstmt.setString(1, password);
				pstmt.setString(2, reader);
				pstmt.setString(3, rule_id);
				pstmt.setString(4, status);
				pstmt.setString(5, id);
				result = pstmt.executeUpdate();
			} catch (ClassNotFoundException e1) {
				msg = "错误";
			} catch (SQLException e) {
				msg = "sql错误";
			} finally {
				try {
					Base.closeResource(connection, pstmt, resultSet);
				} catch (SQLException e) {
					msg = "关闭失败";
				}
			}
			if(result == 1) {
				code = "0";
				msg = "修改成功";
			}
			json.put("code", code);
			json.put("msg", msg);
			out.print(json.toString());
		}
	}	

}
