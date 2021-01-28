package com.walab.oas.Controller;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.walab.oas.DAO.AdminDAO;
import com.walab.oas.DTO.Field;
import com.walab.oas.DTO.Form;

@RestController
@RequestMapping(value = "/")

public class AdminController {
	
	@Autowired
	private AdminDAO adminDao;
	
	//신청폼 (Admin) Create
	@RequestMapping(value = "/admin/form/create")
	  public ModelAndView createForm() throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminFormCreate");
		return mav;
	}
	
	//신청폼 Create	
	@RequestMapping(value="/admin/form/formCreate",method=RequestMethod.POST)
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
	@RequestMapping(value = "/admin/form/update/{link}")
	  public ModelAndView updateForm() throws Exception {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("adminFormUpdate");
		return mav;
	}
	
	//신청폼 (Admin) View -> 하연언니 여기 하시면 됩니당!
	@RequestMapping(value = "/admin/form/result")//{link}
	  public ModelAndView readForm() throws Exception {
		ModelAndView mav = new ModelAndView();
		
		List<Field> field_list=adminDao.getFieldList();
		
		JSONArray jArray= new JSONArray();
		
		 try {
	        	for (int i = 0; i < field_list.size() ; i++) {   
	        		JSONObject ob =new JSONObject();
	        		ob.put("id", field_list.get(i).getId());
			        ob.put("form_id", field_list.get(i).getForm_id());
		            ob.put("fieldType", field_list.get(i).getFieldType());
		            ob.put("fieldName", field_list.get(i).getFieldName());
		            ob.put("fileName", field_list.get(i).getFileName());
		            ob.put("isEssential", field_list.get(i).getIsEssential());
		            ob.put("index", field_list.get(i).getIndex());
		            ob.put("regDate", field_list.get(i).getRegDate());
		            jArray.put(ob);
		        }

	        }catch(JSONException e){
	        	e.printStackTrace();
	        }
		
		 mav.addObject("form_list",jArray);
		 System.out.println(field_list);
		mav.setViewName("adminFormResult");
		return mav;
	}
	
}

	
	//신청폼 (Admin) View -> 하연언니 여기 하시면 됩니당!
	@RequestMapping(value = "/admin/form/result")///{link}
	  public ModelAndView readForm() throws Exception {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("adminFormResult");
		return mav;
	}
	
}
