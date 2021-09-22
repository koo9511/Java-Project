package com.find.service;

import com.find.vo.Email_cert;
import com.find.vo.User_info;

public interface UserService {

	// 이메일 인증 키 저장
	int insertCertKey(Email_cert cert_info);

	// 유저 아이디 중복체크
	int selectUserId(String to_email);
	
	// 이메일 인증 키 유효 체크
	int selectCertCheck(Email_cert certVO);

	// 유저 코드 중복 검사
	int selectUserCode(String userCode);

	// 회원가입
	int addUserInfo(User_info userVO);

	// 유저 정보 가져오기
	User_info selectUserInfo(String user_id);


}
