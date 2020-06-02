package servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BookList
 */
@WebServlet("/admin/bookList")
public class BookList extends HttpServlet {
       
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//PrintWriter out = resp.getWriter();
//		out.print("????");
		// TODO Auto-generated method stub
		doPost(req, resp);
	}
	
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	resp.setContentType("application/json; charset=utf8");
    	PrintWriter out = resp.getWriter();
    	out.print("{\"code\":0,\"msg\":\"\",\"count\":1000,\"data\":[{\"id\":10000,\"name\":\"夏洛特的烦恼\",\"library_name\":\"南图\",\"sort_id\":\"言情\",\"position_id\":\"sdf\",\"state\":\"借出\",\"descript\":\"好看\",\"operate\":\"234\"},{\"id\":10000,\"name\":\"夏洛特的烦恼\",\"library_name\":\"南图\",\"sort_id\":\"言情\",\"position_id\":\"sdf\",\"state\":\"借出\",\"descript\":\"好看\",\"operate\":\"234\"},{\"id\":10000,\"name\":\"夏洛特的烦恼\",\"library_name\":\"南图\",\"sort_id\":\"言情\",\"position_id\":\"sdf\",\"state\":\"借出\",\"descript\":\"好看\",\"operate\":\"234\"},{\"id\":10010,\"name\":\"夏洛特的烦恼\",\"library_name\":\"南图\",\"sort_id\":\"言情\",\"position_id\":\"sdf\",\"state\":\"借出\",\"descript\":\"好看\",\"operate\":\"234\"}]}");
    }

}
