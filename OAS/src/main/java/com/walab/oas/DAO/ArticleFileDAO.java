package com.walab.oas.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class ArticleFileDAO {
	private static String namespace ="com.walab.oas.mappers.oas_mapper";
	private SqlSession sqlSession;
	
    public void addFile(String fileName) throws Exception {
        sqlSession.insert(namespace + ".addFile", fileName);
    }
    // 첨부 파일 목록
    public List<String> getArticleFiles(Integer articleNo) throws Exception {
        return sqlSession.selectList(namespace + ".getArticleFiles");
    }
    
    public void deleteFile(String fileName) throws Exception {
        sqlSession.delete(namespace + ".deleteFile", fileName);
    }
    
    public void replaceFile(String fileName, Integer articleNo) throws Exception {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("fileName", fileName);
        sqlSession.insert(namespace + ".replaceFile", paramMap);
    }
    

}
