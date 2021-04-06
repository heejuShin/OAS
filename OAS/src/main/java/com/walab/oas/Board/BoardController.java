package com.walab.oas.Board;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.walab.oas.DTO.PageMaker;
import com.walab.oas.DTO.ReadResult;
import com.walab.oas.DTO.SearchCriteria;


@RestController
@RequestMapping(value="/")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	BoardDAO dao = new BoardDAO();
	
    @RequestMapping(value = "board/list", method = RequestMethod.GET)    
    public ModelAndView list(SearchCriteria cri, HttpSession session) throws Exception{    
    	ModelAndView mav=new ModelAndView("list");
    	
    	int user_id=0;
		if(session.getAttribute("id")!=null) {
			user_id=(Integer) session.getAttribute("id");
		}
		
		List<BoardVO> boardList=boardService.getBoardList(cri);
//		ObjectMapper mapper=new ObjectMapper();
//		String jArray=mapper.writeValueAsString(boardList);

		int count=boardService.countBoard(cri.getSearchType(),cri.getKeyword());//총 게시판 수
		
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		
		mav.addObject("searchOption", cri.getSearchType());
		mav.addObject("keyword", cri.getKeyword());
		mav.addObject("pageMaker", pageMaker);
        mav.addObject("list", boardList);
        return mav;   
    } 
    
    @RequestMapping(value = "/admin/board/add", method = RequestMethod.GET)    
    public ModelAndView addPost(){  
    	ModelAndView mav=new ModelAndView("addpostform");
        return mav;   
    }
    
    @RequestMapping(value = "/admin/board/addok", method = RequestMethod.POST)    
    public ModelAndView addPostOk(BoardVO vo, HttpServletRequest request, @RequestPart MultipartFile files) throws Exception{     
       
       ModelAndView mav=new ModelAndView("redirect:../../board/list");
      
       BoardVO board = new BoardVO();
//       board.setSubject(request.getParameter("subject"));
//       board.setContent(request.getParameter("content"));
//       board.setWriter(request.getParameter("writer"));
    	
    	if(files.isEmpty()){ //업로드할 파일이 없을 시
    		boardService.insertBoard(vo); //게시글 insert
        }else {
            String fileName = files.getOriginalFilename(); // 사용자 컴에 저장된 파일명 그대로
            //확장자
            String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
            File destinationFile; // DB에 저장할 파일 고유명
            String destinationFileName;
            //절대경로 설정 안해주면 지 맘대로 들어가버려서 절대경로 박아주었습니다.
            String fileUrl = "/OAS/src/main/webapp/resources/fileupload";

            do { //우선 실행 후
              //고유명 생성
              destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
              destinationFile = new File(fileUrl + destinationFileName); //합쳐주기
            } while (destinationFile.exists()); 

            destinationFile.getParentFile().mkdirs(); //디렉토리
            files.transferTo(destinationFile);

            boardService.insertBoard(vo);

            FileVO file = new FileVO();
            file.setB_no(vo.getSeq());
            file.setFilename(destinationFileName);
            file.setFileoriginname(fileName);
            file.setFileurl(fileUrl);
            
            boardService.fileInsert(file);
          }
       return mav;
    }
    

    
    @RequestMapping(value = "/admin/board/editform/{id}", method = RequestMethod.GET)    
    public ModelAndView editPost(@PathVariable("id") int id){
    	BoardVO boardVO = boardService.getBoard(id);
    	ModelAndView mav=new ModelAndView("editform");
    	mav.addObject("u", boardVO);
        return mav;   
    }
    
//    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)    
//    public String viewPost(@PathVariable("id") int id, Model model){
//    	BoardVO boardVO = boardService.getBoard(id);
//    	model.addAttribute("u", boardVO);
//        return "view";   
//    }
    
    @RequestMapping(value = "/admin/board/view/{id}", method = RequestMethod.GET)    
    public ModelAndView viewPost(@PathVariable("id") int id, Model model,SearchCriteria cri) throws Exception{
//    	BoardVO boardVO = boardService.getBoard(id);
//    	model.addAttribute("u", boardVO);
//        return "view";
    	BoardVO vo = boardService.getBoard(id);
		ModelAndView mav = new ModelAndView();
		
//      BoardDAO dao = new BoardDAO();
		List<BoardVO> read_list = dao.getBoardList(cri);
		
		//파일 
		FileVO file = new FileVO();
		boardService.fileInsert(file);
		
		JSONArray readContent = new JSONArray();
		try {
		    	for (int i = 0; i < read_list.size() ; i++) {   
			    		JSONObject ob =new JSONObject();
			       
			    	ob.put("Category", read_list.get(i).getCategory());
			    	ob.put("Title", read_list.get(i).getTitle());	
			    	ob.put("Wrter", read_list.get(i).getWriter());
			    	ob.put("Content", read_list.get(i).getContent());
			    	//파일 
			    	//ob.put("File", read_list.get(i).fileInsertService(file));    
			        readContent.put(ob);      
		    }
		    	System.out.println("+++++++++++++++++++++");
		        System.out.println(readContent.toString());
		    }catch(JSONException e){
		        e.printStackTrace();
		    }
		
		mav.addObject("read_list",readContent);
    	model.addAttribute("u", vo);

		mav.setViewName("adminView");
		return mav;
    }
    
    @RequestMapping(value = "/board/view/{id}", method = RequestMethod.GET)    
    public ModelAndView userviewPost(@PathVariable("id") int id, Model model,SearchCriteria cri) throws Exception{
//    	BoardVO boardVO = boardService.getBoard(id);
//    	model.addAttribute("u", boardVO);
//        return "view";
    	BoardVO vo = boardService.getBoard(id);
		ModelAndView mav = new ModelAndView();
		
//      BoardDAO dao = new BoardDAO();
		List<BoardVO> read_list = dao.getBoardList(cri);
		
		//파일 
		FileVO file = new FileVO();
		boardService.fileInsert(file);
		
		JSONArray readContent = new JSONArray();
		try {
		    	for (int i = 0; i < read_list.size() ; i++) {   
			    		JSONObject ob =new JSONObject();
			        
//			        ob.put("id", read_list.get(i).getId());
//			        ob.put("form_id", read_list.get(i).getForm_id());
//			        ob.put("Category", read_list.get(i).getCategory());
//			        ob.put("fieldName", read_list.get(i).getFieldName());
//			        ob.put("fileName", read_list.get(i).getFileName());
//			        ob.put("isEssential", read_list.get(i).getIsEssential());
//			        ob.put("index", read_list.get(i).getIndex());
//			        ob.put("regDate", read_list.get(i).getRegDate());
//			        ob.put("key", read_list.get(i).getKey());
//			        ob.put("field_id", read_list.get(i).getField_id());
//			        ob.put("content", read_list.get(i).getContent());
			    		
			    	ob.put("Category", read_list.get(i).getCategory());
			    	ob.put("Title", read_list.get(i).getTitle());	
			    	ob.put("Wrter", read_list.get(i).getWriter());
			    	ob.put("Content", read_list.get(i).getContent());
			    	//파일 
			    	//ob.put("File", read_list.get(i).fileInsertService(file));    
			        readContent.put(ob);      
		    }
		    	System.out.println("+++++++++++++++++++++");
		        System.out.println(readContent.toString());
		    }catch(JSONException e){
		        e.printStackTrace();
		    }
		
		mav.addObject("read_list",readContent);
    	model.addAttribute("u", vo);

		mav.setViewName("userView");
		return mav;
    }
    
    @RequestMapping(value = "/board/editok", method = RequestMethod.POST)    
    public ModelAndView editPostOk(BoardVO vo){
    	ModelAndView mav=new ModelAndView("redirect:list");
    	if(boardService.updateBoard(vo) == 0)
    		System.out.println("데이터 수정 실패 ");
    	else
    		System.out.println("데이터 수정 성공!!!");
    	return mav;
    }
    
    @RequestMapping(value = "/board/deleteok/{id}", method = RequestMethod.GET)    
    public ModelAndView deletePostOk(@PathVariable("id") int id){    
    	ModelAndView mav=new ModelAndView("redirect:../list");
    	if(boardService.deleteBoard(id) == 0) {
        	System.out.println("데이터 삭제 실패 ");
        }
       else
        	System.out.println("데이터 삭제 성공!!!"); 
       return mav;
    }
    
}