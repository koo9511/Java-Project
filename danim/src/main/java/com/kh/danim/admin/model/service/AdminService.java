package com.kh.danim.admin.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.danim.admin.model.vo.Admin;
import com.kh.danim.notice.model.vo.Notice;

public interface AdminService {

	Admin selectAdmin(String adminid);

	int getListCount();

	List<Notice> selectList(HashMap<String, Object> map);

}
