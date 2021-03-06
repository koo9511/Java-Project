package member.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import member.model.dao.MasterDao;
import member.model.vo.Master;

public class MasterService {
	
	private MasterDao mdao = new MasterDao();
	
	public MasterService() {}

	public Master loginCheck(String masterId, String masterPwd) {
		
		Connection conn = getConnection();
		Master loginMaster = mdao.loginCheck(conn, masterId, masterPwd);
		close(conn);
		
		return loginMaster;
	}

	public Master kakaologinCheck(String email) {
		Connection conn = getConnection();
		Master loginMaster = mdao.kakaologinCheck(conn, email);
		close(conn);
		
		return loginMaster;
	}

	public int insertMaster(Master master) {
		Connection conn = getConnection();
		int result = mdao.insertMaster(conn, master);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	public int updateMaster(Master master) {
		Connection conn = getConnection();
		int result = mdao.updateMaster(conn, master);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	public int searchUpdate(Master master) {
		Connection conn = getConnection();
		int result = mdao.searchUpdate(conn, master);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public int ldCheck(String checkid) {
		Connection conn = getConnection();
		int result = mdao.idCheck(checkid);
		
		System.out.println(result);
		
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		
		close(conn);
		
		return result;
	}
//
//	public int juminCheck(String checkno) {
//		Connection conn = getConnection();
//		int result = mdao.juminCheck(checkno);
//		
//		System.out.println(result);
//		
//		if(result > 0)
//			commit(conn);
//		else
//			rollback(conn);
//		
//		close(conn);
//		
//		return result;
//	}

	public int eamilCheck(String email) {
		Connection conn = getConnection();
		int result = mdao.emailCheck(email);
		
		System.out.println(result);
		
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		
		close(conn);
		
		return result;
	}

	public Master searchId(String sname, String semail, String sphone) {
		Connection conn = getConnection();
		Master searchMaster = mdao.loginCheck(conn, sname, semail, sphone);
		close(conn);
		
		return searchMaster;
	}

	public Master searchPwd(String sid, String sname, String semail) {
		Connection conn = getConnection();
		Master searchMaster = mdao.passwordCheck(conn, sid, sname, semail);
		close(conn);
		return searchMaster;
	}

	

	
	

	
}
