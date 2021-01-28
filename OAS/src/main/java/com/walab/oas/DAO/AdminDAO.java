package com.walab.oas.DAO;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.walab.oas.DTO.Field;


@Repository
public class AdminDAO {
		
	@Autowired
	SqlSessionTemplate sqlSession;
	
	private static String namespace ="com.walab.oas.mappers.oas_mapper";

	public List<Field> getFieldList(){//form_id를 가져와야하는 것 아닌가?
		
		return sqlSession.selectList(namespace+".getFieldList");
			
	}
}
