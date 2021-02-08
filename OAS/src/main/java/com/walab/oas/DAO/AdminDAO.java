package com.walab.oas.DAO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.walab.oas.DTO.Category;
import com.walab.oas.DTO.Field;
import com.walab.oas.DTO.Form;
import com.walab.oas.DTO.Item;
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
		System.out.println("im here");
		return sqlSession.insert(namespace + ".add_Category", cg);
	}
	
	//admin Form update 기능
	public Form formInfo(int form_id) {
		return sqlSession.selectOne(namespace + ".formDetailInfo",form_id);
	}
	public List<Field> formDetailField(int form_id) {
		return sqlSession.selectList(namespace + ".formDetailField",form_id);
	}
	public List<Item> formDetailItem(int field_id) {
		return sqlSession.selectList(namespace + ".formDetailItem",field_id);
	}
	public void modifyForm(Form form) {
		sqlSession.update(namespace + ".modifyForm",form);
	}
	public void modifyField(Field field) {
		sqlSession.update(namespace + ".modifyField",field);
	}
	public void modifyItem(Item item) {
		sqlSession.update(namespace + ".modifyItem",item);
	}
}
