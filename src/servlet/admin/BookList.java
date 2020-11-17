package servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javabean.Admin;
import javabean.Common;
import javabean.Util;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class BookList
 */
@WebServlet("/admin/bookList")
public class BookList extends HttpServlet {
       
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json; charset=utf8");
		JSONObject json = new JSONObject();
		String result = null;
		Map<String, Object> map = null;
		int code = 1;
		String msg = "";
		String data = "";
		String page = (String) req.getParameter("page");
		String limit = (String) req.getParameter("limit");
		String condition = (String) req.getParameter("condition");
		String conditionValue = (String) req.getParameter("conditionValue");
		Map where = new HashMap<String, String>();
		// 传输数据过滤
		if(page == null) {
			page = "1";
		}
		if(limit == null) {
			limit = "10";
		}
		if(condition == null || conditionValue == null || condition.isEmpty() || conditionValue.isEmpty()) {
			condition = null;
			conditionValue = null;
		}else {
			where.put("condition", condition);
			where.put("conditionValue", conditionValue);
		}
		Admin admin = new Admin();
		try {
			map = admin.getBookList(page, limit, where);
			result = (String) map.get("data");
		} catch (ClassNotFoundException | SQLException e) {
			msg =  "数据库获取信息失败";
		}
		
		if(result == null || result.isEmpty() || result.equals("1")) {
			json.put("code", 1);
			json.put("msg", "数据为空");
		} else {
			json.put("code", 0);
			json.put("msg", "success");
			json.put("count", map.get("count"));
			result = "[" +result +"]";
			json.put("data", result);
		}
		
		PrintWriter out = resp.getWriter();
		out.print(json.toString());
	}
	
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	doGet(req, resp);
    }
}               