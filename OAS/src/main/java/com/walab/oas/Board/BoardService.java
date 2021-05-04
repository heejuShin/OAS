package com.walab.oas.Board;

import java.util.List;

import com.walab.oas.DTO.SearchCriteria;

public interface BoardService {
	public int insertBoard(BoardVO vo);
	public int deleteBoard(int seq);
	public int updateBoard(BoardVO vo);
	public BoardVO getBoard(int seq);
	public List<BoardVO> getBoardList(SearchCriteria cri);
	//public int fileInsert(FileVO file) throws Exception;
	//public void fileInsertService(FileVO file);
//	public int fileInsert(FileVO file) throws Exception;
	public int countBoard(String searchType, String keyword) throws Exception;
}
