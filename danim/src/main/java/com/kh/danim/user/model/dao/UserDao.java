package com.kh.danim.user.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.danim.help.model.vo.Help;
import com.kh.danim.user.model.vo.Chatting;
import com.kh.danim.user.model.vo.User;

@Repository("userDao")
public class UserDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public User loginCheck(User user) {
		return sqlSession.selectOne("userMapper.loginCheck", user);
	}


	public int userInsert(User user) {
		return sqlSession.insert("userMapper.userInsert", user);
	}


	public User selectUser(String userid) {
		return sqlSession.selectOne("userMapper.userSelect", userid);
	}


	public int kuserInsert(User user) {
		return sqlSession.insert("userMapper.kuserInsert", user);
	}


	public int userUpdate(User user) {
		return sqlSession.update("userMapper.userUpdate", user);
	}


	public int userPassUpdate(User user) {
		return sqlSession.update("userMapper.userPassUpdate", user);
	}


	public User nicknameCheck(String nickname) {
		return sqlSession.selectOne("userMapper.nicknameCheck", nickname);
	}


	public User phoneCheck(String phone) {
		return sqlSession.selectOne("userMapper.phoneCheck", phone);
	}


	public int selectAllUsers() {
		return sqlSession.selectOne("userMapper.selectAllUsers");
	}


	public int addBlack(String userid) {
		return sqlSession.update("userMapper.addBlack", userid);
	}
	
	public int updateMoney(User user2) {
	      return sqlSession.update("userMapper.updateMoney", user2);
	   }

	public int delBlack(String userid) {
		return sqlSession.update("userMapper.delBlack", userid);
	}


	public User idCheck(String userid) {
		return sqlSession.selectOne("userMapper.idCheck", userid);
	}


	public int listCount(String userid) {
		return sqlSession.selectOne("userMapper.listCount", userid);
	}


	public int successCount(String userid) {
		return sqlSession.selectOne("userMapper.successCount", userid);
	}


	public List<Help> selectList(HashMap<String, Object> map) {
		return sqlSession.selectList("userMapper.selectList", map);
	}
	
	public List<Help> selectList1(String userid) {
		return sqlSession.selectList("userMapper.selectList1", userid);
	}
	
	public Help selectHelp(int helpno) {
		return sqlSession.selectOne("userMapper.selectHelp",helpno);
	}
	
	public Chatting selectChat(int helpno) {
		return sqlSession.selectOne("userMapper.selectChat",helpno);
	}
	
	public int inputText(Chatting chat) {
		return sqlSession.update("userMapper.inputText",chat);
	}

	public int updateText(Chatting reChat) {
		return sqlSession.update("userMapper.updateText",reChat);
	}

	public int contentCheck(Chatting chat) {
		return sqlSession.selectOne("userMapper.contentCheck",chat);
	}
	
	//남규쓰 작업 코인 사용
	   public int userCoin(User user2) {
	      return sqlSession.update("userMapper.useCoin", user2);
	   }

	   //남규쓰 event db꺼내러감
	   public User searchevent(String userid) {
	      return sqlSession.selectOne("userMapper.searchevent", userid);
	   }


	   public void updateEvent(User user) {
	      sqlSession.update("userMapper.updateEvent", user);
	   }


	   public User searchmoney(String userid) {
	      return sqlSession.selectOne("userMapper.searchmoney",userid);
	   }




	


	

	



}
