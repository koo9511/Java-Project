package com.find.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.find.vo.Admin;
import com.find.vo.Email_cert;
import com.find.vo.User_info;

@Repository("userDao")
public class UserDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	// 이베일 인증 정보 저장
	public int insertCertKey(Email_cert cert_info) {
		
		int res = sqlSession.selectOne("userMapper.selectCertKeyValidate",cert_info);
		
		if(res > 0) {
			res = sqlSession.delete("userMapper.deleteCertKey",cert_info);
		}
		
		int ret = sqlSession.insert("userMapper.insertCertKeyInfo",cert_info);
		
		return ret;
	}

	// 유저 아이디 중복 검사
	public int selectUserId(String to_email) {
		return sqlSession.selectOne("selectUserId",to_email);
	}

	// 이메일 인증 체크
	public int selectCertCheck(Email_cert certVO) {
		return sqlSession.selectOne("selectCertCheck",certVO);
	}

	// 유저 코드 중복검사
	public int selectUserCode(String userCode) {
		return sqlSession.selectOne("selectUserCodeCount",userCode);
	}

	// 회원가입
	public int addUserInfo(User_info userVO) {
		return sqlSession.insert("addUserInfo",userVO);
	}


}