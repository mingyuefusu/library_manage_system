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
import javabean.DateTime;
import javabean.Util;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@WebServlet("/admin/libraryData")
public class LibraryData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json; charset:utf8");
		// 准备参数
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		String sql = "";
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonData = new JSONArray();
		JSONArray jsonDays = new JSONArray();
		// 返回参数
		int code = 1;
		String msg = "error";
		int count = 0;
		PrintWriter out = resp.getWriter();
		
		// 开始查询
		try {
			connection = Base.getConnection();
			int i = 30;
			// 获取30天
			while(i!=0) {
				i--;
				sql = "select count(*) as count from borrow_books where date_format(borrow_date,'%Y-%m-%d')=? order by id desc";
				String date = DateTime.showDate(-i); // 设置日期
				String md = DateTime.showMD(-i);
				pstmt = connection.prepareStatement(sql);
				pstmt.setString(1,date);
				resultSet = pstmt.executeQuery();
				while(resultSet.next()) {
					jsonData.add(resultSet.getString("count"));
					jsonDays.add(md);
				}
			}	
			jsonObject.put("data", jsonData);
			jsonObject.put("days", jsonDays);
			if(!jsonObject.isEmpty()) {
				code = 0;
				msg =  "查询成功";
			}else {
				msg = "数据为空";
			}
		} catch (ClassNotFoundException e) {
			msg = "没找到";
			e.printStackTrace();
		} catch (SQLException e) {
			msg = "sql错误";
		}finally {
			try {
				Base.closeResource(connection, pstmt, resultSet);
			} catch (SQLException e) {
				msg = "关闭失败";
			}
		}
		out.print( Util.jsonResponse(code, msg, jsonObject.toString()) );
    }

}
