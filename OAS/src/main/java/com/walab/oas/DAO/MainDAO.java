package com.walab.oas.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.walab.oas.DTO.Category;
import com.walab.oas.DTO.Field;
import com.walab.oas.DTO.Form;
import com.walab.oas.DTO.Form_ver2;
import com.walab.oas.DTO.Item;
import com.walab.oas.DTO.Result;
import com.walab.oas.DTO.Result_Content;
import com.walab.oas.DTO.SearchCriteria;
import com.walab.oas.DTO.State;

@Repository
public class MainDAO{

	@Autowired
	SqlSession sqlSession;
	
	private static String namespace ="com.walab.oas.mappers.oas_mapper";
	

//	public List<Form_ver2> formList(SearchCriteria cri) {
//		return sqlSession.selectList(namespace + ".form_list",cri);
//	}
	
	public List<Form_ver2> formList(SearchCriteria cri) {
		return sqlSession.selectList(namespace + ".form_list",cri);
	}
	
	public List<Category> categoryList() {
		return sqlSession.selectList(namespace + ".category_list");
	}
	
	public List<Form> forminfo (int formID) {
		return sqlSession.selectList(namespace + ".formInfo", formID);
	}
	
	public List<Field> fieldList(int formID) {
		return sqlSession.selectList(namespace + ".fieldInfo", formID);
	}
	
	
	
	
}
