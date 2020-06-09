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
import javax.servlet.http.HttpSession;

import javabean.Base;
import javabean.Util;
import net.sf.json.JSONObject;


@WebServlet("/admin/updatePassword")
public class UpdatePassword extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json; charset=utf8");
		// 接受数据
		String oldPassword = req.getParameter("oldPassword");
		String newPassword = req.getParameter("newPassword");
		String conPassword = req.getParameter("conPassword");
		HttpSession session = req.getSession();
		String username = (String) session.getAttribute("admin");
		
		
		// 准备资源
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		int result = 0;
		String sql = null;
		int count = 0;
		// 返回数据
		int code = 1;
		String msg = "error";
		JSONObject json = new JSONObject();
		PrintWriter out = resp.getWriter();
		
		// 可靠性
		if(conPassword.equals(newPassword)) {
			// 查询
			try {
				connection = Base.getConnection();
				// 验证账号密码
				sql = "select count(*) as count from admin where username=? and password=?";
				pstmt = connection.prepareStatement(sql);
				pstmt.setString(1, username);
				pstmt.setString(2, Util.passMd5(oldPassword));
				resultSet = pstmt.executeQuery();
				while(resultSet.next()) {
					count = resultSet.getInt("count");
				}
				// 修改密码
				// 密码正确
				if(count >= 1) {
					sql = "update admin set password=? where username=?";
					pstmt = connection.prepareStatement(sql);
					pstmt.setString(1, Util.passMd5(newPassword));
					pstmt.setString(2, username);
					result = pstmt.executeUpdate();
					if(result == 1) {
						code = 0;
						msg = "修改成功";
					}else {
						msg = "修改失败";
					}
					
				}else {
					msg = "密码错误";
				}
			} catch (ClassNotFoundException e) {
				 	msg = "class notfound";
			} catch (SQLException e) {
					msg = "sql错误";
			} finally {
				try {
					Base.closeResource(connection, pstmt, resultSet);
				} catch (SQLException e) {
					msg = "关闭失败";
				}
			}
			
		}else {
			msg = "两次密码不一致";
		}
		out.print(Util.jsonResponse(code, msg, null));
	}

}
