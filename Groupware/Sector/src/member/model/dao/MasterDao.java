package member.model.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import member.model.vo.Master;

public class MasterDao {
	public MasterDao() {}
	
	public Master loginCheck(Connection conn, String masterId, String masterPwd) {
		Master master = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from master where master_id = ? and master_pwd = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, masterId);
			pstmt.setString(2, masterPwd);

			rset = pstmt.executeQuery();

			if(rset.next()){
				master = new Master();

				master.setMasterComNo(rset.getInt("master_com_no"));
				master.setMasterId(masterId);
				master.setMasterPwd(masterPwd);
				master.setMasterName(rset.getString("master_name"));
				master.setMasterComName(rset.getString("master_com_name"));	
				master.setMasterPhone(rset.getString("master_phone"));
				master.setMasterEmail(rset.getString("master_email"));
				master.setMaster(rset.getString("master"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return master;
	}
	
	public Master kakaologinCheck(Connection conn, String email) {
		Master master = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from master where master_email = ? ";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			

			rset = pstmt.executeQuery();

			if(rset.next()){
				master = new Master();

				master.setMasterComNo(rset.getInt("master_com_no"));
				master.setMasterId(rset.getString("master_id"));
				master.setMasterPwd(rset.getString("master_pwd"));
				master.setMasterName(rset.getString("master_name"));
				master.setMasterComName(rset.getString("master_com_name"));
				master.setMasterPhone(rset.getString("master_phone"));
				master.setMasterEmail(email);
				master.setMaster(rset.getString("master"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return master;
	}
	


	public int insertMaster(Connection conn, Master master) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into master values (mcn.nextval, ?, ?, ?, 'noname', ?, ?, default)";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, master.getMasterId());
			pstmt.setString(2, master.getMasterPwd());
			pstmt.setString(3, master.getMasterName());
//			pstmt.setString(4, master.getMasterNo());
			pstmt.setString(4, master.getMasterPhone());
			pstmt.setString(5, master.getMasterEmail());
			
			System.out.println(master.getMasterId());
			System.out.println(master.getMasterPwd());
			System.out.println(master.getMasterName());
			System.out.println(master.getMasterPhone());
			System.out.println(master.getMasterEmail());
			
			result = pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int updateMaster(Connection conn, Master master) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "update master set master_pwd=?, master_phone=?, master_com_name=? where master_id=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, master.getMasterPwd());
			pstmt.setString(2, master.getMasterPhone());
			pstmt.setString(3, master.getMasterComName());
			pstmt.setString(4, master.getMasterId());
			
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
		public int searchUpdate(Connection conn, Master master) {
			int result = 0;
			PreparedStatement pstmt = null;
	
			String query = "update master set master_pwd=? where master_id=?";
			
			try {
				pstmt = conn.prepareStatement(query);
				
				pstmt.setString(1, master.getMasterPwd());
				pstmt.setString(2, master.getMasterId());
				
				result = pstmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}


	public int idCheck(String id){
		int result = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try{
		 String sql = "select * from master where master_id=?";
		 pstmt = conn.prepareStatement(sql);
		 pstmt.setString(1, id);
		 rset = pstmt.executeQuery();
		 if(rset.next()){
			 result += 1;
		 }
//		 System.out.println("???????????? ????????? ?????? : " + result);
		}catch(Exception e){
		 e.printStackTrace();
		}finally{
		 close(rset);
		 close(pstmt);
		 close(conn);
		}
		return result;
	   }

	public int emailCheck(String email) {
		int result = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try{
		 String sql = "select * from master where master_email=?";
		 pstmt = conn.prepareStatement(sql);
		 pstmt.setString(1, email);
		 rset = pstmt.executeQuery();
		 if(rset.next()){
			 result += 1;
		 }
//		 System.out.println("???????????? ????????? ?????? : " + result);
		}catch(Exception e){
		 e.printStackTrace();
		}finally{
		 close(rset);
		 close(pstmt);
		 close(conn);
		}
		return result;
	   
	}

	public Master loginCheck(Connection conn, String sname, String semail, String sphone) {
		Master master = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from master where master_name = ? and master_email = ? and master_phone = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, sname);
			pstmt.setString(2, semail);
			pstmt.setString(3, sphone);

			rset = pstmt.executeQuery();

			if(rset.next()){
				master = new Master();

				master.setMasterComNo(rset.getInt("master_com_no"));
				master.setMasterId(rset.getString("master_id"));
				master.setMasterPwd(rset.getString("master_pwd"));
				master.setMasterName(rset.getString("master_name"));
				master.setMasterComName(rset.getString("master_com_name"));	
				master.setMasterPhone(rset.getString("master_phone"));
				master.setMasterEmail(rset.getString("master_email"));
				master.setMaster(rset.getString("master"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return master;
	}

	public Master passwordCheck(Connection conn, String sid, String sname, String semail) {
		Master master = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from master where master_id = ? and master_name = ? and master_email = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, sid);
			pstmt.setString(2, sname);
			pstmt.setString(3, semail);

			rset = pstmt.executeQuery();

			if(rset.next()){
				master = new Master();

				master.setMasterComNo(rset.getInt("master_com_no"));
				master.setMasterId(rset.getString("master_id"));
				master.setMasterPwd(rset.getString("master_pwd"));
				master.setMasterName(rset.getString("master_name"));
				master.setMasterComName(rset.getString("master_com_name"));	
				master.setMasterPhone(rset.getString("master_phone"));
				master.setMasterEmail(rset.getString("master_email"));
				master.setMaster(rset.getString("master"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return master;
	}

	
	

}


//	public int juminCheck(String checkno) {
//		int result = 0;
//		Connection conn = getConnection();
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		
//		try{
//		 String sql = "select * from master where master_no=?";
//		 pstmt = conn.prepareStatement(sql);
//		 pstmt.setString(1, checkno);
//		 rset = pstmt.executeQuery();
//		 if(rset.next()){
//			 result += 1;
//		 }
//		 System.out.println(result);
//		}catch(Exception e){
//		 e.printStackTrace();
//		}finally{
//		 close(rset);
//		 close(pstmt);
//		 close(conn);
//		}
//		return result;
//	   }