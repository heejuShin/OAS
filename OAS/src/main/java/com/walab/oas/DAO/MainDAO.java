package com.walab.oas.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.walab.oas.DTO.Category;
import com.walab.oas.DTO.Form;

@Repository
public class MainDAO{

	@Autowired
	SqlSession sqlSession;
	
	private static String namespace ="com.walab.oas.mappers.oas_mapper";
	

	public List<Form> formList() {
		return sqlSession.selectList(namespace + ".form_list");
	}
	
	public List<Category> categoryList() {
		return sqlSession.selectList(namespace + ".category_list");
	}
}
