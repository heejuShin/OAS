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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.walab.oas.DAO.MainDAO;
import com.walab.oas.DAO.MyPageDAO;
import com.walab.oas.DTO.Category;
import com.walab.oas.DTO.Form;
import com.walab.oas.DTO.PageMaker;
import com.walab.oas.DTO.SearchCriteria;
import com.walab.oas.DTO.User;

@RestController
@RequestMapping(value = "/") // 주소 패턴
public class MyPageController {
	
	@Autowired
	private MyPageDAO mypageDao; 
	@Autowired
	private MainDAO mainDao; 
	
	// 게시판 페이징
		@RequestMapping(value="/admin/mypage")
		public ModelAndView adminPageList(SearchCriteria cri, HttpSession session) throws JsonProcessingException {
			ModelAndView mav = null;
			
			mav = new ModelAndView("adminMypage");
			
			List<Category> categoryt=mainDao.categoryList();
			ObjectMapper category_mapper=new ObjectMapper();
			String category_list=category_mapper.writeValueAsString(categoryt);
			
			List<Form> adminList = mypageDao.adminList(cri); //admin의 폼 데이터 리스트를 가져온다
			int count=mypageDao.countArticle(cri.getSearchType(), cri.getKeyword());
			
			ObjectMapper mapper=new ObjectMapper();
			String jArray=mapper.writeValueAsString(adminList);
			PageMaker pageMaker = new PageMaker();
			System.out.println(cri);
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(count);
			
			mav.addObject("categoryList", category_list);
			mav.addObject("adminList", jArray);
			mav.addObject("count", count);
			mav.addObject("searchOption", cri.getSearchType());
			mav.addObject("keyword", cri.getKeyword());
			
			mav.addObject("pageMaker", pageMaker);

			return mav;
		}
		
		
		
		@RequestMapping(value="/mypage")
		public ModelAndView userPageList(SearchCriteria cri, HttpSession session) throws JsonProcessingException {
			ModelAndView mav = null;
			
			mav = new ModelAndView("userMypage");
			int user_id=1;
			
			//카테고리 리스트
			List<Category> categoryt=mainDao.categoryList();
			ObjectMapper category_mapper=new ObjectMapper();
			String category_list=category_mapper.writeValueAsString(categoryt);
			mav.addObject("categoryList", category_list);
			
			//userTab1 신청폼 개수 가져오기 (TAB1)
			cri.setUser_id(user_id);
			List<Form> userList = mypageDao.userList(cri); //admin의 폼 데이터 리스트를 가져온다
			int count1 = mypageDao.countUserTab1(cri.getSearchType(), cri.getKeyword());
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(count1);
			ObjectMapper mapper=new ObjectMapper();
			String jArray=mapper.writeValueAsString(userList);
			mav.addObject("userList", jArray);
			mav.addObject("count1", count1);
			mav.addObject("pageMaker", pageMaker);
		
			
			//TAB2
			List<Form> userTab2=mypageDao.noApplyForm(cri);
			PageMaker pageMaker2 = new PageMaker();
			pageMaker2.setCri(cri);
			int count2 = mypageDao.countUserTab2(cri.getSearchType(), cri.getKeyword());
			pageMaker2.setTotalCount(count2);
			ObjectMapper mapper2=new ObjectMapper();
			String userTabStrint2=mapper2.writeValueAsString(userTab2);
			mav.addObject("userTab2", userTabStrint2);
			mav.addObject("count2", count2);
			mav.addObject("pageMaker2", pageMaker2);
			
			//TAB3
			List<Form> userTab3=mypageDao.pastApplyForm(cri);
			int count3 = mypageDao.countUserTab3(cri.getSearchType(), cri.getKeyword());
			PageMaker pageMaker3 = new PageMaker();
			pageMaker3.setCri(cri);
			pageMaker3.setTotalCount(count3);
			ObjectMapper mapper3=new ObjectMapper();
			String userTabStrint3=mapper3.writeValueAsString(userTab3);
			mav.addObject("userTab3", userTabStrint3);
			mav.addObject("count3", count3);
			mav.addObject("pageMaker3", pageMaker3);
			
			
			mav.addObject("keyword", cri.getKeyword());
			
			return mav;
		}
		
		/*
		@RequestMapping(value = "/userTab2" ,method = RequestMethod.POST) // GET 방식으로 페이지 호출
		@ResponseBody
		public List<Form> userTab2(HttpSession session,HttpServletRequest request,SearchCriteria cri) throws Exception {
			int user_id=Integer.parseInt(request.getParameter("user_id"));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(mypageDao.countArticle(cri.getSearchType(), cri.getKeyword()));
			
			List<Form> formList=mypageDao.noApplyForm(cri,user_id);
			return formList;
		}*/
		/*
		@RequestMapping(value = "/userTab3" ,method = RequestMethod.POST) // GET 방식으로 페이지 호출
		@ResponseBody
		public List<Form> userTab3(HttpSession session,HttpServletRequest request,SearchCriteria cri) throws Exception {
			int user_id=Integer.parseInt(request.getParameter("user_id"));
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(mypageDao.countArticle(cri.getSearchType(), cri.getKeyword()));
			
			List<Form> formList=mypageDao.pastApplyForm(cri,user_id);
			System.out.println("formTab3: "+formList);
			return formList;
		}*/
		
		@RequestMapping(value = "/admin/deleteForm" ,method = RequestMethod.POST) // GET 방식으로 페이지 호출
		public ModelAndView deleteForm(HttpSession session,HttpServletRequest request) throws Exception {
			
			String formID=request.getParameter("select_formID");
			System.out.println(formID);
			
			mypageDao.deleteForm(Integer.parseInt(formID));
			
			System.out.println("Delete success!!!");
			
			return new ModelAndView("redirect:/admin/mypage");
		}
		
		@RequestMapping(value= "/userInformation") // 주소 호출 명시 . 호출하려는 주소 와 REST 방식설정 (GET)
		@ResponseBody
		public List<User> getUserInfo(HttpSession session) throws Exception {
				
			String email="21700000@handong.edu";
				
			List<User> userinfo = mypageDao.getUserInfo(email);
				
			System.out.println("userinfo: "+userinfo);
				
			return userinfo;
		}
		
		@RequestMapping(value = "/info/modify" ,method = RequestMethod.POST)
		  public ModelAndView modifyInfo(HttpSession session,User user) throws Exception {
			ModelAndView mav = new ModelAndView();
			
			
			mypageDao.modifyInfo(user);
			
			mav.setViewName("redirect:/mypage");
			return mav;
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
