package com.walab.oas.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.walab.oas.DTO.Category;
import com.walab.oas.DTO.Field;
import com.walab.oas.DTO.Form;
import com.walab.oas.DTO.Item;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static String namespace ="com.walab.oas.mappers.oas_mapper";
	
	public int createForm(Form form) throws Exception{
		return sqlSession.insert(namespace + ".formCreate", form);
	}
	
	public int createField(Field field) throws Exception{
		return sqlSession.insert(namespace+ ".fieldCreate", field);
	}
	
	public int createItem(Item item) throws Exception{
		return sqlSession.insert(namespace+ ".itemCreate", item);
	}
	
	public int getFormId(String url) {
		return sqlSession.selectOne(namespace +".getFormId", url);
	}
	
	public int getFieldId(String key) {
		return sqlSession.selectOne(namespace +".getFieldId", key);
	}
	
	public int linkDupCheck(String link) {
		return sqlSession.selectOne(namespace +".linkDupCheck", link);
	}
		
	public int addCategory (Category cg) throws Exception{
		return sqlSession.insert(namespace + ".add_Category", cg);
	}

}
