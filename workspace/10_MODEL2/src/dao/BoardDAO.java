package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import dto.BoardDTO;
import dto.ReplyDTO;

public class BoardDAO {

	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	private String sql;
	
	private static DataSource dataSource;
	
	static {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	//single_ton
	private BoardDAO() {}
	private static BoardDAO instance = new BoardDAO();
	public static BoardDAO getInstance() {
		if(instance == null)
			instance = new BoardDAO();
		return instance;
	}

	/* 1. 접속 해제 */
	private void close(Connection con, PreparedStatement ps, ResultSet rs) {
		try {
			if (con != null) { con.close(); }
			if (ps != null) { ps.close(); }
			if (rs != null) { rs.close(); }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/* 2. 게시글 삽입 */
	public int insertBoard(BoardDTO dto) {
		int result = 0;
		try {
			con = dataSource.getConnection();
			sql = "INSERT INTO BOARD VALUES (BOARD_SEQ.NEXTVAL, ?, ?, ?, 0, ?, ?, 0, SYSDATE, SYSDATE)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getAuthor());
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getContent());
			ps.setString(4, dto.getIp());
			ps.setString(5, dto.getFilename());
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con,ps,null);
		}
		return result;
	}
	
	/* 3. 전체 게시글 개수 구하기 */
	public int getTotalBoardCount() {
		int count = 0;
		try {
			con = dataSource.getConnection();
			sql = "SELECT COUNT(*) FROM BOARD";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next())
				count = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, ps, rs);
		}
		return count;
	}
	
	/* 4. 게시글 목록 반환 */
	public List<BoardDTO> selectList(Map<String,Integer> map){
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			con = dataSource.getConnection();
			sql = "SELECT B.IDX, B.AUTHOR, B.TITLE, B.CONTENT, B.HIT, B.IP, B.FILENAME, B.STATE, B.POSTDATE, B.LASTMODIFIED " + 
				"    FROM (SELECT ROWNUM AS RN, A.IDX, A.AUTHOR, A.TITLE, A.CONTENT, A.HIT, A.IP, A.FILENAME, A.STATE, A.POSTDATE, A.LASTMODIFIED " + 
				"            FROM (SELECT IDX, AUTHOR, TITLE, CONTENT, HIT, IP, FILENAME, STATE, POSTDATE, LASTMODIFIED " + 
				"                    FROM BOARD" + 
				"                   ORDER BY POSTDATE DESC) A) B" + 
				"   WHERE B.RN BETWEEN ? AND ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, map.get("begin"));
			ps.setInt(2, map.get("end"));
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setIdx(rs.getLong(1));
				dto.setAuthor(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setHit(rs.getInt(5));
				dto.setIp(rs.getString(6));
				dto.setFilename(rs.getString(7));
				dto.setState(rs.getInt(8));
				dto.setPostdate(rs.getDate(9));
				dto.setLastmodified(rs.getDate(10));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, ps, rs);
		}
		return list;
	}
	
	/* 5. 개시글 반환 */
	public BoardDTO selectOneBoardByIdx(long idx) {
		BoardDTO dto = null;
		try {
			con = dataSource.getConnection();
			sql = "SELECT IDX, AUTHOR, TITLE, CONTENT, HIT, IP, FILENAME, STATE, POSTDATE, LASTMODIFIED"
			    + "  FROM BOARD"
				+ " WHERE IDX = ?";
			ps = con.prepareStatement(sql);
			ps.setLong(1, idx);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto = new BoardDTO();
				dto.setIdx(rs.getLong(1));
				dto.setAuthor(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setHit(rs.getInt(5));
				dto.setIp(rs.getString(6));
				dto.setFilename(rs.getString(7));
				dto.setState(rs.getInt(8));
				dto.setPostdate(rs.getDate(9));
				dto.setLastmodified(rs.getDate(10));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, ps, rs);
		}
		return dto;
	}

	/* 6. 조회수 증가 */
	public void updateHitBoard(long idx) {
		try {
			con = dataSource.getConnection();
			sql = "UPDATE BOARD SET HIT = HIT + 1 WHERE IDX = ?";
			ps = con.prepareStatement(sql);
			ps.setLong(1, idx);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, ps, null);
		}
	}
	
	/* 7. 검색 결과 개수 반환하기 */
	public int getFindBoardCount(Map<String, Object> map) {
		int count = 0;
		try {
			con = dataSource.getConnection();
			String column = (String)map.get("column");
			sql = "SELECT COUNT(IDX) FROM BOARD WHERE " + column + " LIKE ? ";
			ps = con.prepareStatement(sql);
			ps.setString(1, (String)map.get("query"));
			rs = ps.executeQuery();
			if(rs.next())
				count = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, ps, rs);
		}
		return count;
	}

	/* 8. 검색 게시글 목록 반환 */
	public List<BoardDTO> findList(Map<String, Object> map) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			con = dataSource.getConnection();
			String column = (String)map.get("column");
			sql = "SELECT B.IDX, B.AUTHOR, B.TITLE, B.CONTENT, B.HIT, B.IP, B.FILENAME, B.STATE, B.POSTDATE, B.LASTMODIFIED " + 
				"    FROM (SELECT ROWNUM AS RN, A.IDX, A.AUTHOR, A.TITLE, A.CONTENT, A.HIT, A.IP, A.FILENAME, A.STATE, A.POSTDATE, A.LASTMODIFIED " + 
				"            FROM (SELECT IDX, AUTHOR, TITLE, CONTENT, HIT, IP, FILENAME, STATE, POSTDATE, LASTMODIFIED " + 
				"                    FROM BOARD" + 
				"                   WHERE " + column + " LIKE ? " +
				"                   ORDER BY POSTDATE DESC) A) B" + 
				"   WHERE B.RN BETWEEN ? AND ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, (String)map.get("query"));
			ps.setInt(2, (int)map.get("begin"));
			ps.setInt(3, (int)map.get("end"));
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setIdx(rs.getLong(1));
				dto.setAuthor(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setHit(rs.getInt(5));
				dto.setIp(rs.getString(6));
				dto.setFilename(rs.getString(7));
				dto.setState(rs.getInt(8));
				dto.setPostdate(rs.getDate(9));
				dto.setLastmodified(rs.getDate(10));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, ps, rs);
		}
		return list;
	}
	
	/* 9. 보드 삭제 처리 (UPDATE STATE = -1) */
	public int deleteBoard(long idx, String author) {
		int result = 0;
		try {
			con = dataSource.getConnection();
			sql = "UPDATE BOARD SET STATE = -1 WHERE IDX = ? AND AUTHOR = ?";
			ps = con.prepareStatement(sql);
			ps.setLong(1, idx);
			ps.setString(2, author);
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, ps, null);
		}
		return result;
	}
	
	/* 10. 보드 수정 */
	public int updateBoard(BoardDTO dto) {
		int result = 0;
		try {
			con = dataSource.getConnection();
			if(dto.getFilename() == null || dto.getFilename().isEmpty()) {
				sql = "UPDATE BOARD SET TITLE = ?, CONTENT = ?, IP = ?, LASTMODIFIED = SYSDATE WHERE IDX = ? AND AUTHOR = ?";
				ps = con.prepareStatement(sql);
				ps.setString(1, dto.getTitle());
				ps.setString(2, dto.getContent());
				ps.setString(3, dto.getIp());
				ps.setLong(4, dto.getIdx());
				ps.setString(5, dto.getAuthor());
			} else {
				sql = "UPDATE BOARD SET TITLE = ?, CONTENT = ?, FILENAME = ?, IP = ?, LASTMODIFIED = SYSDATE WHERE IDX = ? AND AUTHOR = ?";
				ps = con.prepareStatement(sql);
				ps.setString(1, dto.getTitle());
				ps.setString(2, dto.getContent());
				ps.setString(3, dto.getFilename());
				ps.setString(4, dto.getIp());
				ps.setLong(5, dto.getIdx());
				ps.setString(6, dto.getAuthor());
			}
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, ps, null);
		}
		return result;
	}
	
	/* 11. 파일삭제 */
	public int deleteFile(long idx, String author) {
		int result = 0;
		try {
			con = dataSource.getConnection();
			sql = "UPDATE BOARD SET FILENAME = NULL WHERE IDX = ? AND AUTHOR = ?";
			ps = con.prepareStatement(sql);
			ps.setLong(1, idx);
			ps.setString(2, author);
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, ps, null);
		}
		return result;
	}
	
	
	/* 12. 뎃글 작성 */
	public int insertReply(ReplyDTO dto) {
		int result = 0;
		try {
			con = dataSource.getConnection();
			sql = "INSERT INTO REPLY VALUES (REPLY_SEQ.NEXTVAL, ?, ?, ?, ?, SYSDATE)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getAuthor());
			ps.setString(2, dto.getContent());
			ps.setString(3, dto.getIp());
			ps.setLong(4, dto.getBoardIdx());
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, ps, null);
		}
		return result;
	}
	
	/* 13. 댓글 개수 확인 */
	public int getReplyCount(long boardIdx) {
		int cnt = 0;
		try {
			con = dataSource.getConnection();
			sql = "SELECT COUNT(IDX) FROM REPLY WHERE BOARD_IDX = ?";
			ps = con.prepareStatement(sql);
			ps.setLong(1, boardIdx);
			rs = ps.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, ps, rs);
		}
		return cnt;
	}
	
	/* 14. 댓글 불러오기 */
	public List<ReplyDTO> selectListReply(long boardIdx) {
		List<ReplyDTO> list = new ArrayList<ReplyDTO>();
		try {
			con = dataSource.getConnection();
			sql = "SELECT IDX, AUTHOR, CONTENT, IP, BOARD_IDX, POSTDATE FROM REPLY WHERE BOARD_IDX = ? ORDER BY IDX DESC";
			ps = con.prepareStatement(sql);
			ps.setLong(1, boardIdx);
			rs = ps.executeQuery();
			while (rs.next()) {
				ReplyDTO dto = new ReplyDTO();
				dto.setIdx(rs.getLong(1));
				dto.setAuthor(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setIp(rs.getString(4));
				dto.setBoardIdx(rs.getLong(5));
				dto.setPostdate(rs.getDate(6));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, ps, rs);
		}
		return list;
	}
	
	/* 15. 댓글 삭제하기 */
	public int deleteReply(long idx) {
		int result = 0;
		try {
			con = dataSource.getConnection();
			sql = "DELETE FROM REPLY WHERE IDX = ?";
			ps = con.prepareStatement(sql);
			ps.setLong(1, idx);
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, ps, null);
		}
		return result;
	}
}
