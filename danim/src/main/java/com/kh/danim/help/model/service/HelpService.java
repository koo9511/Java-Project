package com.kh.danim.help.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.danim.help.model.vo.Help;

public interface HelpService {

	int insertHelp(Help help);

	List<Help> selectHelpList(HashMap<String, Object> map);

	Help selectOneHelp(int helpno);

	Help helpCount(HashMap<String, Object> map);

	int listCount(HashMap<String, Object> map);

	int helpDelete(int helpno);

	int helpUpdate(Help help);

	String getHelperList(int helpno);

	int setHelperList(HashMap<String, Object> map);

	int setHelperId(HashMap<String, Object> map);

	int matchingCount(String userid);

	Help selectOneMatching(int helpno);

	void helpAfterDelete();

	int matchingStatus(HashMap<String, Object> map);

	String cancelStatus(int helpno);

	int cancelStatusUpdate(HashMap<String, Object> map);

	int updateHelpListToHelperId(HashMap<String, Object> map);

	int removeHelperId(int helpno);

	String matchingStatus(int helpno);

	int matchingStatusUpdate(HashMap<String, Object> map);

	int updateStatusToFinal(int helpno);

	int howMuch(String helpid);

	void openChat(HashMap<String, Object> map2);



}
