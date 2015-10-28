package com.t3q.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * Servlet Filter implementation class CharsetFilter
 */
public class CharsetFilter implements Filter {
	private String encoding="UTF-8";
	
	public void init(FilterConfig config) throws ServletException {
		encoding = config.getInitParameter("requestEncoding");
		if (encoding == null)
			encoding = "UTF-8";
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain next) throws IOException, ServletException {
		request.setCharacterEncoding(encoding);
		response.setCharacterEncoding(encoding);
		next.doFilter(request, response);
	}

	public void destroy() {
	}

}
