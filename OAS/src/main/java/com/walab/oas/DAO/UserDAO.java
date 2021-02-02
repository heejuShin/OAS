package com.walab.oas.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.walab.oas.DTO.User;

@Repository
public class UserDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	private static String namespace ="com.walab.oas.mappers.oas_mapper";
	
	
	public int joinUser(User user) throws Exception {
		return sqlSession.insert(namespace + ".joinUser",user);
	}

}
