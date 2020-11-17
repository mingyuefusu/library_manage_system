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


@WebServlet("/admin/sortDel")
public class SortDel extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// ！！！！！ 默认1为未分类
		String defaultId = "1";
		resp.setContentType("application/json; charset=utf8");
		// 接受数据
		String id = req.getParameter("id");
		
		// 准备数据
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		int result = 0;
		String sql = "";
		
		// 准备返回数据
		int code = 1;
		String msg = "";
		try {
			 // 不能删除未分类
			if(defaultId.equals(id)) {
				msg = "不能删除未分类";
			}else {
				connection = (Connection) Base.getConnection();
				// 分类下的文章修改
				sql = "update books set sort_id=? where sort_id=?";
				pstmt = connection.prepareStatement(sql);
				pstmt.setString(1, defaultId);
				pstmt.setString(2, id);
				result = pstmt.executeUpdate();
			
				// 进行删除
				sql = "delete from book_sort where id=?";
				pstmt = connection.prepareStatement(sql);
				pstmt.setString(1, id);
				result = pstmt.executeUpdate();
				if(result == 1) {
					code = 0;
					msg = "删除成功";
				}else {
					msg = "删除失败";
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
