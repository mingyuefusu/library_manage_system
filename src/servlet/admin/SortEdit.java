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


@WebServlet("/admin/sortEdit")
public class SortEdit extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json; charset=utf8");
		// 接受数据
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String description = req.getParameter("description");
		
		// 准备数据
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		int result = 0;
		String sql = "";
		int count = 0 ;
		// 准备返回数据
		int code = 1;
		String msg = "";
		
		try {
			connection = (Connection) Base.getConnection();
			// 查询重复name
			sql = "select count(*) as count from book_sort where name=? and id != ?";
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			resultSet = pstmt.executeQuery();
			if(resultSet.next()) {
				// 有重复
				if(resultSet.getInt("count") > 0) {
					msg = "分类名不能重复";
				}else {
					// 进行插入
					sql = "update book_sort set name=?, description=? where id=?";
					pstmt = connection.prepareStatement(sql);
					pstmt.setString(1, name);
					pstmt.setString(2, description);
					pstmt.setString(3, id);
					result = pstmt.executeUpdate();
					if(result == 1) {
						code = 0;
						msg = "修改成功";
					}else {
						msg = "修改失败";
					}
				}
			}
			
		} catch (ClassNotFoundException e) {
			msg = "classnotfound";
		} catch (SQLException e) {
			msg = "SQL错误";
		} finally {
			try {
				Base.closeResource(connection, pstmt, resultSet);
			} catch (SQLException e) {
				msg = "关闭失败";
			}
		}
		
		PrintWriter out = resp.getWriter();
		out.print(Util.jsonResponse(code, msg, null));
		
	}
}
