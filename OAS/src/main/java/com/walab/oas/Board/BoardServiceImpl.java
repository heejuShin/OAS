package com.walab.oas.Board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.walab.oas.DTO.SearchCriteria;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardDAO boardDAO;
	
	@Override
	public int insertBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		return boardDAO.insertBoard(vo);
	}

	@Override
	public int deleteBoard(int seq) {
		// TODO Auto-generated method stub
		return boardDAO.deleteBoard(seq);
	}

	@Override
	public int updateBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		return boardDAO.updateBoard(vo);
	}

	@Override
	public BoardVO getBoard(int seq) {
		// TODO Auto-generated method stub
		return boardDAO.getBoard(seq);
	}

	@Override
	public List<BoardVO> getBoardList(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return boardDAO.getBoardList(cri);
	}
	
	
	@Override

	public int countBoard(String searchType, String keyword) throws Exception{
		return boardDAO.countBoard(searchType,keyword);
	}
	  //파일 업로드 추가
	  @Override
	  public int fileInsert(FileVO file) {
	    return boardDAO.fileInsert(file);
	  }

}
