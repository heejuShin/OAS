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
import com.walab.oas.DTO.Field;
import com.walab.oas.DTO.Form;
import com.walab.oas.DTO.Item;
import com.walab.oas.DTO.PageMaker;
import com.walab.oas.DTO.Result;
import com.walab.oas.DTO.Result_Content;
import com.walab.oas.DTO.SearchCriteria;


@RestController
@RequestMapping(value = "/") // 주소 패턴
public class MainController {
	
	
	@Autowired
	private MainDAO mainDao; 
	
	
	//메인페이지 가기
	@RequestMapping(value = "/") // GET 방식으로 페이지 호출
	public ModelAndView goMypage(SearchCriteria cri,HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
//		int user_id=(Integer) session.getAttribute("ID");
		int user_id= 1; //세션이 있으면 그 사람 user_id로, 아니면 user_id는 0으로 설정해야함
		
		cri.setUser_id(user_id);
		List<Form> form_list=mainDao.formList(cri);
		List<Category> category_list=mainDao.categoryList();
		
		System.out.println("main form: "+form_list);
		
		ObjectMapper mapper=new ObjectMapper();
		String jArray=mapper.writeValueAsString(form_list);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(form_list.size());
		
		ObjectMapper mapper2=new ObjectMapper();
		String jArray2=mapper2.writeValueAsString(category_list);
		
		mav.addObject("form_list",jArray);
		mav.addObject("category_list",jArray2);
		mav.addObject("searchOption", cri.getSearchType());
		mav.addObject("keyword", cri.getKeyword());
		
		mav.addObject("pageMaker", pageMaker);
	    mav.setViewName("home");
	    return mav;
	}
	
	//home 페이지에서 폼을 눌렀을 때,
	@RequestMapping(value = "/form" ,method = RequestMethod.POST) // GET 방식으로 페이지 호출
	public ModelAndView goToForm(HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("<goToForm> controller");

		ModelAndView mav = new ModelAndView();
		int form_ID = Integer.parseInt(request.getParameter("select_formID"));
		int stateID = Integer.parseInt(request.getParameter("stateID"));


		if(stateID!=0) {
			List<Form> form_info = mainDao.forminfo(form_ID);
			List<Field> field_list = mainDao.fieldList(form_ID);
			System.out.println(field_list.toString());
			
			//form info json 처리 
			JSONArray jArray1 = new JSONArray();
			try {
			    	for (int i = 0; i < form_info.size() ; i++) {   
				    		JSONObject ob =new JSONObject();
				        
				        ob.put("form_name", form_info.get(i).getFormName());
				        ob.put("form_detail", form_info.get(i).getExplanation());
				        ob.put("form_startDate", form_info.get(i).getStartDate());
				        ob.put("form_endDate", form_info.get(i).getEndDate());
				            
				        jArray1.put(ob);      
			    }
			        System.out.println(jArray1.toString());
			    }catch(JSONException e){
			        e.printStackTrace();
			    }
			
			//field info json 처리 
					JSONArray jArray2 = new JSONArray();
					try {
					    	for (int i = 0; i < field_list.size() ; i++) {   
						    		JSONObject ob =new JSONObject();
						        
						        ob.put("field_id", field_list.get(i).getId());
						        ob.put("field_name", field_list.get(i).getFieldName());
						        ob.put("field_type", field_list.get(i).getFieldType());
						        ob.put("field_star", field_list.get(i).getIsEssential());
						        ob.put("field_file", field_list.get(i).getFieldName());
						        
						            
						        jArray2.put(ob);      
					    }
					        System.out.println(jArray2.toString());
					    }catch(JSONException e){
					        e.printStackTrace();
					    }
			
			mav.addObject("form_ID", form_ID);
			mav.addObject("form_info", jArray1);
			mav.addObject("field_list", jArray2);
			mav.setViewName("userFormWrite");
		}
		else {
			
			mav.setViewName("userFormView");
		}
			

		System.out.println("<goToForm> controller end");
		return mav;
	}
	
}
