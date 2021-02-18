package com.walab.oas.Controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.walab.oas.DAO.UserDAO;
import com.walab.oas.DTO.GoogleOAuthRequest;
import com.walab.oas.DTO.GoogleOAuthResponse;
import com.walab.oas.DTO.User;

@RestController
@RequestMapping(value = "/login")
//@SessionAttributes("ses")
public class LoginController {
   
   @Autowired
   private UserDAO userDao; 

   final static String GOOGLE_AUTH_BASE_URL = "https://accounts.google.com/o/oauth2/v2/auth";
   final static String GOOGLE_TOKEN_BASE_URL = "https://oauth2.googleapis.com/token";
   final static String GOOGLE_REVOKE_TOKEN_BASE_URL = "https://oauth2.googleapis.com/revoke";

   //@Value("${api.client_id}")
   String clientId="561186600567-ghv5joqq35ar98gvkp6vqa5pltvop4ie.apps.googleusercontent.com";
   //@Value("${api.client_secret}")
   String clientSecret="qRBA7XR_GqET0L-PU1AfQL4u";
   
   
   @GetMapping("/logout")
   @ResponseBody
   //@ModelAttribute("ses")
   public ModelAndView logout(HttpSession session, SessionStatus sessionStatus) throws JsonProcessingException {
      System.out.println("Im logout");
      sessionStatus.setComplete();
      session.invalidate();
      ModelAndView mav = new ModelAndView();
      mav.setViewName("redirect:/");
      return mav;
   }
   
   
   /**
    * Authentication Code를 전달 받는 엔드포인트
 * @throws IOException 
 * @throws JsonMappingException 
 * @throws JsonParseException 
    **/
   @GetMapping("google/auth")
   //@ModelAttribute("ses")
   public ModelAndView googleAuth( ModelAndView mav,HttpServletRequest request, @RequestParam(value = "code") String authCode) throws JsonParseException, JsonMappingException, IOException
         {
      
	   String rootPath = request.getRequestURL().toString().replace(request.getRequestURI(),"")+request.getContextPath();
	   
      HttpSession session = request.getSession();
      System.out.println("Session is "+ session);
      
      RestTemplate restTemplate = new RestTemplate();


      //Google OAuth Access Token 요청을 위한 파라미터 세팅
      GoogleOAuthRequest googleOAuthRequestParam = new GoogleOAuthRequest(clientId,clientSecret,authCode,rootPath+"/login/google/auth","authorization_code");

      
      //JSON 파싱을 위한 기본값 세팅
      //요청시 파라미터는 스네이크 케이스로 세팅되므로 Object mapper에 미리 설정해준다.
      ObjectMapper mapper = new ObjectMapper();
      mapper.setPropertyNamingStrategy(PropertyNamingStrategy.SNAKE_CASE);
      mapper.setSerializationInclusion(Include.NON_NULL);

      
      //AccessToken 발급 요청
      ResponseEntity<String> resultEntity = restTemplate.postForEntity(GOOGLE_TOKEN_BASE_URL, googleOAuthRequestParam, String.class);
 
      //Token Request
      GoogleOAuthResponse result = mapper.readValue(resultEntity.getBody(), new TypeReference<GoogleOAuthResponse>() {
      });
      

      //ID Token만 추출 (사용자의 정보는  jwt로 인코딩 되어있다)
      String jwtToken = result.getIdToken();
      String requestUrl = UriComponentsBuilder.fromHttpUrl("https://oauth2.googleapis.com/tokeninfo")
      .queryParam("id_token", jwtToken).toUriString();
      
      String resultJson = restTemplate.getForObject(requestUrl, String.class);
      
      Map<String,String> userInfo = mapper.readValue(resultJson, new TypeReference<Map<String, String>>(){});
      
      if(!userInfo.get("email").contains("handong.edu")) {
    	  
    	  mav.setViewName("loginError");
    	  return mav;
      }
    	  
      
      User user = new User();
      user.setEmail(userInfo.get("email"));
      user.setUserName(userInfo.get("name"));
      //List<User> users = userDao.users();
      //String redirectUrl = "redirect:https://accou
      if(userDao.isUserExist(userInfo.get("email"))==0) {
          mav.addObject("user", user);
          //mav.addObject("token", result.getAccessToken());
          mav.setViewName("registInfo");
          
          return mav;
      }
      else {
	      user = userDao.findUser(user.getEmail());
	      
	      session.setAttribute("id", user.getId());
	      session.setAttribute("name", user.getUserName());
	      session.setAttribute("email", user.getEmail());
	      session.setAttribute("admin", user.getAdmin());
	      session.setAttribute("studentId", user.getStudentId());
	      session.setAttribute("grade", user.getGrade());
	      session.setAttribute("department", user.getDepartment());
	      session.setAttribute("admin", user.getAdmin());
	      mav.setViewName("redirect:/");
	      return mav;
      }
      
      /*
      for(int i=0;i<users.size();i++) {
         System.out.println(i+" "+user.getEmail()+" "+users.get(i).getEmail()+" "+ user.getEmail().equals(users.get(i).getEmail()));
         if(user.getEmail().equals(users.get(i).getEmail())) {
            mav.addObject("user", user);
            
            session.setAttribute("name", users.get(i).getUserName());
            session.setAttribute("email", users.get(i).getEmail());
            session.setAttribute("admin", users.get(i).getAdmin());
            session.setAttribute("studentId", users.get(i).getStudentId());
            session.setAttribute("grade", users.get(i).getGrade());
            session.setAttribute("department", users.get(i).getDepartment());
            session.setAttribute("admin", users.get(i).getAdmin());
            //mav.addObject("token", result.getAccessToken());
            mav.setViewName("redirect:/");
            return mav;
         }
      }*/
   }
   
   /**
    * 토큰 무효화 
    **/
   @GetMapping("google/revoke/token")
   @ResponseBody
   //@ModelAttribute("ses")
   public Map<String, String> revokeToken(@RequestParam(value = "token") String token) throws JsonProcessingException {

      Map<String, String> result = new HashMap<String,String>();
      RestTemplate restTemplate = new RestTemplate();
      final String requestUrl = UriComponentsBuilder.fromHttpUrl(GOOGLE_REVOKE_TOKEN_BASE_URL)
            .queryParam("token", token).toUriString();
      
      String resultJson = restTemplate.postForObject(requestUrl, null, String.class);
      result.put("result", "success");
      result.put("resultJson", resultJson);

      return result;

   }
   
   @RequestMapping(value = "/redirectUrl")
     public ModelAndView googleUrl(HttpServletRequest request) throws Exception {
      ModelAndView mav = new ModelAndView();
      String rootPath = request.getRequestURL().toString().replace(request.getRequestURI(),"")+request.getContextPath();
      
      String redirectUrl = "redirect:https://accounts.google.com/o/oauth2/v2/auth?"
            + "client_id=561186600567-ghv5joqq35ar98gvkp6vqa5pltvop4ie.apps.googleusercontent.com"
            + "&redirect_uri="+rootPath+"/login/google/auth"
            + "&response_type=code"
            + "&scope=email%20profile%20openid"
            + "&access_type=offline";
      
      mav.setViewName(redirectUrl);
      return mav;
   }
   
   //@ModelAttribute("ses")
   @RequestMapping(value = "/google/regist" ,method = RequestMethod.POST)
     public ModelAndView registUser(HttpSession session,User user) throws Exception {
      ModelAndView mav = new ModelAndView();
      
      int user_id=userDao.joinUser(user);
      System.out.println("user = "+user.getEmail()+" "+user.getGrade());
      session.setAttribute("id", user.getId());
      session.setAttribute("name", user.getUserName());
      session.setAttribute("email", user.getEmail());
      session.setAttribute("admin", 2);
      session.setAttribute("studentId", user.getStudentId());
      session.setAttribute("grade", user.getGrade());
      session.setAttribute("department", user.getDepartment());
      System.out.println("lc admin check : "+ user.getAdmin());
      mav.setViewName("redirect:/");
      return mav;
   }
}



