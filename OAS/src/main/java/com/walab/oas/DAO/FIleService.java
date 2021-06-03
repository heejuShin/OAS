package com.walab.oas.DAO;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

public class FIleService {
	@Autowired
	UserDAO dao;
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return dao.selectFileInfo(map);
	}

}
