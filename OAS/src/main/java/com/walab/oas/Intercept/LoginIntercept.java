package com.walab.oas.Intercept;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginIntercept extends HandlerInterceptorAdapter{
   /**
    * This implementation always returns {@code true}.
    */
   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
      throws Exception {
      HttpSession session = request.getSession();
      System.out.println("Session start? "+session);
      
      try {
          if (session != null && session.getAttribute("admin") != null) {
              return true;
          } else {
              ModelAndView modelAndView = new ModelAndView("redirect:/");
              modelAndView.addObject("msgCode", "else 세션이 만료되어 로그아웃 되었습니다. 다시 로그인 해주세요.");
              modelAndView.addObject("returnUrl", "/board/list");
              throw new ModelAndViewDefiningException(modelAndView);
          }
      } catch (Exception e) {
          ModelAndView modelAndView = new ModelAndView("redirect:/");
          modelAndView.addObject("msgCode", "세션이 만료되어 로그아웃 되었습니다. 다시 로그인 해주세요.");
          modelAndView.addObject("returnUrl", "/board/list");
          throw new ModelAndViewDefiningException(modelAndView);
      }
   }

   /**
    * This implementation is empty.
    */
   @Override
   public void postHandle(
         HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mav)
         throws Exception {
      HttpSession session = request.getSession();
      System.out.println("error admin int "+ session.getAttribute("admin"));
      if(session.getAttribute("admin") == null) {
    	  mav.setViewName("error/loginError");
      }
   }


}
