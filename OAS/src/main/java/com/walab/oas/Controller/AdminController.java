package com.walab.oas.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.walab.oas.DAO.AdminDAO;
import com.walab.oas.DAO.MainDAO;
import com.walab.oas.DTO.Form;
import com.walab.oas.DTO.Result;
import com.walab.oas.DTO.State;

@RestController
@RequestMapping(value = "/admin")
public class AdminController {
	
	@Autowired
	private AdminDAO adminDao; 
	
	//신청폼 (Admin) Create
	@RequestMapping(value = "/form/create")
	  public ModelAndView createForm() throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminFormCreate");
		return mav;
	}
	
	//신청폼 Create	
	@RequestMapping(value="/form/formCreate",method=RequestMethod.POST)
	public ModelAndView saveFormData(Form form) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/admin/form/create");
		//Form table에는 그냥 insert하면 됨 -> DAO에 Form 객체 전달
		//문제는 Field랑 Item table 우예하징..?
		System.out.println(form.getCategory_id());
		System.out.println(form.getUser_id());
		System.out.println(form.getFormName());
		System.out.println(form.getExplanation());
		//url
		//isAvailable
		//isUserEdit
		//plusPoint
		//minusPoint
		System.out.println(form.getStartDate());
		System.out.println(form.getEndDate());
		return mav;
	}
	
	//신청폼 (Admin) Update
	@RequestMapping(value = "/form/update/{link}")
	  public ModelAndView updateForm() throws Exception {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("adminFormUpdate");
		return mav;
	}
	/*
	//신청폼 (Admin) View -> 하연언니 여기 하시면 됩니당!
	@RequestMapping(value = "/form/result/{link}")
	  public ModelAndView readForm() throws Exception {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("adminFormCreate");
		return mav;
	}*/
	
	
	//신청폼 (Admin) View -> 하연언니 여기 하시면 됩니당!
	@RequestMapping(value = "/form/result/{link}")
	public ModelAndView resultForm() throws Exception {
		ModelAndView mav = new ModelAndView();
		
		int form_id=1;
		
		List<Result> submitterList= adminDao.submitterList(form_id);
		List<State> stateList=adminDao.stateList(form_id);
		
		JSONArray jArray = new JSONArray();
		JSONArray jArray2 = new JSONArray();
		
		try {
        	for (int i = 0; i < submitterList.size() ; i++) {   
        		JSONObject ob =new JSONObject();
        		ob.put("id", submitterList.get(i).getId());
		        ob.put("userName", submitterList.get(i).getUserName());
	            ob.put("department", submitterList.get(i).getDepartment());
	            ob.put("studentId", submitterList.get(i).getStudentId());
	            ob.put("email", submitterList.get(i).getEmail());
	            ob.put("regDate", submitterList.get(i).getRegDate());
	            ob.put("state_id", submitterList.get(i).getState_id());
	            jArray.put(ob);
	        }
        	
        	for (int i = 0; i < stateList.size() ; i++) {   
        		JSONObject ob =new JSONObject();
        		ob.put("id", stateList.get(i).getId());
        		ob.put("stateName", stateList.get(i).getStateName());
        		ob.put("form_id", stateList.get(i).getForm_id());
        		ob.put("regDate", stateList.get(i).getRegDate());
	            jArray2.put(ob);
	        }

        }catch(JSONException e){
        	e.printStackTrace();
        }
		
		mav.addObject("submitterList", jArray);
		mav.addObject("stateList", jArray2);
		
		mav.setViewName("adminFormView");
		return mav;
	}
	
	//신청폼 체크 각 제출자 상태 update
	@RequestMapping(value = "/form/update/check" ,method=RequestMethod.POST)
	public void checkResult(HttpServletRequest request) throws Exception {
		
		
		String []resultIDarray = request.getParameterValues("resultIDarray"); //해당 폼의 제출자 result id
		String []stateArray = request.getParameterValues("stateArray"); // 각 제출자 result id의 stateName
        
		Map<String, Object> paramMap;
		
		
		for(int i=0; i<resultIDarray.length; i++) {
			paramMap = new HashMap<String, Object>();
			paramMap.put("resultID", Integer.parseInt(resultIDarray[i]));
			paramMap.put("stateID", Integer.parseInt(stateArray[i]));
			
			adminDao.stateUpdate(paramMap);
		}
		
	}
	
}
