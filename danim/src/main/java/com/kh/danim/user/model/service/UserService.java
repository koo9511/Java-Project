package com.kh.danim.user.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.danim.help.model.vo.Help;
import com.kh.danim.user.model.vo.Chatting;
import com.kh.danim.user.model.vo.User;

public interface UserService {
	
	User loginCheck(User user);

	int insertUser(User user);

	User selectUser(String userid);

	int kinsertUser(User user);

	int updateUser(User user);

	int userPassUpdate(User user);

	User nicknameCheck(String nickname);

	User phoneCheck(String phone);

	int selectAllUsers();

	int addBlack(String userid);

	int useCoin(User user2);
	
    //남규쓰 코인사용
	int updateMoney(User user2);

	//남규쓰 event db꺼내러감
	User searchevent(String userid);

	//남규쓰 event db넣으러감
	void updateEvent(User user);
	
	//남규쓰 change view 에서 money 찾으러 감
	User searchmoney(String userid);

	int delBlack(String userid);

	User idCheck(String userid);

	int getListCount(String userid);

	int getsuccessCount(String userid);

	List<Help> selectList(HashMap<String, Object> map);

	Help selectHelp(int helpno);

	List<Help> selectList1(String userid);

	Chatting selectChat(int helpno);

	int inputText(Chatting chat);

	int updateText(Chatting reChat);

	int contentCheck(Chatting chat);

}
