package com.kh.danim.key.model.service;

import com.kh.danim.key.model.vo.EmailKey;

public interface EmailKeyService {
	int insertKey(String key);

	EmailKey keyCheck(String key);

	void keyDelete(String key);
}
