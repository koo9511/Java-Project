package com.kh.danim.notice.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.danim.notice.model.vo.Notice;

@Repository("noticeDao")
public class NoticeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCount() {
		return sqlSession.selectOne("noticeMapper.listCount");
	}

	public List<Notice> selectList(HashMap<String, Object> map) {
		return sqlSession.selectList("noticeMapper.noticeList",map);
	}

	public Notice noticeDetail(int nnum) {
		return sqlSession.selectOne("noticeMapper.noticeDetail",nnum);
	}

	public int noticeDelete(int noticeno) {
		return sqlSession.delete("noticeMapper.noticeDelete", noticeno);
	}

	public int noticeInsert(Notice notice) {
		return sqlSession.insert("noticeMapper.noticeInsert", notice);
	}

	public int noticeUpdate(Notice notice) {
		return sqlSession.update("noticeMapper.noticeUpdate", notice);
	}
	
	
}
