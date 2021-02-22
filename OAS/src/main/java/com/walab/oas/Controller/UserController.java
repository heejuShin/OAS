package com.walab.oas.Controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.walab.oas.DAO.MainDAO;
import com.walab.oas.DAO.AdminDAO;
import com.walab.oas.DAO.UserDAO;
import com.walab.oas.DTO.Field;
import com.walab.oas.DTO.Form;
import com.walab.oas.DTO.Item;
import com.walab.oas.DTO.ReadResult;
import com.walab.oas.DTO.Result;
import com.walab.oas.DTO.Result_Content;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

@RestController
@RequestMapping(value = "/") // 주소 패턴
public class UserController {
	
	@Autowired
	private UserDAO userDao; 
	
	@Autowired
	private MainDAO mainDao; 
	
	@Autowired
	private AdminDAO adminDao; 

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
	public ModelAndView submitForm (HttpSession session, HttpServletRequest request, RedirectAttributes redirectAttr) throws Exception {
		System.out.println("<submitForm> controller");
		
		//result 기록  
		String formID  = request.getParameter("form_index");
		int  form_id = Integer.parseInt(formID);
		
		int user_id=0;
		if(session.getAttribute("id")!=null) {
			user_id=(Integer) session.getAttribute("id");
		}

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
	    
	    
		 // 다음 컨트롤러로 전송  
		 redirectAttr.addFlashAttribute("form_id",form_id);
		 redirectAttr.addFlashAttribute("result_id",result_id);
		    
	    
	 	System.out.println("<submitForm> controller end");
		return new ModelAndView("redirect:/userFormView");
	}
	
	//form view
	@RequestMapping(value = "/userFormView") // GET 방식으로 페이지 호출
	public ModelAndView viewUserForm (RedirectAttributes redirectAttr,HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("<viewUserForm> controller");
		
		Map<String,?> redirectMap = RequestContextUtils.getInputFlashMap(request);
		int form_id=(Integer)redirectMap.get("form_id");
		int result_id= (Integer)redirectMap.get("result_id");
		
		ModelAndView mav = new ModelAndView();
		Form form_info = userDao.forminfo(form_id);
		
		if(form_info.getIsAvailable()==1) {
			redirectAttr.addFlashAttribute("form_id",form_id);
			redirectAttr.addFlashAttribute("result_id",result_id);
			mav.setViewName("redirect:/userFormUpdate");
			return mav;
		}
		Result result_info = userDao.resultinfo(result_id);
		List<ReadResult> resultContent =  userDao.getContents(result_id);
		System.out.println("result_info:"+result_id);
		//form + result 정보 
		JSONArray jArray1 = new JSONArray();
		try {
			    	JSONObject ob =new JSONObject();
			        
			        ob.put("form_name", form_info.getFormName());
			        ob.put("form_detail", form_info.getExplanation());
			        ob.put("form_startDate", form_info.getStartDate());
			        ob.put("form_endDate", form_info.getEndDate());
			        ob.put("form_submitDate", result_info.getRegDateKor());
			        ob.put("form_editDate", result_info.getEditDateKor());
			            
			        jArray1.put(ob);      
		    
		        System.out.println(jArray1.toString());
		    }catch(JSONException e){
		        e.printStackTrace();
		    }
		
		JSONArray jArray2 = new JSONArray();
		try {
		    	for (int i = 0; i < resultContent.size() ; i++) {   
			    		JSONObject ob =new JSONObject();
			        
			        ob.put("field_name", resultContent.get(i).getFieldName());
			        ob.put("field_type", resultContent.get(i).getFieldType());
			        ob.put("field_file", resultContent.get(i).getFileName());
			        ob.put("field_star", resultContent.get(i).getIsEssential());
			        ob.put("field_index", resultContent.get(i).getIndex());
			        ob.put("field_content", resultContent.get(i).getContent());
			            
			        jArray2.put(ob);      
		    }
		        System.out.println(jArray2.toString());
		    }catch(JSONException e){
		        e.printStackTrace();
		    }
		
		mav.addObject("form_info", jArray1);
		mav.addObject("field_list", jArray2);
		mav.setViewName("userFormView");
		System.out.println("<viewUserForm> controller end");
		return mav;
	}
	
	//form view
	@RequestMapping(value = "/userFormUpdate") // GET 방식으로 페이지 호출
	public ModelAndView userFormUpdate (HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("<viewUserForm> controller");
			
		Map<String,?> redirectMap = RequestContextUtils.getInputFlashMap(request);
		int form_id=(Integer)redirectMap.get("form_id");
		int result_id= (Integer)redirectMap.get("result_id");
			
		ModelAndView mav = new ModelAndView();
		Form form_info = userDao.forminfo(form_id);
		
			
		Result result_info = userDao.resultinfo(result_id);
		List<Field> field_list = mainDao.fieldList(form_id);
		System.out.println("result_info:"+result_id);
		//form + result 정보 
		JSONArray jArray1 = new JSONArray();
		try {
			JSONObject ob =new JSONObject();
			        
			ob.put("form_name", form_info.getFormName());
			ob.put("form_detail", form_info.getExplanation());
			ob.put("form_startDate", form_info.getStartDate());
			ob.put("form_endDate", form_info.getEndDate());
			ob.put("form_submitDate", result_info.getRegDateKor());
			ob.put("form_editDate", result_info.getEditDateKor());
			            
			jArray1.put(ob);      
		    
		    System.out.println(jArray1.toString());
		}catch(JSONException e){
		    e.printStackTrace();
		}
		ObjectMapper mapper2=new ObjectMapper();
		String jArray2=mapper2.writeValueAsString(field_list);
		
		//List<ReadResult> read_list=adminDao.getReadList(result_id);
		List<ReadResult> read_list=userDao.getReadResultContent(result_id);
		
		ObjectMapper mapper=new ObjectMapper();
		String jArray3=mapper.writeValueAsString(read_list);
		
		System.out.println(jArray3);
			
		mav.addObject("form_info", jArray1);
		mav.addObject("field_list", jArray2);
		mav.addObject("read_list", jArray3);
		mav.setViewName("userFormUpdate");
		return mav;
	}
	
	@RequestMapping(value="/userForm/update",method=RequestMethod.POST)
	public ModelAndView UpdateUserFromData(HttpServletRequest request, HttpSession session) throws Exception {

		ModelAndView mav=new ModelAndView();
		System.out.println("in user form update><");
		
		String[] isModified=request.getParameterValues("isModified");
		String[] id=request.getParameterValues("resultContentID");
		String contents[]  = request.getParameterValues("content");
			
		for(int i=0; i<isModified.length; i++) {
			if(Integer.parseInt(isModified[i])==1) {
				System.out.println("updateghghgh");
	    		userDao.updateContent(Integer.parseInt(id[i]),contents[i]);
			}
		}//반복문 끝 (ResultContent 수정)
		
		mav.setViewName("redirect:/mypage");
		return mav;
	}
	
	@RequestMapping("/delMyFormU/{link}") // GET 방식으로 페이지 호출
	public ModelAndView delMyForm(@PathVariable String link, HttpServletRequest request, HttpSession session) throws Exception {
		
ModelAndView mav = new ModelAndView();
		
		int user_id=0;
		if(session.getAttribute("id")!=null) {
			user_id=(Integer) session.getAttribute("id");
		}
		int form_ID=adminDao.getFormId(link); 
		
		System.out.println("Udel = "+form_ID);
		int result_id=adminDao.getResultId(form_ID,user_id);
		System.out.println("Udel = "+result_id);
		mainDao.delMyForm(result_id);
		
		mav.setViewName("redirect:/mypage");
		
		return mav;
	}

}
