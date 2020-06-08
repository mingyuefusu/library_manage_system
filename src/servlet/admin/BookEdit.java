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


@WebServlet("/admin/bookEdit")
public class BookEdit extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json; charset=utf8");
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String author = req.getParameter("author");
		String library_id = req.getParameter("library_id");
		String sort_id = req.getParameter("sort_id");
		String position = req.getParameter("position");
		String status = req.getParameter("status");
		String description = req.getParameter("description");
		System.out.println(description+"-------------");
		JSONObject json = new JSONObject();
		//if(id == null || id.equals(""))
		Connection connection = null;
		PreparedStatement pstmt = null;
		//ResultSet resultSet = null;
		int result = 0;
		String sql = "update books set name=? ,author=? ,library_id=? ,sort_id=? ,position=? ,status=?, description=? where id=?";
		PrintWriter out = resp.getWriter();
		try {
			connection = (Connection) Base.getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, author);
			pstmt.setString(3, library_id);
			pstmt.setString(4, sort_id);
			pstmt.setString(5, position);
			pstmt.setString(6, status);
			pstmt.setString(7, description);
			pstmt.setString(8, id);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				Base.closeResource(connection, pstmt, null);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(result==1) {
			json.put("code", "0");
			json.put("msg", "success");
		}else {
			json.put("code", "1");
			json.put("msg", "error");
		}
		out.write(json.toString());
		
		
		 
		
		//System.out.println(postData);
		//JSONObject json = JSONObject.fromObject();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

}
