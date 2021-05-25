package com.walab.oas.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.File;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.walab.oas.DAO.AdminDAO;
import com.walab.oas.DAO.ExcelDownloadDAO;
import com.walab.oas.DAO.MainDAO;
import com.walab.oas.DAO.MyPageDAO;
import com.walab.oas.DAO.UserDAO;
import com.walab.oas.DTO.Category;
import com.walab.oas.DTO.Field;
import com.walab.oas.DTO.Form;
import com.walab.oas.DTO.Result;
import com.walab.oas.DTO.Result_Content;
import com.walab.oas.DTO.SearchCriteria;
import com.walab.oas.DTO.State;
import com.walab.oas.DTO.User;
import com.walab.oas.DTO.Item;
import com.walab.oas.DTO.PageMaker;
import com.walab.oas.DTO.ReadResult;

@RestController
@RequestMapping(value = "/admin")
public class AdminController {
	
	@Autowired
	private AdminDAO adminDAO;
	@Autowired
	private MainDAO mainDao;
	@Autowired
	private UserDAO userDao;
	@Autowired
	private MyPageDAO mypageDao;
	
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
		
		List<State> state_list = mainDao.stateList(0);
		JSONArray jArray2 = new JSONArray();
		
		try{
			for (int i = 0; i < state_list.size() ; i++) {   
	    		JSONObject ob2 =new JSONObject();
	    		ob2.put("id", state_list.get(i).getId());
		        ob2.put("stateName", state_list.get(i).getStateName());
	            jArray2.put(ob2);
			}
		}catch(JSONException e){
	    	e.printStackTrace();
	    }
		
		mav.addObject("state_list",jArray2);
		
		mav.setViewName("adminFormCreate");
		return mav;
	}
	
	@RequestMapping(value= {"/form/create/preview", "/form/view/create/preview"},method=RequestMethod.POST)
	@ResponseBody 
	public ModelAndView previewFormData(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		//System.out.println("In formcreatepreview "+adminUploadFile);
		ModelAndView mav = new ModelAndView();
		System.out.println("preview!!");
		String form_name  = request.getParameter("form_name");
	    String form_detail  = request.getParameter("form_detail");
	    String form_startDate  = request.getParameter("form_startDate");
	    String form_endDate  = request.getParameter("form_endDate");
	    
	    JSONArray jArray = new JSONArray();
	    JSONObject ob2 =new JSONObject();
	    ob2.put("form_name", form_name);
	    ob2.put("form_detail", form_detail);
	    ob2.put("form_startDate", form_startDate);
	    ob2.put("form_endDate", form_endDate);
	    jArray.put(ob2);
	    mav.addObject("form_info", jArray);
	    
	    int f_cnt=Integer.parseInt(request.getParameter("f_cnt"));
	    String []field_id = request.getParameterValues("field_id");
	    String []field_name = request.getParameterValues("field_name");
	    String []field_type = request.getParameterValues("field_type");
	    String []field_star = request.getParameterValues("field_star");
	    String []item_count = request.getParameterValues("item_count");
	    
	    
	    String []content = request.getParameterValues("content");
	    String []isDefault = request.getParameterValues("isDefault");
	    
		
		JSONArray jArray2 = new JSONArray();
		JSONArray jArray3 = new JSONArray();
	    try {
	    	int idx=0;
	    	
	    	for (int i = 1; i <= f_cnt ; i++) {   
		    	JSONObject ob =new JSONObject();
		    	
		        ob.put("field_id", field_id[i]);
		        ob.put("field_name", field_name[i]);
		        ob.put("field_type", field_type[i]);
		        ob.put("field_star", field_star[i]);
		        ob.put("item_count", Integer.parseInt(item_count[i]));
		        System.out.println("item_count:"+Integer.parseInt(item_count[i]));
		        if("radio".equals(field_type[i])||"checkbox".equals(field_type[i])||"select".equals(field_type[i])) {
		        	for (int j = 1; j <= Integer.parseInt(item_count[i]) ; j++) {
		        		idx++;
		        		JSONObject ob3 =new JSONObject();
			        	ob3.put("content", content[idx]);
			        	ob3.put("isDefault", isDefault[idx]);
			        	jArray3.put(ob3);
		        	}
		        }
		         
		        jArray2.put(ob);
		        
		    }
	    }catch(JSONException e){
	        e.printStackTrace();
	    }
	    
	    System.out.println(jArray3);
	    
	    mav.addObject("optionList", jArray3);
		mav.addObject("field_list", jArray2);
		mav.addObject("form_info", jArray);
		mav.setViewName("userFormPreview");
		
		return mav;
	}
	
	//신청폼 update preview
	@RequestMapping(value= {"/form/update/preview", "/form/view/update/preview"},method=RequestMethod.POST)
	@ResponseBody 
	public ModelAndView previewFormUpdate(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView();
		System.out.println("preview!!");
		String form_name  = request.getParameter("form_name");
	    String form_detail  = request.getParameter("form_detail");
	    String form_startDate  = request.getParameter("form_startDate");
	    String form_endDate  = request.getParameter("form_endDate");
	    
	    JSONArray jArray = new JSONArray();
	    JSONObject ob2 =new JSONObject();
	    ob2.put("form_name", form_name);
	    ob2.put("form_detail", form_detail);
	    ob2.put("form_startDate", form_startDate);
	    ob2.put("form_endDate", form_endDate);
	    jArray.put(ob2);
	    mav.addObject("form_info", jArray);
	    
	    int f_cnt=Integer.parseInt(request.getParameter("f_cnt"));
	    String []field_id = request.getParameterValues("field_id");
	    String []field_name = request.getParameterValues("field_name");
	    String []field_type = request.getParameterValues("field_type");
	    String []field_star = request.getParameterValues("field_star");
	    String []isFieldDel = request.getParameterValues("isFieldDel");
	    String []item_count = request.getParameterValues("item_count");
	    
	    
	    String []content = request.getParameterValues("content");
	    String []isDefault = request.getParameterValues("isDefault");
	    String []isItemDel = request.getParameterValues("isItemDel");
	    
		
		JSONArray jArray2 = new JSONArray();
		JSONArray jArray3 = new JSONArray();
	    try {
	    	int idx=0;
	    	
	    	for (int i = 1; i <= f_cnt ; i++) {   
		    	JSONObject ob =new JSONObject();
		    	if(Integer.parseInt(isFieldDel[i])==1)
		    		continue;
		        ob.put("field_id", field_id[i]);
		        ob.put("field_name", field_name[i]);
		        ob.put("field_type", field_type[i]);
		        ob.put("field_star", field_star[i]);
		        int itemCount=Integer.parseInt(item_count[i]);
		        System.out.println("item_count:"+Integer.parseInt(item_count[i]));
		        if("radio".equals(field_type[i])||"checkbox".equals(field_type[i])||"select".equals(field_type[i])) {
		        	for (int j = 1; j <= Integer.parseInt(item_count[i]) ; j++) {

		        		idx++;
		        		if(Integer.parseInt(isItemDel[idx])==1) {
		        			itemCount--;
		        			continue;
		        		}
		        		JSONObject ob3 =new JSONObject();
			        	ob3.put("content", content[idx]);
			        	ob3.put("isDefault", isDefault[idx]);
			        	jArray3.put(ob3);
		        	}
		        }
		        ob.put("item_count", itemCount);
		        jArray2.put(ob);
		        
		    }
	    }catch(JSONException e){
	        e.printStackTrace();
	    }
	    
	    System.out.println(jArray3);
	    
	    mav.addObject("optionList", jArray3);
		mav.addObject("field_list", jArray2);
		mav.addObject("form_info", jArray);
		mav.setViewName("userFormPreview");
		
		return mav;
	}

	//신청폼 create
		@SuppressWarnings("finally")
		@RequestMapping(value="/form/formCreate",method=RequestMethod.POST)
		@ModelAttribute("ses")
		public @ResponseBody ModelAndView saveFormData(HttpServletRequest request, HttpServletResponse response, HttpSession session, MultipartFile adminUploadFile) throws Exception {
		
	    	String storedCsrfToken = (String) session.getAttribute("CSRF_TOKEN");
	    	String requestedCsrfToken = request.getParameter("csrfToken");
	    	        
	    	if( storedCsrfToken == null || !storedCsrfToken.equals(requestedCsrfToken)){
	    	    return new ModelAndView("error/csrfMsg");
	    	}
	    	
			ModelAndView mav = new ModelAndView("redirect:/admin/mypage");

			Form form = new Form();
			Category cg = new Category();
			int file_id=0;
			Map<String, Object> map = new HashMap<String, Object>();
			if(adminUploadFile != null) {
				System.out.println(adminUploadFile);
            	String root_path = request.getSession().getServletContext().getRealPath("/");  
                String attach_path = "resources/upload/";
                String filename = adminUploadFile.getOriginalFilename();
                File f = new File("C:\\Users\\shb59\\git\\OAS\\OAS\\src\\main\\webapp\\resources\\img" + filename);
                System.out.println("Path is "+root_path + attach_path + filename);
                adminUploadFile.transferTo(f);
                String originalFileExtension = filename.substring(filename.lastIndexOf("."));
                String storedFileName = UUID.randomUUID().toString()+originalFileExtension;
                
                
                
                map.put("id", 0);
	      	    map.put("fileName", storedFileName);
	      	    map.put("fileRealName", filename);

                int erase = userDao.setFile(map);
                System.out.println("erase is "+(int) map.get("id"));
                file_id = (int) map.get("id");
			}
			file_id = (int) map.get("id");
			form.setFile_id(file_id);
			
			int category_id = 0;
			try {
				Integer.parseInt(request.getParameter("category_id"));
				category_id = Integer.parseInt(request.getParameter("category_id"));
				System.out.println("try start");
			}catch (NumberFormatException e){
				System.out.println("Cathch start");
				String nCg = request.getParameter("category_id");
				System.out.println("Cathch start");
				cg.setCategoryName(nCg);
				System.out.println("Cathch start");
				adminDAO.addCategory(cg);
				System.out.println("Cathch start");
				category_id = cg.getId();
				System.out.println("This is catch "+category_id);
			}finally {
				System.out.println("finally category id "+category_id);
				form.setCategory_id(category_id);
				int user_id=0;
				if(session.getAttribute("id")!=null) {
					user_id=(Integer) session.getAttribute("id");
				}
				form.setUser_id(user_id);
				String formName = request.getParameter("formName");
				form.setFormName(formName);
				String explanation = request.getParameter("explanation");
				//explanation = explanation.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
				System.out.println("check..");
				explanation = explanation.replaceAll(System.getProperty("line.separator"), "<br>");
				form.setExplanation(explanation);
				String url = request.getParameter("url");
				form.setUrl(url);
				int isAvailable = 1; //TODO
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
				
				start = start+".0";
				end = end+".0";
				java.sql.Timestamp st = java.sql.Timestamp.valueOf(start);
				java.sql.Timestamp et = java.sql.Timestamp.valueOf(start);
				form.setStartDate(st);
				form.setEndDate(et);

				adminDAO.createForm(form);
				int form_id=adminDAO.getFormId(url); 
				//state
				
				State state= new State();
				String statename = request.getParameter("state");
				//System.out.println(statename);
				String[] statenames = statename.split(",");
				for (int i = 0; i < statenames.length; i++) {
					state.setStateName(statenames[i]);
					if(statenames[i].equals("대기중"))
						state.setIsDefualt(1);
					else state.setIsDefualt(0);
					state.setForm_id(form_id);
					adminDAO.createState(state);
				}
				

				//Field
				int f_cnt = Integer.parseInt(request.getParameter("count"));
				int fileNum = 0;
				for(int i=1; i<=f_cnt; i++) {
					Field field = new Field();
					String title = request.getParameter("f_title"+Integer.toString(i));
					if(title != null) {
						
						//int form_id = 1;
						
						field.setForm_id(form_id); 
						field.setFieldName(title); 
						String fieldType = request.getParameter("f_type"+Integer.toString(i));
						System.out.println("Field Type is "+fieldType);
						field.setFieldType(fieldType);
						
						int isEssential = Integer.parseInt(request.getParameter("isEssential"+Integer.toString(i)));
						field.setIsEssential(isEssential);
						int index;
						//field.setIndex(index);
						String key = Integer.toString(form_id) + "_" + Integer.toString(i);
						field.setKey(key);
						
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
							}//item 반복문
						}
						adminDAO.createField(field);
					}
				}	//field 반복문			
				return mav;
			}
		}
	
	//링크 중복체크
	@RequestMapping(value={"/form/link_finder", "/form/view/link_finder"},method=RequestMethod.POST)
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
	
	//신청폼 (Admin) Update page 업데이트 페이지 보여주기
	@RequestMapping(value = "/form/view/{link}")
	public ModelAndView resultForm(@PathVariable String link, HttpServletRequest request) throws Exception {
		
		//밑에는 check page 관련 controller입니당.
		ModelAndView mav = new ModelAndView();
	   System.out.println("link:"+link);
		int form_id=adminDAO.getFormId(link); 
		
		
		List<Category> category_list = mainDao.categoryList();
		JSONArray jArray3 = new JSONArray();
		try{
			for (int i = 0; i < category_list.size() ; i++) {   
	    		JSONObject ob2 =new JSONObject();
	    		ob2.put("id", category_list.get(i).getId());
		        ob2.put("categoryName", category_list.get(i).getCategoryName());
		        System.out.println(ob2);
	            jArray3.put(ob2);
			}
			
		}catch(JSONException e){
	    	e.printStackTrace();
	    }
		
		mav.addObject("form_id",form_id);
		mav.addObject("category_list",jArray3);
		
		mav.setViewName("adminFormUpdate");
		return mav;
	}
	
	
	//신청폼 수정 페이지에서 form 정보 가져오기
	@RequestMapping(value= "/form/view/info", method = RequestMethod.POST) // 주소 호출 명시 . 호출하려는 주소 와 REST 방식설정 (GET)
	@ResponseBody
	public Form getFormInfo(HttpServletRequest request, HttpSession session) throws Exception {
				
		int form_id=Integer.parseInt(request.getParameter("form_id"));
		
		Form formInfo=adminDAO.formInfo(form_id);
		
		formInfo.setExplanation(formInfo.getExplanation().replaceAll("<br>", ""));
		System.out.println("formInfo: "+formInfo);
				
		return formInfo;
	}	
	
	//신청폼 수정 페이지에서 field 가져오기
	@RequestMapping(value= "/form/view/field", method = RequestMethod.POST) // 주소 호출 명시 . 호출하려는 주소 와 REST 방식설정 (GET)
	@ResponseBody
	public List<Field> getFieldList(HttpServletRequest request, HttpSession session) throws Exception {
		System.out.println("oghoho");
		int form_id=Integer.parseInt(request.getParameter("form_id"));
			
		List<Field> formDetailField=adminDAO.formDetailField(form_id);
			
		return formDetailField;
	}	
	
	//신청폼 수정 페이지에서 각 field에 맞는 item 가져오기
	@RequestMapping(value= "/form/view/item", method = RequestMethod.POST) // 주소 호출 명시 . 호출하려는 주소 와 REST 방식설정 (GET)
	@ResponseBody
	public List<Item> getItemList(HttpServletRequest request, HttpSession session) throws Exception {
			
		int field_id=Integer.parseInt(request.getParameter("field_id"));
		System.out.println("field_id: "+field_id);
			
		List<Item> formDetailItem=adminDAO.formDetailItem(field_id);
			
		return formDetailItem;
	}	

	
	//신청폼 update
	@SuppressWarnings("finally")
	@RequestMapping(value="/form/view/formUpdate",method=RequestMethod.POST)
	public @ResponseBody ModelAndView modifyFormData(HttpServletRequest request, HttpSession session) throws Exception {

    	String storedCsrfToken = (String) session.getAttribute("CSRF_TOKEN");
    	String requestedCsrfToken = request.getParameter("csrfToken");
    	        
    	if( storedCsrfToken == null || !storedCsrfToken.equals(requestedCsrfToken)){
    	    return new ModelAndView("error/csrfMsg");
    	}
    	
		ModelAndView mav = new ModelAndView("redirect:/admin/mypage");
		System.out.println("in form update><");
		Form form = new Form();
		Category cg = new Category();
		int category_id = 0;
		int form_id = Integer.parseInt(request.getParameter("formId"));
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
			String url = request.getParameter("url");
			if(Integer.parseInt(request.getParameter("isHeaderModified"))==1) {
				
				System.out.println("finally category id "+category_id);
				form.setCategory_id(category_id);
				
				form.setId(form_id);
				int user_id=0;
				if(session.getAttribute("id")!=null) {
					user_id=(Integer) session.getAttribute("id");
				}
				form.setUser_id(user_id);
				String formName = request.getParameter("formName");
				form.setFormName(formName);
				String explanation = request.getParameter("explanation");
				//TO DO 
				explanation = explanation.replaceAll(System.getProperty("line.separator"), "<br>");
				form.setExplanation(explanation);
				
				form.setUrl(url);
				int isAvailable = 0; //TODO
				form.setIsAvailable(isAvailable);
				int isUserEdit = 0;
				form.setIsUserEdit(isUserEdit);
				int plusPoint = Integer.parseInt(request.getParameter("plusPoint"));
				form.setPlusPoint(plusPoint);
				int minusPoint = Integer.parseInt(request.getParameter("minusPoint"));
				form.setMinusPoint(minusPoint);
				String start = request.getParameter("startDate")+" "+request.getParameter("startTime")+":00";
				form.setStart(start);
				String end = request.getParameter("endDate")+" "+request.getParameter("endTime")+":00";
				System.out.println("end:"+end);
				System.out.println("endTime:"+request.getParameter("endTime"));
				form.setEnd(end);
				
				adminDAO.modifyForm(form);
			}
			
			String[] isModified=request.getParameterValues("isModified");
			String[] field_id=request.getParameterValues("fieldId");
			//Field
			int f_cnt = Integer.parseInt(request.getParameter("count"));
			String fieldC=request.getParameter("fieldCount"+Integer.toString(form_id));
			System.out.println("fieldC:"+fieldC);
			int fieldCount = Integer.parseInt(fieldC);
			for(int i=1; i<=fieldCount; i++) {
				if(Integer.parseInt(isModified[i-1])==1) {
					Field field = new Field();
					String title = request.getParameter("f_title"+Integer.toString(i));
					int isFieldDel = Integer.parseInt(request.getParameter("isFieldDel"+Integer.toString(i)));
					if(isFieldDel==1) {
						adminDAO.deleteField(Integer.parseInt(field_id[i-1]));
						continue;
					}
					if(title != null) {
						
						field.setId(Integer.parseInt(field_id[i-1]));
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
						adminDAO.modifyField(field);
						
						if("radio".equals(fieldType)||"checkbox".equals(fieldType)||"select".equals(fieldType)) {
							int i_cnt = Integer.parseInt(request.getParameter("count"+Integer.toString(i)));
							int org_cnt=  Integer.parseInt(request.getParameter("itemCount"+Integer.toString(i)));
							System.out.println("i_cnt"+i_cnt);
							for(int j=1; j<=org_cnt; j++) {
								Item item = new Item();
								String content = request.getParameter(Integer.toString(i)+"content"+Integer.toString(j));
								
								int isItemDel = Integer.parseInt(request.getParameter(Integer.toString(i)+"isItemDel"+Integer.toString(j)));
								System.out.println("content: "+content);
								System.out.println("isItemDel: "+isItemDel);
								if(isItemDel==1) {
									adminDAO.deleteItem(Integer.parseInt(request.getParameter(Integer.toString(i)+"itemId"+Integer.toString(j))));
									continue;
								}
								
								if(content != null) {
									System.out.println(Integer.parseInt(request.getParameter(Integer.toString(i)+"itemId"+Integer.toString(j))));
									item.setId(Integer.parseInt(request.getParameter(Integer.toString(i)+"itemId"+Integer.toString(j))));
									item.setField_id(Integer.parseInt(field_id[i-1]));
									item.setContent(content);
									int isDefault = 0;
									//int isDefault = Integer.parseInt(request.getParameter(Integer.toString(i)+"isDefault"+Integer.toString(j))); 나중에 하자
									item.setIsDefault(isDefault);
									adminDAO.modifyItem(item);
								}
							}
							for(int j=org_cnt+1; j<=i_cnt; j++) {
								Item item = new Item();
								String content = request.getParameter(Integer.toString(i)+"content"+Integer.toString(j));
								if(content != null) {
									System.out.println(Integer.parseInt(request.getParameter(Integer.toString(i)+"itemId"+Integer.toString(j))));
									item.setId(Integer.parseInt(request.getParameter(Integer.toString(i)+"itemId"+Integer.toString(j))));
									item.setField_id(Integer.parseInt(field_id[i-1]));
									item.setContent(content);
									int isDefault = 0;
									//int isDefault = Integer.parseInt(request.getParameter(Integer.toString(i)+"isDefault"+Integer.toString(j))); 나중에 하자
									item.setIsDefault(isDefault);
									adminDAO.createItem(item);
								}
							}
							
						}//radio,select,dropdown이면
					}//field Name이 비어있지 않으면
				}//수정이 되었으면
			}//반복문 끝 (field 수정)
			
			for(int i=fieldCount+1; i<=f_cnt; i++) { //새로운필드를 추가했을 때
				Field field = new Field();
				String title = request.getParameter("f_title"+Integer.toString(i));
				if(title != null) {
					
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
								int fieldID=adminDAO.getFieldId(key);
								item.setField_id(fieldID);
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
	@RequestMapping(value = "/form/result/{link}/{id}")
	  public ModelAndView readForm(@PathVariable String link, @PathVariable int id, HttpSession session, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		
// 		int user_id=0;
// 		if(session.getAttribute("id")!=null) {
// 			user_id=(Integer) session.getAttribute("id");
// 		}
		
		int form_ID=adminDAO.getFormId(link); 
// 		int result_id=adminDAO.getResultId(form_ID,user_id);
		
// 		List<ReadResult> read_list=adminDAO.getReadList(result_id);
// 		List<Category> category_name = adminDAO.getCategoryName();
// 		List<Result> date_list = adminDAO.getDate();
		
		//String form_id  = request.getParameter("select_formID");
		
		HashMap<String, Integer> result_form_id = new HashMap<String, Integer>();
		result_form_id.put("form_id", form_ID);
		result_form_id.put("result_id", id);
		List<ReadResult> read_list=adminDAO.getReadList(result_form_id);
		List<Category> category_name = adminDAO.getCategoryName(form_ID);
		List<Result> date_list = adminDAO.getDate(id);
		
		List<Form> form_info = mainDao.forminfo(form_ID);
		List<Field> field_list = mainDao.fieldList(form_ID);
		int isDeleted = adminDAO.IsCategoryDeleted(form_ID);

		
		//read_list json 처리 
				JSONArray readContent = new JSONArray();
				try {
				    	for (int i = 0; i < read_list.size() ; i++) {   
					    		JSONObject ob =new JSONObject();
					        
					        ob.put("id", read_list.get(i).getId());
					        ob.put("form_id", read_list.get(i).getForm_id());
					        ob.put("fieldType", read_list.get(i).getFieldType());
					        ob.put("fieldName", read_list.get(i).getFieldName());
					        ob.put("fileName", read_list.get(i).getFileName());
					        ob.put("isEssential", read_list.get(i).getIsEssential());
					        ob.put("index", read_list.get(i).getIndex());
					        ob.put("regDate", read_list.get(i).getRegDate());
					        ob.put("key", read_list.get(i).getKey());
					        ob.put("field_id", read_list.get(i).getField_id());
					        ob.put("content", read_list.get(i).getContent());
					        
					            
					        readContent.put(ob);      
				    }
				    	System.out.println("+++++++++++++++++++++");
				        System.out.println(readContent.toString());
				    }catch(JSONException e){
				        e.printStackTrace();
				    }
		
		//category name json처리 
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
		    	System.out.println("--------------------------------------");
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
			System.out.println("=============================");
		        System.out.println(jArray2.toString());
		    }catch(JSONException e){
		        e.printStackTrace();
		    }
		
		//date_list json처리 
				JSONArray reg_edit_date = new JSONArray();
				try {
			    	for (int i = 0; i < date_list.size() ; i++) {   
				    		JSONObject ob =new JSONObject();
				        
				        ob.put("regDate", date_list.get(i).getRegDateKor());
				        ob.put("editDate", date_list.get(i).getEditDateKor());
				            
				        reg_edit_date.put(ob);      
			    }
			    	System.out.println("~~~~~~~~~~~~~~~~~~~~~~~");
			    	System.out.println(reg_edit_date.toString());
			    }catch(JSONException e){
			        e.printStackTrace();
			    }
		
		
		 mav.addObject("form_ID", form_ID);
		 mav.addObject("form_info", jArray1);
		 mav.addObject("field_list", jArray2);
		 mav.addObject("read_list",readContent);
		 mav.addObject("category_name",c_name);
		 mav.addObject("category_isDeleted",isDeleted);
		 mav.addObject("date_list",reg_edit_date);
		 
		 //System.out.println(read_list);
		mav.setViewName("adminFormResult");
		return mav;
	}
	
	@RequestMapping(value = "/form/excel")
	  public ModelAndView excelTest() throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test");
		return mav;
	}
	
	@RequestMapping(value = "/resultForm/downloadExcelFile", method = RequestMethod.POST)
	public void excelDown(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int form_ID = Integer.parseInt(request.getParameter("formID"));//Integer.parseInt(form_id);
		String search_state = request.getParameter("state");
		
		List<Form> form_info = mainDao.forminfo(form_ID);
		List<Field> field_list = mainDao.fieldList(form_ID);
		String categoryName = adminDAO.getCategoryName_one(form_ID);
		User user_info = adminDAO.getUserInfobyId(form_info.get(0).getUser_id());

		
		ArrayList<String> formQ = new ArrayList<String>();
		formQ.add("카테고리");
		formQ.add("설문지명");
		formQ.add("작성자");
		formQ.add("제출기한");
		ArrayList<String> formA = new ArrayList<String>();
		formA.add(categoryName);
		formA.add(form_info.get(0).getFormName());
		formA.add(user_info.getUserName());
		formA.add(form_info.get(0).getStartDateKor() + " ~ " + form_info.get(0).getEndDateKor());
		
		ArrayList<String> q = new ArrayList<String>();
		q.add("제출시간");
		q.add("수정시간");
		q.add("학번");
		q.add("이름");
		q.add("이메일");
		q.add("학부");
		q.add("전공");
		q.add("학년");
		q.add("학기");
		q.add("상태");
		for (int i = 0; i < field_list.size() ; i++) { 
			q.add(field_list.get(i).getFieldName());
		}
		
		List<Result> result_info = adminDAO.getExcelResult(form_ID);
		ArrayList<ArrayList<String>> ans = new ArrayList<ArrayList<String>>();
		for(int i=0; i<result_info.size(); i++) {
			int user_id = result_info.get(i).getUser_id();
			String user_state = adminDAO.getStateofUser(user_id, form_ID);
			//전체인 경우
			boolean check=true;
			//검색의 경우
			if(!search_state.equals("*")) {
				if(!search_state.equals(user_state)) {
					check = false;
				}
			}
			if(check) {
				ArrayList <String> a = new ArrayList<String>();
				User user = adminDAO.getUserInfobyId(user_id);
				a.add(result_info.get(i).getRegDateKor());
				a.add(result_info.get(i).getEditDateKor());
				a.add(user.getStudentId());
				a.add(user.getUserName());
				a.add(user.getEmail());
				a.add(user.getDepartment());
				a.add(user.getMajor());
				a.add(user.getGrade());
				a.add(user.getSemester());
				a.add(user_state);
				List<Result_Content> answer_info = adminDAO.getExcelResultContent(result_info.get(i).getId());
				for(int j=0; j<answer_info.size(); j++) {
					a.add(answer_info.get(j).getContent());
				}
				ans.add(a);
			}
		}
		ExcelDownloadDAO ed = new ExcelDownloadDAO();
		SXSSFWorkbook workbook = ed.makeWorkbook(response, formQ, formA, q, ans, search_state);
	}
	
	@RequestMapping(value = "/manage/downloadExcelFile", method = RequestMethod.POST)
	public void excelDownUser(HttpServletRequest request, HttpServletResponse response, SearchCriteria searchCRI) throws Exception {
		
		//SearchCriteria searchCRI = null;
		List<User> user_info = mypageDao.getUserInfo(searchCRI);
		
		ArrayList<ArrayList<String>> user_list = new ArrayList<ArrayList<String>>();
		ArrayList<String> info = new ArrayList<String>();
		info.add("이름");
		info.add("전화번호");
		info.add("이메일");
		info.add("학번");
		info.add("학부");
		info.add("회원등급");
		user_list.add(info);
		for(int i=0; i<user_info.size(); i++) {
			ArrayList<String> user = new ArrayList<String>();
			user.add(user_info.get(i).getUserName());
			user.add(user_info.get(i).getPhoneNum());
			user.add(user_info.get(i).getEmail());
			user.add(user_info.get(i).getStudentId());
			user.add(user_info.get(i).getDepartment());
			if(user_info.get(i).getAdmin()==0) {
				user.add("관리자");
			}else if (user_info.get(i).getAdmin()==1) {
				user.add("선생님");
			}else {
				user.add("학생");
			}
			user_list.add(user);
		}
	
		ExcelDownloadDAO ed = new ExcelDownloadDAO();
		SXSSFWorkbook workbook = ed.makeWorkbookUser(response, user_list);
	}
	
	//신청폼 수정 페이지에서 field 가져오기
	@RequestMapping(value= "/resultCount", method = RequestMethod.POST) 
	@ResponseBody
	public int getResultCount(HttpServletRequest request) throws Exception {
		int form_id=Integer.parseInt(request.getParameter("form_id"));
		
		int resultCount=adminDAO.resultCount(form_id);
				
		return resultCount;
	}	
	
	@RequestMapping(value = "/deleteForm" ,method = RequestMethod.POST) // GET 방식으로 페이지 호출
	public ModelAndView deleteForm(HttpSession session,HttpServletRequest request) throws Exception {
		
		String formID=request.getParameter("select_formID");
		System.out.println(formID);
		
		adminDAO.deleteForm(Integer.parseInt(formID));
		
		System.out.println("Delete success!!!");
		
		return new ModelAndView("redirect:/admin/mypage");
	}
	
	//admin mypage의 결과 버튼 누를때
	@RequestMapping(value = "/resultForm/{link}" ,method = RequestMethod.POST) // GET 방식으로 페이지 호출
	public ModelAndView resultFormOnly(SearchCriteria cri,@PathVariable String link, HttpServletRequest request) throws Exception {
		
		//밑에는 check page 관련 controller입니당.
		ModelAndView mav = new ModelAndView();
		System.out.println("check!!!!!!!!");
		//int form_id=Integer.parseInt(request.getParameter("select_formID"));
		//int form_id = Integer.parseInt(request.getParameter("select_formID"));
		int form_id = adminDAO.getFormId(link);
		cri.setForm_id(form_id);
		String form_title = adminDAO.getFormName(form_id);
		//String form_title = request.getParameter("select_formTitle");
		String url = adminDAO.getLink(form_id);
		List<Result> submitterList= adminDAO.submitterList(cri);
		int count1 = adminDAO.countSubmitter(cri.getSearchType(), cri.getKeyword(),form_id);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count1);
		
		ObjectMapper mapper=new ObjectMapper();
		String jArray=mapper.writeValueAsString(submitterList);
			
		List<State> stateList=adminDAO.stateList(form_id);
		ObjectMapper mapper2=new ObjectMapper();
		String jArray2=mapper2.writeValueAsString(stateList);
		
		int isAvailable=adminDAO.getAvailable(form_id);
		int isUserEdit=adminDAO.getUserEdit(form_id);
		
		mav.addObject("pageMaker", pageMaker);
		mav.addObject("form_id",form_id);
		mav.addObject("link", url);
		mav.addObject("submitterList", jArray);
		mav.addObject("stateList", jArray2);
		mav.addObject("isAvailable",isAvailable);
		mav.addObject("isUserEdit",isUserEdit);
		mav.addObject("form_title",form_title);
		mav.addObject("idx", cri.getPage());
		mav.addObject("keyword", cri.getKeyword());
				
		mav.setViewName("adminFormCheck");
		return mav;
	}
	
	@RequestMapping(value= "/form/update/changeAvailable", method = RequestMethod.POST) // 주소 호출 명시 . 호출하려는 주소 와 REST 방식설정 (GET)
	public void changeAvailable(HttpServletRequest request, HttpSession session) throws Exception {
			
		int form_id=Integer.parseInt(request.getParameter("form_id"));
		int isAvailable=Integer.parseInt(request.getParameter("isAvailable"));
		adminDAO.changeAvailable(form_id,isAvailable);
	}
	@RequestMapping(value= "/form/update/changeUserEdit", method = RequestMethod.POST) // 주소 호출 명시 . 호출하려는 주소 와 REST 방식설정 (GET)
	public void changeUserEdit(HttpServletRequest request, HttpSession session) throws Exception {
			
		int form_id=Integer.parseInt(request.getParameter("form_id"));
		int isUserEdit=Integer.parseInt(request.getParameter("isUserEdit"));
		adminDAO.changeUserEdit(form_id,isUserEdit);
	}
	
	
//	카테고리 관리하기
	@RequestMapping(value="/categoryPage")
	public ModelAndView manageCategory (HttpSession session) {
		ModelAndView mav = new ModelAndView("categoryManage");
		
		List<Category> category_list = mainDao.categoryList();
		JSONArray jArray = new JSONArray();
		
		try{
			for (int i = 0; i < category_list.size() ; i++) {   
	    		JSONObject ob2 =new JSONObject();
	    		ob2.put("category_id", category_list.get(i).getId());
		        ob2.put("categoryName", category_list.get(i).getCategoryName());
	            jArray.put(ob2);
			}
		}catch(JSONException e){
	    	e.printStackTrace();
	    }
		
		mav.addObject("category_list",jArray);
		
		return mav;
	}
	
	@RequestMapping(value="/category/save", method=RequestMethod.POST)
	public ModelAndView saveCategory (HttpSession session,HttpServletRequest request, HttpServletResponse response, Model model, RedirectAttributes ra) throws Exception {
		

    	String storedCsrfToken = (String) session.getAttribute("CSRF_TOKEN");
    	String requestedCsrfToken = request.getParameter("csrfToken");
    	        
    	if( storedCsrfToken == null || !storedCsrfToken.equals(requestedCsrfToken)){
    	    return new ModelAndView("error/csrfMsg");
    	}
    	
		ModelAndView mav = new ModelAndView("redirect:/alert");
		
		String categoryname = request.getParameter("category");
		String oriCategoryId = request.getParameter("oricategory_ids");
		String[] cateogrynames = categoryname.split(",");
		String[] oriIds = oriCategoryId.split(",");
		
		ArrayList<String> ids=new ArrayList<String>();
		int i;
		for(i=0; i<cateogrynames.length; i++){//현재 존재하는 카테고리의 이름들을 담음
			if(!cateogrynames[i].equals(""))
				ids.add(cateogrynames[i]);
		}
		System.out.println(ids);
		for(i=0; i<oriIds.length; i++) {
			if(!ids.contains(oriIds[i])) {//포함되어있지 않으면 삭제
				adminDAO.deleteCategory(oriIds[i]);
			}
			else {
				ids.remove(oriIds[i]);
			}
		}
		for (i = 0; i < ids.size(); i++) { //새로만드는 카테고리는 삽입
			adminDAO.createCategory(ids.get(i));
		}
		ra.addFlashAttribute("msg", "변경 되었습니다.");
        ra.addFlashAttribute("url","./admin/categoryPage");
        
		return mav;
	}
	
	public boolean isNumeric(String input) { //숫자인지 판별
		try {
			Double.parseDouble(input);
			return true;
		}
		catch (NumberFormatException e) {
			return false;
		}
	}
	
}
