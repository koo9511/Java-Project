package com.kh.danim.contact.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.danim.contact.model.vo.Contact;
import com.kh.danim.helpcenter.model.vo.HelpCenter;

@Repository("conDao")
public class ContactDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int contactSend(Contact contact) {
		return sqlSession.insert("contactMapper.contactSend", contact);
	}

	public int adminListCount() {
		return sqlSession.selectOne("contactMapper.adminListCount");
	}

	public List<HelpCenter> adminSelectList(HashMap<String, Object> map) {
		return sqlSession.selectList("contactMapper.adminSelectList",map);
	}

	public Contact adminSelectOne(int contactno) {
		return sqlSession.selectOne("contactMapper.adminSelectOne",contactno);
	}

	public int adminAnswer(int contactno) {
		return sqlSession.update("contactMapper.adminAnswer",contactno);
	}
}
