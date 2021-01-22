package com.walab.oas.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.walab.oas.DTO.User;

@Repository
public class MainDAO{

	@Autowired
	SqlSession sqlSession;
	
	private static String namespace ="com.walab.oas.mappers.oas_mapper";
	
	//예시입니다!
	public User login(User user) {
		return sqlSession.selectOne(namespace+".login",user);
	}
}
