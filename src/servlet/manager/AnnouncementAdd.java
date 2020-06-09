package servlet.manager;

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
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class AnnouncementAdd
 */
@WebServlet("/manager/announcementAdd")
public class AnnouncementAdd extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json; charset=utf8");
		// 接收参数
		String id = req.getParameter("id");
		String tit = req.getParameter("title");
		String det = req.getParameter("detail");
		DateTime date = new DateTime();
		String time = date.show();
		// 准备参数
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		int result = 0;
		int count = 0;
		// 返回参数
		int code = 1;
		String msg = "";

		JSONArray jsonArray = new JSONArray();
		JSONObject json = new JSONObject();
		String sql = "insert into announcement(title, detail, publish_date) values(?,?,?)";
		System.out.println(sql);
		PrintWriter out = resp.getWriter();
		try {
			connection = (Connection) Base.getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, tit);
			pstmt.setString(2, det);
			pstmt.setString(3, time);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				Base.closeResource(connection, pstmt, null);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (result == 1) {
			json.put("code", "0");
			json.put("msg", "success");
		} else {
			json.put("code", "1");
			json.put("msg", "error");
		}
		out.write(json.toString());
	}
}
