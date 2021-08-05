package com.walab.oas.Controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.walab.oas.DAO.UserDAO;

@RestController
@RequestMapping(value = "")
public class FileController {
	@Autowired
	private UserDAO userDao; 
	
	@RequestMapping(value="/fileDown")
	public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response,HttpServletRequest request) throws Exception{
		Map<String, Object> resultMap = userDao.selectFileInfo(map);			

		String storedFileName = (String) resultMap.get("fileName");
		String originalFileName = (String) resultMap.get("fileRealName");
		
		String rootPath = request.getRequestURL().toString().replace(request.getRequestURI(),"")+request.getContextPath();
		System.out.println(rootPath);
		// 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("/Users/hayeon/git/OAS/OAS/src/main/webapp/resources/attachments/"+storedFileName));
//		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("/Users/hayeon/Documents/workspace-spring-tool-suite-4/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/OAS/resources/attachments/"+originalFileName));

		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
	}


}

