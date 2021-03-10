package com.kh.danim.notice.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.danim.notice.model.dao.NoticeDao;
import com.kh.danim.notice.model.vo.Notice;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	public NoticeDao noticeDao;

	@Override
	public int getListCount() {
		return noticeDao.getListCount();
	}

	@Override
	public List<Notice> selectList(HashMap<String, Object> map) {
		return noticeDao.selectList(map);
	}

	@Override
	public Notice noticeDtail(int nnum) {
		return noticeDao.noticeDetail(nnum);
	}

	@Override
	public int deleteNotice(int noticeno) {
		return noticeDao.noticeDelete(noticeno);
	}

	@Override
	public int insertNotice(Notice notice) {
		return noticeDao.noticeInsert(notice);
	}

	@Override
	public int updateNotice(Notice notice) {
		return noticeDao.noticeUpdate(notice);
	}

}
