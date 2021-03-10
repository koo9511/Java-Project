package com.kh.danim.help.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.danim.help.model.dao.HelpDao;
import com.kh.danim.help.model.vo.Help;

@Service("danimService")
public class HelpServiceImpl implements HelpService{
	
	@Autowired
	private HelpDao helpDao;

	@Override
	public int insertHelp(Help help) {
		return helpDao.insertHelp(help);
	}

	@Override
	public List<Help> selectHelpList(HashMap<String, Object> map) {
		return helpDao.selectHelpList(map);
	}

	@Override
	public Help selectOneHelp(int helpno) {
		return helpDao.selectOneHelp(helpno);
	}

	@Override
	public Help helpCount(HashMap<String, Object> map) {
		return helpDao.helpCount(map);
	}

	@Override
	public int listCount(HashMap<String, Object> map) {
		return helpDao.listCount(map);
	}

	@Override
	public int helpDelete(int helpno) {
		return helpDao.helpDelete(helpno);
	}

	@Override
	public int helpUpdate(Help help) {
		return helpDao.helpUpdate(help);
	}

	@Override
	public String getHelperList(int helpno) {
		return helpDao.getHelperList(helpno);
	}

	@Override
	public int setHelperList(HashMap<String, Object> map) {
		return helpDao.setHelperList(map);
	}

	@Override
	public int setHelperId(HashMap<String, Object> map) {
		return helpDao.setHelperId(map);
	}

	@Override
	public int matchingCount(String userid) {
		return helpDao.matchingCount(userid);
	}

	@Override
	public Help selectOneMatching(int helpno) {
		return helpDao.selectOneMatching(helpno);
	}

	@Override
	public void helpAfterDelete() {
		helpDao.helpAfterDelete();
		
	}

	@Override
	public int matchingStatus(HashMap<String, Object> map) {
		return helpDao.matchingStatus(map);
	}

	@Override
	public String cancelStatus(int helpno) {
		return helpDao.cancelStatus(helpno);
	}

	@Override
	public int cancelStatusUpdate(HashMap<String, Object> map) {
		return helpDao.cancelStatusUpdate(map);
	}

	@Override
	public int updateHelpListToHelperId(HashMap<String, Object> map) {
		return helpDao.updateHelpListToHelperId(map);
	}

	@Override
	public int removeHelperId(int helpno) {
		return helpDao.removeHelperId(helpno);
	}

	@Override
	public String matchingStatus(int helpno) {
		return helpDao.matchingStatus(helpno);
	}

	@Override
	public int matchingStatusUpdate(HashMap<String, Object> map) {
		return helpDao.matchingStatusUpdate(map);
	}

	@Override
	public int updateStatusToFinal(int helpno) {
		return helpDao.updateStatusToFinal(helpno);
	}

	@Override
	public int howMuch(String helpid) {
		return helpDao.howmuch(helpid);
	}

	@Override
	public void openChat(HashMap<String, Object> map2) {
		helpDao.openChat(map2);
	}




	


}
