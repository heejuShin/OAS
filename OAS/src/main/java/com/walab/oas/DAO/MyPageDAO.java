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
import com.walab.oas.DTO.User;

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
	
	public List<Form> userList(SearchCriteria cri){ //admin의 폼리스트 가져오기
		
		return sqlSession.selectList("userlist", cri);
	}
	
	public int countBoardList() {
		return sqlSession.selectOne(namespace +".countBoardList");
	}
	
	//선택한 form 삭제
	public void deleteForm(int formID) throws Exception {
		sqlSession.delete(namespace + ".deleteForm",formID);
	}
	
	//user info 가져오기 
	public List<User> getUserInfo() throws Exception{
		return sqlSession.selectList(namespace + ".getUserInfo");
	}
	
	//user admin update 
		public void updateAdmin(User user) throws Exception{
			 sqlSession.update(namespace + ".updateLevel",user);
		}
		
	//user 정보 가져오기
	public List<User> getUserInfo(String email){ //admin의 폼리스트 가져오기
		return sqlSession.selectList("userinfo", email);
	}
	
	//user 정보 수정하기
	//user 정보 가져오기
	public void modifyInfo(User user){ //admin의 폼리스트 가져오기
		sqlSession.update("modifyInfo", user);
	}
	
	//user 신청 안 한 신청폼 가져오기
	public List<Form> noApplyForm(SearchCriteria cri){ //admin의 폼리스트 가져오기
		
		return sqlSession.selectList("noApplyForm", cri);
	}
	
	//신청했던 과거 폼들 가져오기
	//user 신청한 한 신청폼 가져오기
	public List<Form> pastApplyForm(SearchCriteria cri){ //admin의 폼리스트 가져오기
		
		return sqlSession.selectList("pastApplyForm", cri);
	}
}
