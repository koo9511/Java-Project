package com.kh.danim.helper.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.danim.help.model.vo.Help;
import com.kh.danim.helper.model.dao.HelperDao;
import com.kh.danim.helper.model.vo.Helper;

@Service("helperService")
public class HelperServiceImpl implements HelperService{

	@Autowired
	private HelperDao helperDao;
	
	@Override
	public int insertHelper(Helper helper) {
		return helperDao.insertHelper(helper);
	}

	@Override
	public int listCount(HashMap<String, Object> map) {
		return helperDao.listCount(map);
	}

	@Override
	public List<Helper> selectHelperList(HashMap<String, Object> map) {
		return helperDao.selectHelperList(map);
	}

	@Override
	public Helper helperCount(String userid) {
		return helperDao.helperCount(userid);
	}

	@Override
	public Helper helperDetail(int helperno) {
		return helperDao.helperDetail(helperno);
	}

	@Override
	public int helperDelete(int helperno) {
		return helperDao.helperDelete(helperno);
	}

	@Override
	public int helperUpdate(Helper helper) {
		return helperDao.helperUpdate(helper);
	}

	@Override
	public int howMuch(String loginid) {
		return helperDao.howMuch(loginid);
	}
	

}
