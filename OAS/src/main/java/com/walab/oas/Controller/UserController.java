package com.walab.oas.Controller;

import java.util.List;

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

import com.walab.oas.DAO.UserDAO;
import com.walab.oas.DTO.Field;
import com.walab.oas.DTO.Form;
import com.walab.oas.DTO.Item;
import com.walab.oas.DTO.Result;
import com.walab.oas.DTO.Result_Content;

@RestController
@RequestMapping(value = "/") // 주소 패턴
public class UserController {
	
	@Autowired
	private UserDAO userDao; 
	

	//item 정보 불러오기 
	@RequestMapping(value = "/getItem" ,method = RequestMethod.POST) // GET 방식으로 페이지 호출
	public List<Item> getItem(HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("<getItem> controller");
		
		String field_id  = request.getParameter("fieldID");
		//System.out.println("field ID : "+ field_id);
		int field_ID = Integer.parseInt(field_id);
		
		List<Item> item_list = userDao.itemList(field_ID);
		System.out.println(item_list.toString());
		
		return item_list;
	}

	//form 제출하기 
	@RequestMapping(value = "/submit" ,method = RequestMethod.POST) // GET 방식으로 페이지 호출
	public ModelAndView submitForm (HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("<submitForm> controller");
		
		//result 기록  
		String formID  = request.getParameter("form_index");
		int  form_id = Integer.parseInt(formID);
	    int user_id  = 1; //세션 나오면 바꿔야 함 
	    int state_id  = userDao.getState(form_id);
	    
	    Result result = new Result();
	    result.setForm_id(form_id);
	    result.setUser_id(user_id);
	    result.setState_id(state_id);
	    
	    //System.out.println(result);
	    userDao.setResult(result);
	    
	    //result_content 기록 
	    //System.out.println("resultID : "+result.getId());
	    int result_id = result.getId();
	    String field_ids[]  = request.getParameterValues("field_ids");
	    String contents[]  = request.getParameterValues("content");
	    
	    for(int i = 0; i < field_ids.length; i++) {

	    		Result_Content result_content = new Result_Content();
		    		result_content.setResult_id(result_id);
		    		result_content.setField_id(Integer.parseInt(field_ids[i]));
		    		result_content.setContent(contents[i]);
		    		
		    		System.out.println(result_content);
		    		userDao.setContent(result_content);
	    }
	    
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("home");
		
		return mav;
	}
	
	

}
