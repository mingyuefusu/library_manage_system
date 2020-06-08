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


@WebServlet("/admin/managerEdit")
public class ManagerEdit extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json; charset=utf8");
		// 接收参数
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String password = req.getParameter("password");
		String email = req.getParameter("email");
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
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonObject  = new JSONObject();
		// 进行查询
		if(name==null || name.equals("")|| password==null || password.equals("") || email==null || email.equals("")) {
			msg = "参数不能为空";
			out.print(Util.jsonResponse(code, msg, null));
		}else {
			try {
				connection = (Connection) Base.getConnection();
				// 添加管理员
				sql = "update manager set name=?, password=?, email=? where id=?";
				pstmt = connection.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, password);
				pstmt.setString(3, email);
				pstmt.setString(4, id);
				result = pstmt.executeUpdate();
				
				// 返回数据
				if(result == 1 ){
					code = 0;
					msg = "修改成功";
				}else {
					msg = "修改失败";
				}
			} catch (ClassNotFoundException e) {
				msg = "class not found";
			} catch (SQLException e) {
				msg = "sql错误";
			} finally {
				try {
					Base.closeResource(connection, pstmt, resultSet);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			out.print(Util.jsonResponse(code, msg, null));
		}
		
	}

}
