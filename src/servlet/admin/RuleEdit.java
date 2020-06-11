package servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;

import javabean.Base;
import javabean.Common;
import javabean.Util;

/**
 * Servlet implementation class RuleEdit
 */
@WebServlet("/admin/ruleEdit")
public class RuleEdit extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json; charset=utf8");
		// 准备数据
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		int result = 0;
		String sql = "";
		String borrow_library = "";
		
		// 准备返回数据
		int code = 1;
		String msg = "";
		
		// 获取数据
		// 获取限定图书馆1、2、3
		int num = 0;
		try {
			Map<String, String> libraryMap = Common.getLibraryMap();
			for(String key : libraryMap.keySet()) {
				if(req.getParameter("borrow_library[" +key +"]") != null) {
					if(num == 0) {
						borrow_library += key;
						num++;
					}else {
						borrow_library += "、"+key;
					}
				}
			}
			if(borrow_library.isEmpty()) {
				msg = "允许图书馆不能为空";
			}
		} catch (SQLException e) {
			msg = "获取图书馆失败";
		}
		String borrow_num = req.getParameter("borrow_num");
		String limit_day = req.getParameter("limit_day");
		String overtime_fee = req.getParameter("overtime_fee");
		String id = req.getParameter("id");
		try {
			connection = (Connection) Base.getConnection();
			sql = "update rules set borrow_num=?, limit_day=?, borrow_library=?,overtime_fee=? where id=?";
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, borrow_num);
			pstmt.setString(2, limit_day);
			pstmt.setString(3, borrow_library);
			pstmt.setString(4, overtime_fee);
			pstmt.setString(5, id);
			result = pstmt.executeUpdate();
			if(result == 1) {
				code = 0;
				msg = "success";
			}
		} catch (ClassNotFoundException e) {
			msg = "classnotfound";
		} catch (SQLException e) {
			msg = "SQL错误";
		} finally {
			try {
				Base.closeResource(connection, pstmt, null);
			} catch (SQLException e) {
				msg = "关闭失败";
			}
		}
		
		PrintWriter out = resp.getWriter();
		out.print(Util.jsonResponse(code, msg, null));
		
		
		
	}

}
