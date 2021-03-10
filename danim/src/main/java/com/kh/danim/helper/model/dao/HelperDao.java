package com.kh.danim.helper.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.danim.help.model.vo.Help;
import com.kh.danim.helper.model.vo.Helper;

@Repository
public class HelperDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertHelper(Helper helper) {
		return sqlSession.insert("helperMapper.insertHelper", helper);
	}

	public int listCount(HashMap<String, Object> map) {
		return sqlSession.selectOne("helperMapper.listCount", map);
	}

	public List<Helper> selectHelperList(HashMap<String, Object> map) {
		return sqlSession.selectList("helperMapper.selectHelperList", map);
	}

	public Helper helperCount(String userid) {
		return sqlSession.selectOne("helperMapper.helperCount", userid);
	}

	public Helper helperDetail(int helperno) {
		return sqlSession.selectOne("helperMapper.helperDetail", helperno);
	}

	public int helperDelete(int helperno) {
		return sqlSession.delete("helperMapper.helperDelete", helperno);
	}

	public int helperUpdate(Helper helper) {
		return sqlSession.update("helperMapper.helperUpdate", helper);
	}

	public int howMuch(String loginid) {
		return sqlSession.selectOne("helperMapper.howMuch",loginid);
	}
	
}
