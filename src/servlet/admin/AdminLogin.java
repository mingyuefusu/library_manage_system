package servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javabean.Admin;
import net.sf.json.JSONObject;

/**
 * 管理员登录
 * 
 * @author Mingyue
 *
 */
@WebServlet("/adminLogin")
public class AdminLogin extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 设置头文件
		response.setContentType("application/json; charset=utf8");
		PrintWriter out = response.getWriter();
		// 获取账号密码
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		// 设置响应map
		HashMap<String, Object> hashMap = new HashMap<String, Object>();

		Admin admin = new Admin();
		String result = null;
		try {
			result = admin.login(username, password);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		if (result != null && result.equals("1")) {
			HttpSession session = request.getSession();
			session.setAttribute("admin", username);
			hashMap.put("code", 0);
			hashMap.put("msg", "登录成功");
			hashMap.put("url", request.getContextPath() +"/admin/index.jsp");
		}else {
			hashMap.put("code", 1);
			hashMap.put("msg", result);
		}

		JSONObject json = JSONObject.fromObject(hashMap);
		out.write(json.toString());

	}

}
