package com.kh.danim.helpcenter.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.danim.helpcenter.model.vo.HelpCenter;

public interface HelpCenterService {

	int helpcenterInsert(HelpCenter helpcenter);

	int getListCount(String userid);

	List<HelpCenter> selectList(HashMap<String, Object> map);

	HelpCenter selectOne(int helpcenterno);

	int getAdminListCount();

	List<HelpCenter> adminSelectList(HashMap<String, Object> map);

	int adminAnswer(int helpcenterno);

}
