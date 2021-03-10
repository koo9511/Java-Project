package com.kh.danim.user.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.danim.help.model.vo.Help;
import com.kh.danim.user.model.dao.UserDao;
import com.kh.danim.user.model.vo.Chatting;
import com.kh.danim.user.model.vo.User;

@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao userDao;

	@Override
	public int insertUser(User user) {
		return userDao.userInsert(user);
	}

	@Override
	public User loginCheck(User user) {
		return userDao.loginCheck(user);
	}

	@Override
	public User selectUser(String userid) {
		return userDao.selectUser(userid);
	}

	@Override
	public int kinsertUser(User user) {
		return userDao.kuserInsert(user);
	}

	@Override
	public int updateUser(User user) {
		return userDao.userUpdate(user);
	}

	@Override
	public int userPassUpdate(User user) {
		return userDao.userPassUpdate(user);
	}

	@Override
	public User nicknameCheck(String nickname) {
		return userDao.nicknameCheck(nickname);
	}

	@Override
	public User phoneCheck(String phone) {
		return userDao.phoneCheck(phone);
	}

	@Override
	public int selectAllUsers() {
		return userDao.selectAllUsers();
	}

	@Override
	public int addBlack(String userid) {
		return userDao.addBlack(userid);
	}

	@Override
	public int delBlack(String userid) {
		return userDao.delBlack(userid);
	}

	@Override
	public User idCheck(String userid) {
		return userDao.idCheck(userid);
	}

	@Override
	public int getListCount(String userid) {
		return userDao.listCount(userid);
	}

	@Override
	public int getsuccessCount(String userid) {
		return userDao.successCount(userid);
	}

	@Override
	public List<Help> selectList(HashMap<String, Object> map) {
		return userDao.selectList(map);
	}
	
	@Override
	public List<Help> selectList1(String userid) {
		return userDao.selectList1(userid);
	}
	
	@Override
	public Help selectHelp(int helpno) {
		return userDao.selectHelp(helpno);
	}
	

	@Override
	public Chatting selectChat(int helpno) {
		return userDao.selectChat(helpno);
	}
	
	@Override
	public int inputText(Chatting chat) {
		return userDao.inputText(chat);
	}
	
	@Override
	public int updateText(Chatting reChat) {
		return userDao.updateText(reChat);
	}
	
	@Override
	public int contentCheck(Chatting chat) {
		return userDao.contentCheck(chat);
	}

	//남규쓰 잡업 코인 사용
		@Override
		public int useCoin(User user2) {
			return userDao.userCoin(user2);
		}
		
		//남규쓰 event db꺼내러감
		@Override
		public User searchevent(String userid) {
			return userDao.searchevent(userid);
		}

		//남규쓰 event db넣으러감
		@Override
		public void updateEvent(User user) {
			userDao.updateEvent(user);
		}
		//남규쓰 change view 에서 money 찾으러 감
		@Override
		public User searchmoney(String userid) {
			return userDao.searchmoney(userid);
		}

		// 남규쓰 작업 코인 충전
		   @Override
		   public int updateMoney(User user2) {
		      return userDao.updateMoney(user2);
		   }

		
		

		

}
