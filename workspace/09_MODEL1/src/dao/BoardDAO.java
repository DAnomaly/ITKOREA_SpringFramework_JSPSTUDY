package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import db.util.DBConnector;
import dto.BoardDTO;

public class BoardDAO {

	// singleton
	private static BoardDAO instance = new BoardDAO();
	
	public static BoardDAO getInstance() {
		if (instance == null)
			instance = new BoardDAO();
		return instance;
	}

	// field
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private String sql = null;

	// constructor
	public BoardDAO() {
		con = DBConnector.getInstance().getConnection();
	}
	
	/* 1. 개시글 삽입 */
	public int insertBoard(BoardDTO dto) { // insert.jsp
		int res = 0;
		
		try {
			sql = "INSERT INTO BOARD VALUES (BOARD_SEQ.NEXTVAL, ?, ?, ?, 0, SYSDATE)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getAuthor());
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getContent());
			res = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnector.close(ps, rs);
		}
		
		return res;
	}
	
	/* 2. 개시글 리스트 */
	public List<BoardDTO> selectAll(){ // boardList.jsp
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		
		try {
			sql = "SELECT idx, author, title, content, hit, postdate FROM board ORDER BY postdate DESC";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setIdx(rs.getLong(1));
				dto.setAuthor(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setHit(rs.getInt(5));
				dto.setPostdate(rs.getDate(6));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnector.close(ps, rs);
		}
		
		return list;
	}
	
	/* 3. 개시글 보기 */
	public BoardDTO selectOne(long idx) { // veiwPage.jsp
		BoardDTO dto = new BoardDTO();
		
		try {
			sql = "SELECT idx, author, title, content, hit, postdate FROM board WHERE idx = ?";
			ps = con.prepareStatement(sql);
			ps.setLong(1, idx);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				dto.setIdx(rs.getLong(1));
				dto.setAuthor(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setHit(rs.getInt(5));
				dto.setPostdate(rs.getDate(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnector.close(ps, rs);
		}
		
		return dto;
	}
	
	/* 4. 조회수 증가 */
	public void updateHit(long idx) {
		try {
			sql = "UPDATE board SET hit = hit + 1 WHERE idx = ?";
			ps = con.prepareStatement(sql);
			ps.setLong(1, idx);
			
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnector.close(ps, rs);
		}
	}
	
	/* 5. 게시글 삭제*/
	public int deleteBoard(long idx, String id) {
		int res = 0;
		
		try {
			sql = "DELETE FROM board WHERE idx = ? AND author = ?";
			ps = con.prepareStatement(sql);
			ps.setLong(1, idx);
			ps.setString(2, id);
			
			res = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnector.close(ps, rs);
		}
		
		return res;
	}
	
}
