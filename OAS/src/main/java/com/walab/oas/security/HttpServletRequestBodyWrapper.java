package com.walab.oas.security;

import javax.servlet.http.HttpServletRequestWrapper;

import com.nhncorp.lucy.security.xss.XssFilter;

import javax.servlet.ReadListener;
import javax.servlet.ServletInputStream;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import java.io.*;

public class HttpServletRequestBodyWrapper extends HttpServletRequestWrapper{

	 private String body;
	 private XssFilter xssFilter;
	 
	    public HttpServletRequestBodyWrapper(ServletRequest request, XssFilter xssFilter) throws IOException {
	        super((HttpServletRequest) request);
	        this.xssFilter = xssFilter;
	        body = xssFilter.doFilter(
	                getBody((HttpServletRequest)request)
	        );
	    }
	 
	    @Override
	    public ServletInputStream getInputStream() {
	        final ByteArrayInputStream bis = new ByteArrayInputStream(body.getBytes());
	        return new ServletInputStreamImpl(bis);
	    }
	 
	    @Override
	    public BufferedReader getReader() throws IOException {
	        return new BufferedReader(new InputStreamReader(this.getInputStream()));
	    }
	 
	    private String getBody(HttpServletRequest request) throws IOException {
	 
	        StringBuilder sb = new StringBuilder();
	 
	        try (
	                InputStream inputStream = request.getInputStream();
	                BufferedReader br = new BufferedReader(new InputStreamReader(inputStream))
	        ) {
	            char[] charBuffer = new char[128];
	            int bytesRead = -1;
	            while ((bytesRead = br.read(charBuffer)) > 0) {
	                sb.append(charBuffer, 0, bytesRead);
	            }
	        }
	        return sb.toString();
	    }
	 
	    class ServletInputStreamImpl extends ServletInputStream {
	        private InputStream is;
	        public ServletInputStreamImpl(InputStream bis) {
	            is = bis;
	        }
	 
	        public int read() throws IOException {
	            return is.read();
	        }
	 
	        public int read(byte[] b) throws IOException {
	            return is.read(b);
	        }
	 
	        @Override
	        public boolean isFinished() {
	            return false;
	        }
	 
	        @Override
	        public boolean isReady() {
	            return false;
	        }
	 
	        @Override
	        public void setReadListener(ReadListener listener) {
	 
	        }
	    }
}
