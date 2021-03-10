package com.kh.danim.helpcenter.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.danim.helpcenter.model.dao.HelpCenterDao;
import com.kh.danim.helpcenter.model.vo.HelpCenter;

@Service("helpcenterService")
public class HelpCenterServiceImpl implements HelpCenterService{
	
	@Autowired
	private HelpCenterDao helpcenterDao;

	@Override
	public int helpcenterInsert(HelpCenter helpcenter) {
		return helpcenterDao.helpcenterInsert(helpcenter);
	}

	@Override
	public int getListCount(String userid) {
		return helpcenterDao.mycenterList(userid);
	}

	@Override
	public List<HelpCenter> selectList(HashMap<String, Object> map) {
		return helpcenterDao.selectList(map);	
	}

	@Override
	public HelpCenter selectOne(int helpcenterno) {
		return helpcenterDao.selectOne(helpcenterno);
	}

	@Override
	public int getAdminListCount() {
		return helpcenterDao.adminCenterList();
	}

	@Override
	public List<HelpCenter> adminSelectList(HashMap<String, Object> map) {
		return helpcenterDao.adminSelectList(map);
	}

	@Override
	public int adminAnswer(int helpcenterno) {
		return helpcenterDao.adminAnswer(helpcenterno);
	}

}
