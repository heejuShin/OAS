package com.walab.oas.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.walab.oas.DTO.Form;
import com.walab.oas.DTO.UserEx;

@RestController
@RequestMapping(value = "/")

public class AdminController {
	
	//신청폼 (Admin) Create
	@RequestMapping(value = "/admin/form/create")
	  public ModelAndView createForm() throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminFormCreate");
		return mav;
	}
	
	//신청폼 Create	
	@RequestMapping(value="/admin/form/formCreate",method=RequestMethod.POST)
	public ModelAndView saveFormData(@ModelAttribute Form form) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminFormCreate"); //form 생성 후 들어갈 페이지
		//Form table에는 그냥 insert하면 됨 -> DAO에 Form 객체 전달
		//문제는 Field랑 Item table 우예하징..?

		return mav;
	}
	
	//신청폼 (Admin) Update
	@RequestMapping(value = "/admin/form/update/{link}")
	  public ModelAndView updateForm() throws Exception {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("adminFormUpdate");
		return mav;
	}
	
	//신청폼 (Admin) View -> 하연언니 여기 하시면 됩니당!
	@RequestMapping(value = "/admin/form/result/{link}")
	  public ModelAndView readForm() throws Exception {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("adminFormCreate");
		return mav;
	}
	
}
