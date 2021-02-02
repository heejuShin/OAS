package com.walab.oas.DAO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.walab.oas.DTO.Result;
import com.walab.oas.DTO.State;

@Repository
public class AdminDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	private static String namespace ="com.walab.oas.mappers.oas_mapper";
	
	public List<Result> submitterList(int form_id) {
		return sqlSession.selectList(namespace + ".submitterList",form_id);
	}
	
	public List<State> stateList(int form_id) {
		return sqlSession.selectList(namespace + ".stateList",form_id);
	}

	public void stateUpdate(Map<String, Object> paramMap) {
		sqlSession.update(namespace + ".stateUpdate",paramMap);
	}
		
}
