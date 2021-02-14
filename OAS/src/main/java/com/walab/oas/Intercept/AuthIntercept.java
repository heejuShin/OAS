package com.walab.oas.Intercept;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
      if(ad == 2) {
         mav.setViewName("AccessDenied");
      }
      
   }


}