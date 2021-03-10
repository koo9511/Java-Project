package common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import common.wrapper.Wrapper;

/**
 * Servlet Filter implementation class filter
 */
@WebFilter(
	servletNames= {
			"MasterInsertServlet",
			"LoginServlet",
			"UpdateServlet",
			"SUpdateServlet"
	}
		)
public class filter implements Filter {

    /**
     * Default constructor. 
     */
    public filter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest)request;
		if(req.getMethod().equalsIgnoreCase("post")) {
			request.setCharacterEncoding("utf-8");
		}
		Wrapper encW = new Wrapper(req);
		encW.getParameter("userpwd");
		
		
		chain.doFilter(encW, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
