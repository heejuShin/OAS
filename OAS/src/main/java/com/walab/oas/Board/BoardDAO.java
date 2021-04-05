package com.walab.oas.Board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.walab.oas.DTO.SearchCriteria;

@Repository
public class BoardDAO {
	
	@Autowired
	SqlSession sqlSession;
	private static String namespace ="com.walab.oas.mappers.board-mapper";
	
	public int insertBoard(BoardVO vo) {
		return sqlSession.insert(namespace+".insertBoard", vo);
	}
	
	public int deleteBoard(int seq) {
		return sqlSession.delete(namespace+".deleteBoard", seq);
	}
	
	public int updateBoard(BoardVO vo) {
		return sqlSession.update(namespace+".updateBoard", vo);
	}
	
	
	public BoardVO getBoard(int seq) {
		return sqlSession.selectOne(namespace+".getBoard", seq);
	}
	
	public List<BoardVO> getBoardList(SearchCriteria  cri) {
		return sqlSession.selectList(namespace+".getBoardList",cri);
	}
	
	 //파일 업로드 메서드 추가
	public int fileInsert(FileVO file) {
		return sqlSession.insert(namespace+".fileInsert", file);
	}


	public int countBoard(String searchType, String keyword) throws Exception{
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchType",searchType);
		map.put("keyword", keyword);
		return sqlSession.selectOne(namespace+".countBoard",map);
	}
}