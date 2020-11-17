package filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 系统管理员过滤
 * @author Mingyue
 *
 */
public class AdminFilter implements Filter {

	public void init(FilterConfig filterConfig) throws ServletException {

    }
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		if(session == null || session.getAttribute("admin") == null) {
			HttpServletResponse rep = (HttpServletResponse)response;
			PrintWriter out =response.getWriter();
			// iframe父页面直接跳转到登录界面
			out.print("<script>window.parent.location.href='"+ req.getContextPath() +"/adminLogin.html'</script>");
		}
		chain.doFilter(request, response);
	}
}
