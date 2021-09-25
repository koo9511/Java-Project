package com.find.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.find.vo.Email_cert;
import com.find.vo.MkDir;
import com.find.vo.User_info;

@Repository("userDao")
public class UserDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	// 이베일 인증 정보 저장
	public int insertCertKey(Email_cert cert_info) {
		
		int res = sqlSession.selectOne("userMapper.selectCertKeyValidate",cert_info);
		
		if(res > 0) {
			res = sqlSession.delete("userMapper.deleteCertKey",cert_info.getUser_email());
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
		int res = sqlSession.delete("deleteCertKey",userVO.getUser_id());
		
		String  db_query = "";
		db_query += "CREATE TABLE withu.user_" + userVO.getUser_code() + "_db";
		db_query += "(";
		db_query += "photo_no INT AUTO_INCREMENT PRIMARY KEY NOT NULL COMMENT '게시글 인덱스',";
		db_query += "user_code VARCHAR(12) DEFAULT '" + userVO.getUser_code() + "' COMMENT '유저 고유 코드',";
		db_query += "photo_source VARCHAR(100) COMMENT '게시물 소스',";
		db_query += "photo_title VARCHAR(20) COMMENT '게시물 제목',";
		db_query += "photo_content VARCHAR(300) COMMENT '게시물 내용',";
		db_query += "photo_hashtag VARCHAR(50) COMMENT '게시물 해시태그',";
		db_query += "photo_create_timestamp DATETIME COMMENT '게시물 작성 시간',";
		db_query += "photo_modify_timestamp DATETIME COMMENT '게시물 수정 시간',";
		db_query += "photo_onlyme TINYINT(3) COMMENT '나만 보기'";
		db_query += ")";
		
		sqlSession.update("createUserDataTable",db_query);
		
		res = sqlSession.insert("addUserInfo",userVO);
		new MkDir().makeDirectory(userVO.getUser_code());
		
		
		return res;
	}

	// 유저 정보 가져오기
	public User_info selectUserInfo(String user_id) {
		return sqlSession.selectOne("selectUserInfo", user_id);
	}
	
}