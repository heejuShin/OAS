package com.walab.oas.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.walab.oas.DAO.MainDAO;
import com.walab.oas.DAO.MyPageDAO;
import com.walab.oas.DTO.Category;
import com.walab.oas.DTO.Criteria;
import com.walab.oas.DTO.Form;
import com.walab.oas.DTO.PageMaker;
import com.walab.oas.DTO.SearchCriteria;

@RestController
@RequestMapping(value = "/") // 주소 패턴
public class MainController {
	
	
	@Autowired
	private MainDAO mainDao; 
	
	
	//메인페이지 가기
	@RequestMapping(value = "/") // GET 방식으로 페이지 호출
	public ModelAndView goMypage(HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
//		int user_id=(Integer) session.getAttribute("ID");
		int user_id= 1;
		
		List<Form> form_list=mainDao.formList();
		List<Category> category_list=mainDao.categoryList();
		
		JSONArray jArray = new JSONArray();
		JSONArray jArray2 = new JSONArray();
		
        try {
        	for (int i = 0; i < form_list.size() ; i++) {   
        		JSONObject ob =new JSONObject();
        		ob.put("category_id", form_list.get(i).getCategory_id());
		        ob.put("categoryName", form_list.get(i).getCategoryName());
	            ob.put("id", form_list.get(i).getId());
	            ob.put("formName", form_list.get(i).getFormName());
	            ob.put("explanation", form_list.get(i).getExplanation());
	            ob.put("startDate", form_list.get(i).getStartDate());
	            ob.put("endDate", form_list.get(i).getEndDate());
	            jArray.put(ob);
	        }
        	
        	for (int i = 0; i < category_list.size() ; i++) {   
        		JSONObject ob2 =new JSONObject();
        		ob2.put("id", category_list.get(i).getId());
		        ob2.put("categoryName", category_list.get(i).getCategoryName());
		        System.out.println(ob2);
	            jArray2.put(ob2);
	        }

        }catch(JSONException e){
        	e.printStackTrace();
        }
		
		mav.addObject("form_list",jArray);
		mav.addObject("category_list",jArray2);
		System.out.println(category_list);
		System.out.println(jArray2);
	    mav.setViewName("home");
	    return mav;
	}
	
	@RequestMapping(value = "/form" ,method = RequestMethod.POST) // GET 방식으로 페이지 호출
	public ModelAndView goToForm(HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userFormWrite");
		return mav;
	}
	
		
}
