package com.walab.oas.security;

import java.io.IOException;
import java.util.Objects;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.springframework.http.MediaType;

import com.navercorp.lucy.security.xss.servletfilter.XssEscapeFilter;
import com.navercorp.lucy.security.xss.servletfilter.XssEscapeServletFilterWrapper;
import com.nhncorp.lucy.security.xss.XssFilter;


public class XssEscapeServletCustomFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}
	@Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {
 
        if (isRequestBody(req)) {
            chain.doFilter(new HttpServletRequestBodyWrapper(req, xssFilter), res);
        } else {
            chain.doFilter(new XssEscapeServletFilterWrapper(req, xssEscapeFilter), res);
        }
    }

	private boolean isRequestBody(ServletRequest req) {
        return Objects.nonNull(req.getContentType()) && req.getContentType().contains(MediaType.APPLICATION_JSON_VALUE);
    }
 
    private XssEscapeFilter xssEscapeFilter = XssEscapeFilter.getInstance();
    private XssFilter xssFilter = XssFilter.getInstance("lucy-xss-servlet-filter-rule.xml");
    
	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

}
