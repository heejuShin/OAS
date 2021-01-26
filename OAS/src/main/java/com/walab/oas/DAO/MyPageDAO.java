package com.walab.oas.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.walab.oas.DTO.Criteria;
import com.walab.oas.DTO.Form;
import com.walab.oas.DTO.SearchCriteria;

@Repository
public class MyPageDAO {

	
	@Autowired
	SqlSession sqlSession;
	
	private static String namespace ="com.walab.oas.mappers.oas_mapper";
	
	
	// Criteria 객체에 담아서 SQL 매핑에 보낼 파라미터
	// 특정 페이지 게시글의 행(pageStart)과 페이지당 보여줄 게시글의 갯수(perPageNum)
//	public List<Map<String, Object>> pageList(Criteria cri) {
//		return sqlSession.selectList(namespace + ".adminlist", cri);
//	}
	
	public List<Form> adminList(SearchCriteria cri){ //admin의 폼리스트 가져오기
		return sqlSession.selectList("adminlist", cri);
	}
	
	public List<Form> userList(SearchCriteria cri,int user_id){ //admin의 폼리스트 가져오기
		return sqlSession.selectList("userlist", cri);
	}
	
	public int countArticle(String searchType, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		return sqlSession.selectOne("countArticle", map);
	}
	
	public int countBoardList() {
		return sqlSession.selectOne(namespace +".countBoardList");
	}
	
	//선택한 form 삭제
	public void deleteForm(int formID) throws Exception {
		sqlSession.delete(namespace + ".deleteForm",formID);
	}
		
}
