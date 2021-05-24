package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import db.util.DBConnector;
import dto.MemberDTO;

public class MemberDAO {
	
	// singleton
	private static MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstance() {
		if (instance == null)
			instance = new MemberDAO();
		return instance;
	}
	
	// field
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private String sql = null;
	
	private MemberDAO() { con = DBConnector.getInstance().getConnection(); }
	
	/* 1. 회원가입 */
	public int save(MemberDTO dto) { // join.jsp가 전달한 dto
		int result = 0;
		try {
			if(con == null)
				con = DBConnector.getInstance().getConnection();
			sql = "INSERT INTO MEMBER VALUES (MEMBER_SEQ.NEXTVAL, ?, ?, ?, ?, SYSDATE)";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPw());
			ps.setString(3, dto.getName());
			ps.setString(4, dto.getEmail());
			
			result = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnector.close(ps, null);
		}
		
		return result;
	};
	
	/* 2. 아이디 중복확인*/
	public boolean isUsableId(String id) {
		boolean res = false;
		
		try {
			if(con == null)
				con = DBConnector.getInstance().getConnection();
			sql = "SELECT id FROM member WHERE id = ?";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			if (!rs.next()) { // 검색결과 rs가 없으면 중복이 없으므로 가입이 가능하다.
				res = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnector.close(ps, rs);
		}
		return res;
	}
}
