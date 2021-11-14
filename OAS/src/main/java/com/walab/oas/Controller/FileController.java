package com.walab.oas.Controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.walab.oas.DAO.AdminDAO;
import com.walab.oas.DAO.UserDAO;
import com.walab.oas.DTO.file;

@RestController
@RequestMapping(value = "")
public class FileController {
	@Autowired
	private UserDAO userDao;
	@Autowired
	private AdminDAO adminDao;

	@RequestMapping(value = "/fileDown")
	public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		Map<String, Object> resultMap = userDao.selectFileInfo(map);

		String storedFileName = (String) resultMap.get("fileName");
		String originalFileName = (String) resultMap.get("fileRealName");

		String rootPath = request.getRequestURL().toString().replace(request.getRequestURI(), "")
				+ request.getContextPath();
		System.out.println(rootPath);
		// 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(
				new File("/Users/hayeon/git/OAS/OAS/src/main/webapp/resources/attachments/" + storedFileName));
//		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("/Users/hayeon/Documents/workspace-spring-tool-suite-4/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/OAS/resources/attachments/"+originalFileName));

		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",
				"attachment; fileName=\"" + URLEncoder.encode(originalFileName, "UTF-8") + "\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();

	}

	@RequestMapping(value = "/downloadFile")
	@ResponseBody
	public int downloadFile(@RequestParam int id, HttpServletResponse response, HttpServletRequest request)
			throws Exception {

		System.out.println("downloadFile Controller");
		System.out.println("AJAX Param: " + id);

		file fileInfo = adminDao.getFileInfo(id);
		System.out.println("fileInfo: " + fileInfo.getFileRealName() + ", " + fileInfo.getFileName());

		String fileName = fileInfo.getFileName();
		String realFileName = fileInfo.getFileRealName();
		String saveFileName = request.getSession().getServletContext().getRealPath("/") + "resources/img/"+ fileName;
		
		System.out.println("Download file location: "+ saveFileName);
 
        File file = new File(saveFileName);
        //String contentType = "image/png";
        Path filePath = Paths.get(saveFileName);
		String contentType = Files.probeContentType(filePath);
        long fileLength = file.length();
        // 데이터베이스에 없는 정보는 파일로 만들어서 가져온다. 이 경우엔 Content-Length 가져온 것
 
        response.setHeader("Content-Disposition", "attachment; filename=\"" + realFileName + "\";");
        response.setHeader("Content-Transfer-Encoding", "binary"); 
        response.setHeader("Content-Type", contentType);
        response.setHeader("Content-Length", "" + fileLength);
        response.setHeader("Pragma", "no-cache;");
        response.setHeader("Expires", "-1;");
        // 그 정보들을 가지고 reponse의 Header에 세팅한 후
        
        try (FileInputStream fis = new FileInputStream(saveFileName); OutputStream out = response.getOutputStream();) {
            // saveFileName을 파라미터로 넣어 inputStream 객체를 만들고 
            // response에서 파일을 내보낼 OutputStream을 가져와서  
            int readCount = 0;
            byte[] buffer = new byte[1024];
            // 파일 읽을 만큼 크기의 buffer를 생성한 후 
            while ((readCount = fis.read(buffer)) != -1) {
                out.write(buffer, 0, readCount);
                // outputStream에 씌워준다
            }
        } catch (Exception ex) {
        		System.out.println("file Load Error");
            throw new RuntimeException("file Load Error");
        }
        
        
        	return id;
 
		

	}
}
