package com.walab.oas.Board;

import java.util.List;

import com.walab.oas.Board.domain.FileVO;

public interface BoardService {
	public int insertBoard(BoardVO vo);
	public int deleteBoard(int seq);
	public int updateBoard(BoardVO vo);
	public BoardVO getBoard(int seq);
	public List<BoardVO> getBoardList();
	//public int fileInsert(FileVO file) throws Exception;
	//public void fileInsertService(FileVO file);
	public int fileInsertService(FileVO file) throws Exception;
}
