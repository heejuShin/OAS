package com.walab.oas.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.walab.oas.DAO.AdminDAO;
import com.walab.oas.DAO.MainDAO;

import com.walab.oas.DTO.Category;
import com.walab.oas.DTO.Field;
import com.walab.oas.DTO.Form;
import com.walab.oas.DTO.Result;
import com.walab.oas.DTO.State;
import com.walab.oas.DTO.Item;
import com.walab.oas.DTO.ReadResult;

@RestController
@RequestMapping(value = "/admin")
public class AdminController {
	
	@Autowired
	private AdminDAO adminDAO;
	@Autowired
	private MainDAO mainDao;
	
	
	//신청폼 (Admin) Create
	@RequestMapping(value = "/form/create")
	  public ModelAndView createForm() throws Exception {
		ModelAndView mav = new ModelAndView();
		
		List<Category> category_list = mainDao.categoryList();
		JSONArray jArray = new JSONArray();
		
		try{
			for (int i = 0; i < category_list.size() ; i++) {   
	    		JSONObject ob2 =new JSONObject();
	    		ob2.put("id", category_list.get(i).getId());
		        ob2.put("categoryName", category_list.get(i).getCategoryName());
		        System.out.println(ob2);
	            jArray.put(ob2);
			}
		}catch(JSONException e){
	    	e.printStackTrace();
	    }
		
		mav.addObject("category_list",jArray);
		System.out.println(category_list);
		
		mav.setViewName("adminFormCreate");
		return mav;
	}

	//신청폼 create
		@SuppressWarnings("finally")
		@RequestMapping(value="/form/formCreate",method=RequestMethod.POST)
		public @ResponseBody ModelAndView saveFormData(HttpServletRequest request) throws Exception {

			ModelAndView mav = new ModelAndView("redirect:/admin/form/create");
			
			Form form = new Form();
			Category cg = new Category();
			int category_id = 0;
			try {
				Integer.parseInt(request.getParameter("category_id"));
				category_id = Integer.parseInt(request.getParameter("category_id"));
				System.out.println("try start");
			}catch (NumberFormatException e){
				System.out.println("Cathch start");
				String nCg = request.getParameter("category_id");
				System.out.println("Cathch start");
				//category_id = Integer.parseInt(request.getParameter("categoryNum")) +1;
				cg.setCategoryName(nCg);
				System.out.println("Cathch start");
				adminDAO.addCategory(cg);
				System.out.println("Cathch start");
				category_id = cg.getId();
				System.out.println("This is catch "+category_id);
			}finally {
				System.out.println("finally category id "+category_id);
				form.setCategory_id(category_id);
				int user_id = Integer.parseInt(request.getParameter("user_id"));
				form.setUser_id(user_id);
				String formName = request.getParameter("formName");
				form.setFormName(formName);
				String explanation = request.getParameter("explanation");
				form.setExplanation(explanation);
				String url = request.getParameter("url");
				form.setUrl(url);
				int isAvailable = 0; //TODO
				form.setIsAvailable(isAvailable);
				int isUserEdit = 0; //TODO
				form.setIsUserEdit(isUserEdit);
				int plusPoint = Integer.parseInt(request.getParameter("plusPoint"));
				form.setPlusPoint(plusPoint);
				int minusPoint = Integer.parseInt(request.getParameter("minusPoint"));
				form.setMinusPoint(minusPoint);
				String start = request.getParameter("startDate")+" "+request.getParameter("startTime")+":00";
				form.setStart(start);
				String end = request.getParameter("endDate")+" "+request.getParameter("endTime")+":00";
				form.setEnd(end);
				
				adminDAO.createForm(form);
				
				//Field
				int f_cnt = Integer.parseInt(request.getParameter("count"));
				for(int i=1; i<=f_cnt; i++) {
					Field field = new Field();
					String title = request.getParameter("f_title"+Integer.toString(i));
					if(title != null) {
						
						//int form_id = 1;
						int form_id=adminDAO.getFormId(url); 
						field.setForm_id(form_id); 
						field.setFieldName(title); 
						String fieldType = request.getParameter("f_type"+Integer.toString(i));
						field.setFieldType(fieldType);
						String fileName; // 이거 어떻게 할지 고민
						//field.setFileName(fileName);
						int isEssential = Integer.parseInt(request.getParameter("isEssential"+Integer.toString(i)));
						field.setIsEssential(isEssential);
						int index;
						//field.setIndex(index);
						String key = Integer.toString(form_id) + "_" + Integer.toString(i);
						field.setKey(key);
						adminDAO.createField(field);
						
						if("radio".equals(fieldType)||"checkbox".equals(fieldType)||"select".equals(fieldType)) {
							int i_cnt = Integer.parseInt(request.getParameter("count"+Integer.toString(i)));
							for(int j=1; j<=i_cnt; j++) {
								Item item = new Item();
								String content = request.getParameter(Integer.toString(i)+"content"+Integer.toString(j));
								if(content != null) {
									//int field_id=1;
									int field_id=adminDAO.getFieldId(key);
									item.setField_id(field_id);
									item.setContent(content);
									int isDefault = 0;
									//int isDefault = Integer.parseInt(request.getParameter(Integer.toString(i)+"isDefault"+Integer.toString(j))); 나중에 하자
									item.setIsDefault(isDefault);
									adminDAO.createItem(item);
								}
							}
						}
					}
				}
				
				return mav;
			}
		}
	
	//링크 중복체크
	@RequestMapping(value="/form/link_finder",method=RequestMethod.POST)
	public String linkDupCheck(@RequestParam("link") String link) throws Exception {
		if(adminDAO.linkDupCheck(link)==0) return "success";
		else return "fail";
	}
	
//	//신청폼 (Admin) Update
//	@RequestMapping(value = "/form/view/{link}")
//	  public ModelAndView updateForm() throws Exception {
//		ModelAndView mav = new ModelAndView();
//		
//		mav.setViewName("adminFormView");
//		return mav;
//	}
//	
	
	//신청폼 (Admin) Result Check page
	@RequestMapping(value = "/form/view/{link}")
	public ModelAndView resultForm() throws Exception {
		
		//밑에는 check page 관련 controller입니당.
		ModelAndView mav = new ModelAndView();
		
		int form_id=1;
		
		List<Result> submitterList= adminDAO.submitterList(form_id);
		List<State> stateList=adminDAO.stateList(form_id);
		
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
	
	//신청폼 (Admin) View 
	@RequestMapping(value = "/admin/form/result/{link}")
	  public ModelAndView readForm() throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminFormCreate");
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
			
			adminDAO.stateUpdate(paramMap);
		}
		
	}
	
	//신청폼 (Admin) View
	@RequestMapping(value = "/form/result/{link}")//현재는 페이지를 보려면 /{link}가 없어야 합니다 
	  public ModelAndView readForm(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		List<ReadResult> read_list=adminDAO.getReadList();
		List<Category> category_name = adminDAO.getCategoryName();
		
		//String form_id  = request.getParameter("select_formID");
		//int form_ID = Integer.parseInt(form_id);
		int form_ID =1;
		
		//System.out.println("formID : "+ form_id);
		
		List<Form> form_info = mainDao.forminfo(form_ID);
		
		//category name json처 
		JSONArray c_name = new JSONArray();
		try {
	    		for (int i = 0; i < category_name.size() ; i++) {   
		    		JSONObject ob =new JSONObject();
		        
		        ob.put("categoryId", category_name.get(i).getId());
		        ob.put("categoryName", category_name.get(i).getCategoryName());
		            
		        c_name.put(ob);      
	    		}
	    		System.out.println("--------------------------------------");
	    		System.out.println(c_name.toString());
	    	}catch(JSONException e){
	        e.printStackTrace();
	    	}
		  
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
		
		 mav.addObject("form_ID", form_ID);
		 mav.addObject("form_info", jArray1);
		 mav.addObject("read_list",read_list);
		 mav.addObject("category_name",c_name);
		mav.setViewName("adminFormResult");
		return mav;
	}
	
}
