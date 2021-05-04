package com.walab.oas.Intercept;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthIntercept extends HandlerInterceptorAdapter{
   /**
    * This implementation always returns {@code true}.
    */
   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
      throws Exception {
      HttpSession session = request.getSession();
      if(session.getAttribute(null) != null) {
         session.removeAttribute(null);
      }

    //CSRF공격을 referer방식으로 방어
      String referer = request.getHeader("REFERER"); // 보안성 검토. 정상적이지 않은 방법으로 접근시 차단
      if( referer != null && referer.length() > 0){
        System.out.println("referer : " + referer);
        System.out.println("You can enter");
      }else{
    	  System.out.println("You can not enter");
      }
      
      return true;
   }

   /**
    * This implementation is empty.
    */
   @Override
   public void postHandle(
         HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mav)
         throws Exception {
      HttpSession session = request.getSession();
      //System.out.println("error admin int "+ type(session.getAttribute("admin")));
      
	      int ad = Integer.parseInt( session.getAttribute("admin").toString());
	      System.out.println("auth posthandle come " + ad);
	      if(ad == 2) {
	         mav.setViewName("AccessDenied");
	      }
   }
}
