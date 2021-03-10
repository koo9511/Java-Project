package com.kh.danim.admin.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.danim.admin.model.vo.Admin;
import com.kh.danim.notice.model.vo.Notice;

@Repository("adminDao")
public class AdminDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Admin selectAdmin(String adminid) {
		return sqlSession.selectOne("adminMapper.selectAdmin", adminid);
	}

	public int getListCount() {
		return sqlSession.selectOne("adminMapper.listCount");
	}

	public List<Notice> selectList(HashMap<String, Object> map) {
		return sqlSession.selectList("adminMapper.selectList",map);
	}

}
