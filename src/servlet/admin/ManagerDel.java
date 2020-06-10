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


@WebServlet("/admin/managerDel")
public class ManagerDel extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json; charset=utf8");
		String id = req.getParameter("id");
		// 准备参数
		String sql = "";
		Connection  connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		int result = 0;
		// 返回参数
		int code = 1;
		String msg = "";
		PrintWriter out = resp.getWriter();
		try {
			connection = (Connection) Base.getConnection();
			sql = "delete from manager where id=?";
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
			if(result == 1) {
				code = 0;
				msg = "删除成功";
			}else {
				msg = "删除失败";
			}
		} catch (ClassNotFoundException e) {
			msg = "class not found";
		} catch (SQLException e) {
			msg = "sql错误";
		}
		out.print(Util.jsonResponse(code, msg, null));
		
	}

}
