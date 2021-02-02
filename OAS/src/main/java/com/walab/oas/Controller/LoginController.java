package com.walab.oas.Controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.walab.oas.DAO.UserDAO;
import com.walab.oas.DTO.GoogleOAuthRequest;
import com.walab.oas.DTO.GoogleOAuthResponse;
import com.walab.oas.DTO.User;

@RestController
@RequestMapping(value = "/login")
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
	
	/**
	 * Authentication Code를 전달 받는 엔드포인트
	 **/
	@GetMapping("google/auth")
	public ModelAndView googleAuth( ModelAndView mav,HttpServletRequest request, @RequestParam(value = "code") String authCode)
			throws JsonProcessingException {
		
		HttpSession session = request.getSession();
		
		//HTTP Request를 위한 RestTemplate
		RestTemplate restTemplate = new RestTemplate();

		//Google OAuth Access Token 요청을 위한 파라미터 세팅
		GoogleOAuthRequest googleOAuthRequestParam = new GoogleOAuthRequest(clientId,clientSecret,authCode,"http://localhost:8088/oas/login/google/auth","authorization_code");



		
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
		
		
		User user = new User();
		user.setEmail(userInfo.get("email"));
		user.setUserName(userInfo.get("name"));
		mav.addObject("user", user);
		mav.addObject("token", result.getAccessToken());
		mav.setViewName("registInfo");
		
		return mav;

	}
	
	/**
	 * 토큰 무효화 
	 **/
	@GetMapping("google/revoke/token")
	@ResponseBody
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
	  public ModelAndView googleUrl() throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String redirectUrl = "redirect:https://accounts.google.com/o/oauth2/v2/auth?"
				+ "client_id=561186600567-ghv5joqq35ar98gvkp6vqa5pltvop4ie.apps.googleusercontent.com"
				+ "&redirect_uri=http://localhost:8088/oas/login/google/auth"
				+ "&response_type=code"
				+ "&scope=email%20profile%20openid"
				+ "&access_type=offline";
		
		mav.setViewName(redirectUrl);
		return mav;
	}
	
	@RequestMapping(value = "/google/regist" ,method = RequestMethod.POST)
	  public ModelAndView registUser(HttpSession session,User user) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		int user_id=userDao.joinUser(user);
		
		
		mav.setViewName("home");
		return mav;
	}
}
