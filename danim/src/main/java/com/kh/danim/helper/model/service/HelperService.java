package com.kh.danim.helper.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.danim.help.model.vo.Help;
import com.kh.danim.helper.model.vo.Helper;

public interface HelperService {

	int insertHelper(Helper helper);

	int listCount(HashMap<String, Object> map);

	List<Helper> selectHelperList(HashMap<String, Object> map);

	Helper helperCount(String userid);

	Helper helperDetail(int helperno);

	int helperDelete(int helperno);

	int helperUpdate(Helper helper);

	int howMuch(String loginid);


}
