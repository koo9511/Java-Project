package com.kh.danim.key.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.danim.key.model.vo.EmailKey;

@Repository
public class EmailKeyDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertKey(String key) {
		return sqlSession.insert("keyMapper.keyinsert",key);
	}

	public EmailKey keyCheck(String key) {
		return sqlSession.selectOne("keyMapper.keyCheck", key);
	}

	public void keyDelete(String key) {
		sqlSession.delete("keyMapper.keyDelete", key);
		
	}
}
