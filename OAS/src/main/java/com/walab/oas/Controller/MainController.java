package com.walab.oas.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.walab.oas.DTO.User;
import com.walab.oas.DAO.MainDAO;



@RestController
@RequestMapping(value = "/") // 주소 패턴

public class MainController {
	
	
	//여기부터 예시 입니다!	
	//login
	@Autowired
	private MainDAO mainDao; 
	
	@RequestMapping(value = "/login") // GET 방식으로 페이지 호출  
	  public ModelAndView loginForm() throws Exception {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("login"); //들어갈 페이지 jsp 이름 -> login.jsp 페이지로 이동한다는 뜻
      return mav;
	}
	
	@RequestMapping(value="loginProcess",method=RequestMethod.POST) // POST 방식 -> view에서 controller로 넘길 데이터가 있을 시 POST 방식으로
	public ModelAndView loginProcess(HttpSession session,User user) throws Exception {
		ModelAndView mav;

		if(session.getAttribute("login")!=null) { //기존에 login이라는 세션 값이 존재할 경우
			session. removeAttribute("login"); //기존 값을 제거한다
		}

		//로그인이 성공하면 User 객체를 반환한다.
		User one=mainDao.login(user); // User는 사용자의 정보를 저장하는 DTO

		if(one!=null) {//로그인 성공 (해당 유저의 정보가 있다는 뜻이기 때문에!
			
			//세션에 User 정보를 저장한다.
			session.setAttribute("Name", one.getName()); 
			session.setAttribute("ID", one.getId());
			session.setAttribute("email", one.getEmail_address());
			session.setAttribute("login", one);
			
			mav=new ModelAndView("home"); //로그인 성공시 유저의 아이디로 메인 페이지 돌아가기
		}
		
		else {//로그인 실패
			mav=new ModelAndView("login"); //로그인 실패시 다시 로그인 화면으로
			mav.addObject("no_login","아이디 또는 비밀번호를 다시 입력해주세요."); // "no_login"이라는 key로 value를 "아이디 또는 비밀번호를 다시 입력해주세요" 담아서 해당 view로 넘김
		}
		
		return mav;
	}
	//예시 끝

}
