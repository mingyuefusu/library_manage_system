package filter;

import java.io.IOException;

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
 * 图书管理员过滤
 */
public class ManagerFilter implements Filter {

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		if (session == null || session.getAttribute("manager") == null) {
			HttpServletResponse rep = (HttpServletResponse) response;
			rep.sendRedirect(req.getContextPath() + "/loginManager.html");
		}
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

}
