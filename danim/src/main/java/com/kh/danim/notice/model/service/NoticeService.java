package com.kh.danim.notice.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.danim.notice.model.vo.Notice;

public interface NoticeService {

	int getListCount();

	List<Notice> selectList(HashMap<String, Object> map);

	Notice noticeDtail(int nnum);

	int deleteNotice(int noticeno);

	int insertNotice(Notice notice);

	int updateNotice(Notice notice);

}
