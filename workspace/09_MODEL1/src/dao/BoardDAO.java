package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import db.util.DBConnector;
import dto.BoardDTO;
import dto.PageVO;

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
	public List<BoardDTO> selectAll(PageVO vo){ // boardList.jsp
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		
		try {
			sql = "SELECT b.idx, b.author, b.title, b.content, b.hit, b.postdate " + 
				  "  FROM ( SELECT ROWNUM AS record, a.idx, a.author, a.title, a.content, a.hit, a.postdate " + 
				  "           FROM ( SELECT idx, author, title, content, hit, postdate " + 
				  "                    FROM board" + 
				  "                   ORDER BY idx DESC ) a ) b " + 
				  " WHERE b.record BETWEEN ? AND ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, vo.getBeginRecord());
			ps.setInt(2, vo.getEndRecord());
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
			DBConnector.close(ps, null);
		}
	}
	
	/* 5. 게시글 삭제 */
	public int deleteBoard(long idx, String id) { // delete.jsp
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
			DBConnector.close(ps, null);
		}
		
		return res;
	}
	
	/* 6. 개시글 수정 */
	public int updateBoard(BoardDTO dto) { // update.jsp
		int res = 0;
		try {
			sql = "UPDATE board SET title = ?, content = ?, postdate = sysdate WHERE idx = ? AND author = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getContent());
			ps.setLong(3, dto.getIdx());
			ps.setString(4, dto.getAuthor());
			
			res = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnector.close(ps, null);
		}
		return res;
	}
	
	/* 7. 전체 개시글의 개수 반환 */
	public int getTotalRecord() { // boardList.jsp
		int cnt = 0;
		try {
			sql = "SELECT COUNT(idx) FROM board";
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			if(rs.next())
				cnt = rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnector.close(ps, rs);
		}
		
		return cnt;
	}
	
}
