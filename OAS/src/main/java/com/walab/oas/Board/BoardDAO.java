package com.walab.oas.Board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.walab.oas.Board.domain.FileVO;
import com.walab.oas.DTO.ReadResult;

@Repository
public class BoardDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public int insertBoard(BoardVO vo) {
		return sqlSession.insert("Board.insertBoard", vo);
	}
	
	public int deleteBoard(int seq) {
		return sqlSession.delete("Board.deleteBoard", seq);
	}
	
	public int updateBoard(BoardVO vo) {
		return sqlSession.update("Board.updateBoard", vo);
	}
	
	
	public BoardVO getBoard(int seq) {
		return sqlSession.selectOne("Board.getBoard", seq);
	}
	
	public List<BoardVO> getBoardList() {
		return sqlSession.selectList("Board.getBoardList");
	}
	
	public int fileInsert(FileVO file) {
		// TODO Auto-generated method stub
		//return 0;
		return sqlSession.insert("Board.fileInsert", file);
	}


}