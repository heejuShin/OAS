package com.walab.oas.Controller;

import java.sql.Date;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.walab.oas.DAO.AdminDAO;
import com.walab.oas.DTO.Field;
import com.walab.oas.DTO.Form;
import com.walab.oas.DTO.Item;

@RestController
@RequestMapping(value = "/")

public class AdminController {
	
	@Autowired
	private AdminDAO adminDAO;
	
	//신청폼 (Admin) Create
	@RequestMapping(value = "/admin/form/create")
	  public ModelAndView createForm() throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminFormCreate");
		return mav;
	}
	
	//신청폼 Create	
	@RequestMapping(value="admin/form/formCreate",method=RequestMethod.POST)
	public ModelAndView saveFormData(HttpServletRequest request) throws Exception {

		ModelAndView mav = new ModelAndView("redirect:/admin/form/create");
		
		Form form = new Form();
		int category_id = Integer.parseInt(request.getParameter("category_id"));
		form.setCategory_id(category_id);
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		form.setUser_id(user_id);
		String formName = request.getParameter("formName");
		form.setFormName(formName);
		String explanation = request.getParameter("explanation");
		form.setExplanation(explanation);
		String url = "url5"; //TODO
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

		System.out.println("Category id : " + form.getCategory_id());
		System.out.println("User id : " + form.getUser_id());
		System.out.println("FormName : " + form.getFormName());
		System.out.println("Explanation : " + form.getExplanation());
		System.out.println("URL : " + form.getUrl());
		System.out.println("isAvailable : " + form.getIsAvailable());
		System.out.println("isUserEdit : " + form.getIsUserEdit());
		System.out.println("PlusPoint : " + form.getPlusPoint());
		System.out.println("minusPoint : " + form.getMinusPoint());
		System.out.println("start : " + form.getStart());
		System.out.println("end : " + form.getEnd());
		
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
				
				System.out.println("\tform id -> "+ form_id);
				System.out.println("\tField name -> "+ title);
				System.out.println("\tField type -> "+ fieldType);
				System.out.println("\tisEssential -> "+ isEssential);
				System.out.println("\tkey -> "+ key);
				
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
							System.out.println("\t\tfield id -> "+ field_id);
							System.out.println("\t\tcontent -> "+ content);
							System.out.println("\t\tisDefault -> "+ isDefault);
							adminDAO.createItem(item);
						}
					}
				}
			}
		}
		
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
