package com.kh.danim.admin.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.danim.admin.model.dao.AdminDao;
import com.kh.danim.admin.model.vo.Admin;
import com.kh.danim.notice.model.vo.Notice;

@Service("adminService")
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDao adminDao;
	
	@Override
	public Admin selectAdmin(String adminid) {
		return adminDao.selectAdmin(adminid);
	}

	@Override
	public int getListCount() {
		return adminDao.getListCount();
	}

	@Override
	public List<Notice> selectList(HashMap<String, Object> map) {
		return adminDao.selectList(map);
	}
}
