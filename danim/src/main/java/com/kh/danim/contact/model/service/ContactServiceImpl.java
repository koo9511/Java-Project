package com.kh.danim.contact.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.danim.contact.model.dao.ContactDao;
import com.kh.danim.contact.model.vo.Contact;
import com.kh.danim.helpcenter.model.vo.HelpCenter;

@Service("contactService")
public class ContactServiceImpl implements ContactService{

	@Autowired
	private ContactDao conDao;

	@Override
	public int contactSend(Contact contact) {
		return conDao.contactSend(contact);
	}

	@Override
	public int getAdminListCount() {
		return conDao.adminListCount();
	}

	@Override
	public List<HelpCenter> adminSelectList(HashMap<String, Object> map) {
		return conDao.adminSelectList(map);
	}

	@Override
	public Contact selectOne(int contactno) {
		return conDao.adminSelectOne(contactno);
	}

	@Override
	public int adminAnswer(int contactno) {
		return conDao.adminAnswer(contactno);
	}
}
