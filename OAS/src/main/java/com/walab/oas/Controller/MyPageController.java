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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.walab.oas.DAO.AdminDAO;
import com.walab.oas.DAO.MainDAO;
import com.walab.oas.DAO.MyPageDAO;
import com.walab.oas.DTO.Category;
import com.walab.oas.DTO.Form;
import com.walab.oas.DTO.PageMaker;
import com.walab.oas.DTO.SearchCriteria;
import com.walab.oas.DTO.State;
import com.walab.oas.DTO.User;

@RestController
@RequestMapping(value = "/") // 주소 패턴
public class MyPageController {
	
	@Autowired
	private MyPageDAO mypageDao; 
	@Autowired
	private MainDAO mainDao; 
	@Autowired
	private AdminDAO adminDAO;
	
	// 게시판 페이징
		@RequestMapping(value="/admin/mypage")
		public ModelAndView adminPageList(HttpServletRequest request, SearchCriteria cri, HttpSession session) throws JsonProcessingException {
			ModelAndView mav = null;

			if(session.getAttribute("admin")==null) {
				mav = new ModelAndView("LoginNeed");
				return mav;
			}
			else if(((Integer)session.getAttribute("admin"))==2) {
				mav = new ModelAndView("AccessDenied");
			}
			else {
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
			}
			return mav;
		}
		
		@RequestMapping(value="/admin/mypage/state")
		public ModelAndView manageDefaultState (HttpSession session) {
			ModelAndView mav = new ModelAndView("adminStateManage");
			
			List<State> state_list = mainDao.stateList(0);
			JSONArray jArray = new JSONArray();
			
			try{
				for (int i = 0; i < state_list.size() ; i++) {   
		    		JSONObject ob2 =new JSONObject();
		    		ob2.put("id", state_list.get(i).getId());
			        ob2.put("stateName", state_list.get(i).getStateName());
		            jArray.put(ob2);
				}
			}catch(JSONException e){
		    	e.printStackTrace();
		    }
			
			mav.addObject("state_list",jArray);
			
			return mav;
		}
		
		@RequestMapping(value="/admin/mypage/state/save", method=RequestMethod.POST)
		public ModelAndView saveDefaultState (HttpServletRequest request) throws Exception {
			ModelAndView mav = new ModelAndView("redirect:/admin/mypage/state");
			
			State state= new State();
			String statename = request.getParameter("state");
			String[] statenames = statename.split(",");
			adminDAO.deleteDefaultState();
			for (int i = 0; i < statenames.length; i++) {
				state.setStateName(statenames[i]);
				state.setIsDefualt(1);
				state.setForm_id(0);
				adminDAO.createState(state);
			}
			
			return mav;
		}
		
		
		
		@RequestMapping(value="/mypage")
		public ModelAndView userPageList(SearchCriteria cri, HttpSession session) throws JsonProcessingException {
			ModelAndView mav = null;
			
			mav = new ModelAndView("userMypage");
			int user_id=0;
			if(session.getAttribute("id")!=null) {
				user_id=(Integer) session.getAttribute("id");
			}
			
			//카테고리 리스트
			List<Category> categoryt=mainDao.categoryList();
			ObjectMapper category_mapper=new ObjectMapper();
			String category_list=category_mapper.writeValueAsString(categoryt);
			mav.addObject("categoryList", category_list);
			
			//userTab1 신청폼 개수 가져오기 (TAB1)
			cri.setUser_id(user_id);
			List<Form> userList = mypageDao.userList(cri); //admin의 폼 데이터 리스트를 가져온다
			System.out.println(cri);
			int count1 = mypageDao.countUserTab1(cri.getSearchType(), cri.getKeyword(), cri.getFilterType(),user_id);
			
			System.out.println("userList"+count1);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(count1);
			ObjectMapper mapper=new ObjectMapper();
			String jArray=mapper.writeValueAsString(userList);
			System.out.println(jArray);
			mav.addObject("userList", jArray);
			mav.addObject("cri", cri);
			mav.addObject("pageMaker", pageMaker);
			
			mav.addObject("keyword", cri.getKeyword());
			
			return mav;
		}
		
		@RequestMapping(value= "/userInformation") // 주소 호출 명시 . 호출하려는 주소 와 REST 방식설정 (GET)
		@ResponseBody
		public List<User> getUserInfo(HttpSession session) throws Exception {
			
			String email = "21700000@handong.edu";
			if(session.getAttribute("email")!=null) {
				email = (String)session.getAttribute("email");
			}
				
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
				
				//유저 탈퇴처리하기 
				@RequestMapping(value = "/admin/deleteUser",method = RequestMethod.POST) 
				public ModelAndView deleteUser (HttpSession session, HttpServletRequest request) throws Exception {
					System.out.println("<deleteUser> controller");
					
					String userID  = request.getParameter("userID");
					mypageDao.deleteUser(Integer.parseInt(userID));
					
					System.out.println("<deleteUser> controller Finish");
					return new ModelAndView("redirect:/admin/manage");

					
				}
		

}
