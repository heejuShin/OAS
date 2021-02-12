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
import com.walab.oas.DTO.Result_Content;
import com.walab.oas.DTO.State;
import com.walab.oas.DTO.User;
import com.walab.oas.DTO.ReadResult;

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
	public void createState(State state) throws Exception{
		 sqlSession.insert(namespace + ".stateCreate", state);
	}
	public void deleteDefaultState() {
		sqlSession.delete(namespace + ".deleteDefaultState");
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

	public List<ReadResult> getReadList(){	
		return sqlSession.selectList(namespace+".getReadList");		
	}
	
	public List<Category> getCategoryName(){		
		return sqlSession.selectList(namespace+".getCategoryName");		
	}
	
	public String getCategoryName_one(int id){	
		return sqlSession.selectOne(namespace+".getCategoryName_one", id);		
	}
	
	public List<Result> getDate(){		
		return sqlSession.selectList(namespace+".getDate");		
	}
	
	public User getUserInfobyId(int id) {
		return sqlSession.selectOne(namespace+".getUserInfobyId", id);
	}
	
	public List<Result> getExcelResult(int id){
		return sqlSession.selectList(namespace+".excelResult", id);
	}
	
	public List<Result_Content> getExcelResultContent(int id){
		return sqlSession.selectList(namespace+".excelResultContent", id);
	}
	
	public int resultCount(int form_id) throws Exception{
		return sqlSession.selectOne(namespace+ ".resultCount", form_id);
	}
	
	//선택한 form 삭제
	public void deleteForm(int formID) throws Exception {
		sqlSession.delete(namespace + ".deleteForm",formID);
	}
}
