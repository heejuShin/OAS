package com.walab.oas.Board;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.walab.oas.Board.domain.FileVO;
import com.walab.oas.DTO.ReadResult;


@Controller
@RequestMapping(value="/board")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
    @RequestMapping(value = "/list", method = RequestMethod.GET)    
    public String list(Model model){    
        model.addAttribute("list", boardService.getBoardList());
        return "list";   
    } 
    
    @RequestMapping(value = "/add", method = RequestMethod.GET)    
    public String addPost(){  
        return "addpostform";   
    }
    
    @RequestMapping(value = "/addok", method = RequestMethod.POST)    
    public String addPostOk(BoardVO vo, HttpServletRequest request, @RequestPart MultipartFile files) throws Exception{     
       
       BoardVO board = new BoardVO();
       
//       board.setSubject(request.getParameter("subject"));
//       board.setContent(request.getParameter("content"));
//       board.setWriter(request.getParameter("writer"));
    	FileVO  file  = new FileVO();
    	
    	if(files.isEmpty()){ //업로드할 파일이 없을 시
    		boardService.insertBoard(vo); //게시글 insert
        }else{


        String fileName = files.getOriginalFilename(); 
        String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();

//       String sourceFileName = files.getOriginalFilename(); 
//       String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase(); 
       File destinationFile; 
       String destinationFileName;
       String fileUrl = "/Users/sebinlee/git/OAS/OAS/src/main/webapp/WEB-INF/uploadFiles/";

       do { 
           destinationFileName = "Uploaded_" + RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension; 
           //destinationFileName = fileName; //+ "." + fileNameExtension; 

           destinationFile = new File(fileUrl + destinationFileName); 
       } while (destinationFile.exists()); 
       
       destinationFile.getParentFile().mkdirs(); 
       files.transferTo(destinationFile); 
       
       //boardService.insertBoard(vo);
       
       file.setBno(board.getBno());
       file.setFileName(destinationFileName);
       file.setFileOriName(fileName);
       file.setFileUrl(fileUrl);
       
       boardService.fileInsertService(file); //file insert //zzim
       //mBoardService.fileInsertService(file);//Original code
       
       if(boardService.insertBoard(vo) == 0) {
       	System.out.println("데이터 추가 실패 ");
       }
      else
       	System.out.println("데이터 추가 성공!!!");
        }
       return "redirect:list";
    }
    

    
    @RequestMapping(value = "/editform/{id}", method = RequestMethod.GET)    
    public String editPost(@PathVariable("id") int id, Model model){
    	BoardVO boardVO = boardService.getBoard(id);
    	model.addAttribute("u", boardVO);
        return "editform";   
    }
    
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)    
    public String viewPost(@PathVariable("id") int id, Model model){
    	BoardVO boardVO = boardService.getBoard(id);
    	model.addAttribute("u", boardVO);
        return "view";   
    }
    
//    @RequestMapping(value = "/view/id={id}", method = RequestMethod.GET)    
//    public ModelAndView viewPost(@PathVariable("id") int id, Model model) throws Exception{
////    	BoardVO boardVO = boardService.getBoard(id);
////    	model.addAttribute("u", boardVO);
////        return "view";
//    	BoardVO vo = boardService.getBoard(id);
//		ModelAndView mav = new ModelAndView();
//		
//        BoardDAO dao = new BoardDAO();
//		List<BoardVO> read_list = dao.getBoardList();
//		
//		//파일 
//		FileVO file = new FileVO();
//		boardService.fileInsertService(file);
//		
//		JSONArray readContent = new JSONArray();
//		try {
//		    	for (int i = 0; i < read_list.size() ; i++) {   
//			    		JSONObject ob =new JSONObject();
//			        
////			        ob.put("id", read_list.get(i).getId());
////			        ob.put("form_id", read_list.get(i).getForm_id());
////			        ob.put("Category", read_list.get(i).getCategory());
////			        ob.put("fieldName", read_list.get(i).getFieldName());
////			        ob.put("fileName", read_list.get(i).getFileName());
////			        ob.put("isEssential", read_list.get(i).getIsEssential());
////			        ob.put("index", read_list.get(i).getIndex());
////			        ob.put("regDate", read_list.get(i).getRegDate());
////			        ob.put("key", read_list.get(i).getKey());
////			        ob.put("field_id", read_list.get(i).getField_id());
////			        ob.put("content", read_list.get(i).getContent());
//			    		
//			    	ob.put("Category", read_list.get(i).getCategory());
//			    	ob.put("Title", read_list.get(i).getTitle());	
//			    	ob.put("Wrter", read_list.get(i).getWriter());
//			    	ob.put("Content", read_list.get(i).getContent());
//			    	//파일 
//			    	//ob.put("File", read_list.get(i).fileInsertService(file));    
//			        readContent.put(ob);      
//		    }
//		    	System.out.println("+++++++++++++++++++++");
//		        System.out.println(readContent.toString());
//		    }catch(JSONException e){
//		        e.printStackTrace();
//		    }
//		
//		mav.addObject("read_list",readContent);
//
//		mav.setViewName("view");
//		return mav;
//    }
    
    @RequestMapping(value = "/editok", method = RequestMethod.POST)    
    public String editPostOk(BoardVO vo){
    	if(boardService.updateBoard(vo) == 0)
    		System.out.println("데이터 수정 실패 ");
    	else
    		System.out.println("데이터 수정 성공!!!");
    	return "redirect:list";
    }
    
    @RequestMapping(value = "/deleteok/{id}", method = RequestMethod.GET)    
    public String deletePostOk(@PathVariable("id") int id){    
        if(boardService.deleteBoard(id) == 0) {
        	System.out.println("데이터 삭제 실패 ");
        }
       else
        	System.out.println("데이터 삭제 성공!!!"); 
       return "redirect:../list";
    }
    
}
