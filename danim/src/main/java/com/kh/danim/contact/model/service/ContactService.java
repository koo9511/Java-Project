package com.kh.danim.contact.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.danim.contact.model.vo.Contact;
import com.kh.danim.helpcenter.model.vo.HelpCenter;

public interface ContactService {

	int contactSend(Contact contact);

	int getAdminListCount();

	List<HelpCenter> adminSelectList(HashMap<String, Object> map);

	Contact selectOne(int contactno);

	int adminAnswer(int contactno);

}
