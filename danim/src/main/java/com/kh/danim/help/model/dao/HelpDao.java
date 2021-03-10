package com.kh.danim.help.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.danim.help.model.vo.Help;
import com.kh.danim.user.controller.UserController;

@Repository
public class HelpDao {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	public int insertHelp(Help help) {
		return sqlSession.insert("helpMapper.insertHelp", help);
	}

	public List<Help> selectHelpList(HashMap<String, Object> map) {
		logger.debug("Dao selecthelplist inputmap : " + map.toString());
		return sqlSession.selectList("helpMapper.selectHelpList", map);
	}

	public Help selectOneHelp(int helpno) {
		return sqlSession.selectOne("helpMapper.selectOneHelp", helpno);
	}

	public Help helpCount(HashMap<String, Object> map) {
		return sqlSession.selectOne("helpMapper.helpCount", map);
	}

	public int listCount(HashMap<String, Object> map) {
		logger.debug("Dao : " + map.toString());
		return sqlSession.selectOne("helpMapper.listCount", map);
	}

	public int helpDelete(int helpno) {
		return sqlSession.delete("helpMapper.helpDelete", helpno);
	}

	public int helpUpdate(Help help) {
		return sqlSession.update("helpMapper.helpUpdate", help);
	}

	public String getHelperList(int helpno) {
		return sqlSession.selectOne("helpMapper.getHelperList", helpno);
	}

	public int setHelperList(HashMap<String, Object> map) {
		return sqlSession.update("helpMapper.setHelperList",map);
	}

	public int setHelperId(HashMap<String, Object> map) {
		return sqlSession.update("helpMapper.setHelperId", map);
	}

	public int matchingCount(String userid) {
		return sqlSession.selectOne("helpMapper.matchingCount", userid);
	}

	public Help selectOneMatching(int helpno) {
		return sqlSession.selectOne("helpMapper.selectOneMatching", helpno);
	}

	public void helpAfterDelete() {
		sqlSession.delete("helpMapper.helpAfterDelete");
	}

	public int matchingStatus(HashMap<String, Object> map) {
		return sqlSession.update("helpMapper.matchingStatus", map);
	}

	public String cancelStatus(int helpno) {
		return sqlSession.selectOne("helpMapper.cancelStatus",helpno);
	}

	public int cancelStatusUpdate(HashMap<String, Object> map) {
		return sqlSession.update("helpMapper.cancelStatusUpdate", map);
	}

	public int updateHelpListToHelperId(HashMap<String, Object> map) {
		return sqlSession.update("helpMapper.updateHelpListToHelperId", map);
	}

	public int removeHelperId(int helpno) {
		return sqlSession.update("helpMapper.removeHelperId", helpno);
	}

	public int matchingStatusUpdate(HashMap<String, Object> map) {
		return sqlSession.update("helpMapper.matchingStatusUpdate", map);
	}

	public String matchingStatus(int helpno) {
		return sqlSession.selectOne("helpMapper.matchingStatus", helpno);
	}

	public int updateStatusToFinal(int helpno) {
		return sqlSession.update("helpMapper.updateStatusToFinal", helpno);
	}

	public int howmuch(String helpid) {
		return sqlSession.selectOne("helpMapper.howMuch", helpid);
	}

	public void openChat(HashMap<String, Object> map2) {
		sqlSession.insert("helpMapper.openChat",map2);
		
	}

	

}
