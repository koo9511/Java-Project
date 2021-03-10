package com.kh.danim.key.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.danim.key.model.dao.EmailKeyDao;
import com.kh.danim.key.model.vo.EmailKey;

@Service("keyService")
public class EmailKeyServiceImpl implements EmailKeyService{
	
	@Autowired
	private EmailKeyDao keyDao;

	@Override
	public int insertKey(String key) {
		return keyDao.insertKey(key);
	}

	@Override
	public EmailKey keyCheck(String key) {
		return keyDao.keyCheck(key);
	}

	@Override
	public void keyDelete(String key) {
		keyDao.keyDelete(key);
		
	}
	
}
