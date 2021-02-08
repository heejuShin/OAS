package com.walab.oas.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.walab.oas.DTO.Item;
import com.walab.oas.DTO.Result;
import com.walab.oas.DTO.Result_Content;
import com.walab.oas.DTO.User;

@Repository
public class UserDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	private static String namespace ="com.walab.oas.mappers.oas_mapper";
	
	
	public int joinUser(User user) throws Exception {
		return sqlSession.insert(namespace + ".joinUser",user);
	}
	//field 별 option 들고오기 
	public List<Item> itemList(int fieldID) {
		return sqlSession.selectList(namespace + ".itemInfo", fieldID);
	}
	
	public int getState (int formID) {
		 return sqlSession.selectOne(namespace + ".getStateID", formID);
	}
	
	public int setResult (Result resultInfo) {
		 return sqlSession.insert(namespace + ".createResultID", resultInfo);
	}
	
	public void setContent (Result_Content resultInfo) {
		 sqlSession.insert(namespace + ".inputContent", resultInfo);
	}
	
	public List<User> users() throws Exception{
		return sqlSession.selectList(namespace + ".users");
	}

}
