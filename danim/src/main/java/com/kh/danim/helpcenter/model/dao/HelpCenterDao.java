package com.kh.danim.helpcenter.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.danim.helpcenter.model.vo.HelpCenter;

@Repository("helpcenterDao")
public class HelpCenterDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int helpcenterInsert(HelpCenter helpcenter) {
		return sqlSession.insert("helpcenterMapper.helpcenterInsert",helpcenter);
	}

	public int mycenterList(String userid) {
		return sqlSession.selectOne("helpcenterMapper.mycenterListCount",userid);
	}

	public List<HelpCenter> selectList(HashMap<String, Object> map) {
		return sqlSession.selectList("helpcenterMapper.selectList",map);
	}

	public HelpCenter selectOne(int helpcenterno) {
		return sqlSession.selectOne("helpcenterMapper.selectOne",helpcenterno);
	}

	public int adminCenterList() {
		return sqlSession.selectOne("helpcenterMapper.adminCenterListCount");
	}

	public List<HelpCenter> adminSelectList(HashMap<String, Object> map) {
		return sqlSession.selectList("helpcenterMapper.adminSelectList",map);
	}

	public int adminAnswer(int helpcenterno) {
		return sqlSession.update("helpcenterMapper.adminAnswer",helpcenterno);
	}
}
