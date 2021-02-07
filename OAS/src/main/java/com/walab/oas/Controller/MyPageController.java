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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.walab.oas.DAO.MyPageDAO;
import com.walab.oas.DTO.Form;
import com.walab.oas.DTO.PageMaker;
import com.walab.oas.DTO.SearchCriteria;
import com.walab.oas.DTO.User;

@RestController
@RequestMapping(value = "/") // 주소 패턴
public class MyPageController {
	
	@Autowired
	private MyPageDAO mypageDao; 
	
	// 게시판 페이징
		@RequestMapping(value="/admin/mypage")
		public ModelAndView adminPageList(SearchCriteria cri, HttpSession session) {
			ModelAndView mav = null;
			
			mav = new ModelAndView("adminMypage");
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(mypageDao.countArticle(cri.getSearchType(), cri.getKeyword()));

			ObjectMapper mapper = new ObjectMapper();

			JSONArray jArray = new JSONArray();
			
			List<Form> adminList = mypageDao.adminList(cri); //admin의 폼 데이터 리스트를 가져온다
			System.out.println(adminList);
			
	        try {
	        	for (int i = 0; i < adminList.size() ; i++) {   
	        		JSONObject ob =new JSONObject();
	        		ob.put("id", adminList.get(i).getId());
			        ob.put("categoryName", adminList.get(i).getCategoryName());
		            ob.put("formName", adminList.get(i).getFormName());
		            ob.put("startDate", adminList.get(i).getStartDate());
		            ob.put("endDate", adminList.get(i).getEndDate());
		            ob.put("regDate", adminList.get(i).getRegDate());
		            ob.put("userName", adminList.get(i).getUserName());
		            jArray.put(ob);
		        }
	
	        }catch(JSONException e){
	        	e.printStackTrace();
	        }
			
			int count = mypageDao.countArticle(cri.getSearchType(), cri.getKeyword());
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			mav.addObject("adminList", jArray);
			mav.addObject("count", count);
			mav.addObject("searchOption", cri.getSearchType());
			mav.addObject("keyword", cri.getKeyword());
			
//			String json = null ;
//			
//			try { // convert map to JSON string 
//				json= mapper.writeValueAsString(adminList); 
//				
//				json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(adminList); 
//				
//				System.out.println("json: "+json); // pretty-print 
//				} catch (JsonProcessingException e) { e.printStackTrace(); }
//			
	       
			mav.addObject("pageMaker", pageMaker);

			return mav;
		}
		
		
		
		@RequestMapping(value="/mypage")
		public ModelAndView userPageList(SearchCriteria cri, HttpSession session) {
			ModelAndView mav = null;
			
			mav = new ModelAndView("userMypage");
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(mypageDao.countArticle(cri.getSearchType(), cri.getKeyword()));

			ObjectMapper mapper = new ObjectMapper();

			JSONArray jArray = new JSONArray();
			
			int user_id=1;
			
			List<Form> userList = mypageDao.userList(cri,user_id); //admin의 폼 데이터 리스트를 가져온다
			System.out.println(userList);
			
	        try {
	        	for (int i = 0; i < userList.size() ; i++) {   
	        		JSONObject ob =new JSONObject();
	        		ob.put("id", userList.get(i).getId());
			        ob.put("categoryName", userList.get(i).getCategoryName());
		            ob.put("formName", userList.get(i).getFormName());
		            ob.put("startDate", userList.get(i).getStartDate());
		            ob.put("endDate", userList.get(i).getEndDate());
		            ob.put("regDate", userList.get(i).getRegDate());
		            ob.put("userName", userList.get(i).getUserName());
		            jArray.put(ob);
		        }
	
	        }catch(JSONException e){
	        	e.printStackTrace();
	        }
			
			int count = mypageDao.countArticle(cri.getSearchType(), cri.getKeyword());
			System.out.println(jArray);
			mav.addObject("userList", jArray);
			mav.addObject("count", count);
			mav.addObject("searchOption", cri.getSearchType());
			mav.addObject("keyword", cri.getKeyword());
			
			mav.addObject("pageMaker", pageMaker);

			return mav;
		}
		
		@RequestMapping(value = "/admin/deleteForm" ,method = RequestMethod.POST) // GET 방식으로 페이지 호출
		public ModelAndView deleteForm(HttpSession session,HttpServletRequest request) throws Exception {
			
			String[] formID=request.getParameterValues("resultIDarray");
			System.out.println(formID);
			
			for(int i=0; i<formID.length; i++) {
				System.out.println("formID: "+formID[i]);
				mypageDao.deleteForm(Integer.parseInt(formID[i]));
			
			}
			System.out.println("Delete success!!!");
			
			return new ModelAndView("redirect:/admin/mypage");
		}
		
		//유저 관리 페이지
		@RequestMapping(value = "/admin/manage") 
		public ModelAndView managePage (HttpSession session, HttpServletRequest request) throws Exception {
			System.out.println("<managePage> controller");
			
			List<User> userData = mypageDao.getUserInfo();
			JSONArray jArray = new JSONArray();
			 try {
		        	for (int i = 0; i < userData.size() ; i++) {   
		        		JSONObject ob =new JSONObject();
		        		ob.put("id", userData.get(i).getId());
				        ob.put("userName", userData.get(i).getUserName());
				        ob.put("userNumber",userData.get(i).getPhoneNum());
				        ob.put("userEmail", userData.get(i).getEmail());
				        ob.put("studentID", userData.get(i).getStudentId());
			            ob.put("studentMajor", userData.get(i).getMajor());
			            ob.put("userLevel", userData.get(i).getAdmin());

			            jArray.put(ob);
			        }
		        	System.out.println(jArray);
		
		        }catch(JSONException e){
		        	e.printStackTrace();
		        }
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("adminUserManage");
			mav.addObject("userData", jArray);
			System.out.println("<managePage> controller Finish!");
			return mav;
		}
				
				//유저 레벨 변경하기 
				@RequestMapping(value = "/admin/setLevel") 
				public void setLevels (HttpSession session, HttpServletRequest request) throws Exception {
					System.out.println("<setLevels> controller");
					
					String[] userIDs  = request.getParameterValues("userIDs[]");
					String userLevel = request.getParameter("newState");
					
					for(int i=0; i < userIDs.length ;i++) {
						User user = new User();
						user.setId(Integer.parseInt(userIDs[i]));
						user.setAdmin(Integer.parseInt(userLevel));
						System.out.println(user);
						mypageDao.updateAdmin(user);
					}
					System.out.println("<setLevels> controller Finish");
					
				}
		

}
