package servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javabean.JDBCBean;
import net.sf.json.JSONObject;


@WebServlet("/admin/bookDel")
public class BookDel extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json; charset=utf8"); 
		String id = req.getParameter("id");
		JSONObject json = new JSONObject();
		JDBCBean db = new JDBCBean();
		String sql = "delete from books where id = " +id;
		int result = 0;
		int code = 1;
		String msg = "";
		if( id != null && !id.equals("") ) {
			result = db.executeUpdate(sql);
		}
		if( result == 1 ) {
			code = 0;
			msg = "删除成功";
		}else {
			code = 1;
			msg = "删除失败";
		}
		json.put("code", code);
		json.put("msg", msg);
		db.close();
		PrintWriter out = resp.getWriter();
		out.print( json.toString() );
		
	}

}
