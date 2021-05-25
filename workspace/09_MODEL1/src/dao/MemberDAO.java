package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
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
	
	/* 3. 로그인 */
	public MemberDTO login(MemberDTO dto) { // login.jsp에서 받아온 dto
		MemberDTO member = null;
		
		try {
			if(con == null)
				con = DBConnector.getInstance().getConnection();
			sql = "SELECT no, id, pw, name, email, regdate FROM member WHERE id = ? AND pw = ? ";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPw());
			
			rs = ps.executeQuery();
			if (rs.next()) {
				member = new MemberDTO();
				member.setNo(rs.getLong(1));
				member.setId(rs.getString(2));
				member.setPw(rs.getString(3));
				member.setName(rs.getString(4));
				member.setEmail(rs.getString(5));
				member.setRegdate(rs.getDate(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnector.close(ps, rs);
		}
		
		return member;
	}
	
	/* 4. 비밀번호 변경 */
	public int updatePw(MemberDTO dto) { // pwChange.jsp에서 받아온 dto
		int res = 0;
		
		try {
			if(con == null)
				con = DBConnector.getInstance().getConnection();
			sql = "UPDATE member SET pw = ? WHERE no = ?";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getPw());
			ps.setLong(2, dto.getNo());
			
			res = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnector.close(ps, null);
		}
		
		return res;
	}
	
	/* 5. 회원정보 변경 */
	public int updateMyPage(MemberDTO dto) { // myChange.jsp에서 받아온 dto
		int res = 0;
		
		try {
			if(con == null)
				con = DBConnector.getInstance().getConnection();
			sql = "UPDATE member SET name = ? , email = ? WHERE no = ?";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getEmail());
			ps.setLong(3, dto.getNo());
			
			res = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnector.close(ps, null);
		}
		
		return res;
	}
	
	/* 6. 회원 탈퇴 */
	public int deleteMember(long no) {
		int res = 0;
		
		try {
			if(con == null)
				con = DBConnector.getInstance().getConnection();
			sql = "DELETE FROM member WHERE no = ?";
			
			ps = con.prepareStatement(sql);
			ps.setLong(1, no);
			
			res = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnector.close(ps, null);
		}
		
		return res;
	}
	
	/* 7. 회원 정보 불러오기 */
	public List<MemberDTO> memberList() { // memberList.jsp 요청
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		
		try {
			if(con == null)
				con = DBConnector.getInstance().getConnection();
			sql = "SELECT no, id, pw, name, email, regdate FROM member";
			
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setNo(rs.getLong(1));
				dto.setId(rs.getString(2));
				dto.setPw(rs.getString(3));
				dto.setName(rs.getString(4));
				dto.setEmail(rs.getString(5));
				dto.setRegdate(rs.getDate(6));
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnector.close(ps, rs);
		}
		
		return list;
	}
}
