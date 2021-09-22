package com.find.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.find.dao.UserDao;
import com.find.vo.Email_cert;
import com.find.vo.User_info;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;

	@Override
	public int insertCertKey(Email_cert cert_info) {
		return userDao.insertCertKey(cert_info);
	}

	@Override
	public int selectUserId(String to_email) {
		return userDao.selectUserId(to_email);
	}

	@Override
	public int selectCertCheck(Email_cert certVO) {
		return userDao.selectCertCheck(certVO);
	}

	@Override
	public int selectUserCode(String userCode) {
		return userDao.selectUserCode(userCode);
	}

	@Override
	public int addUserInfo(User_info userVO) {
		return userDao.addUserInfo(userVO);
	}

	@Override
	public User_info selectUserInfo(String user_id) {
		return userDao.selectUserInfo(user_id);
	}
	
}
