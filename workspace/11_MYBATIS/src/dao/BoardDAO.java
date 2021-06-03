package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.BoardDTO;
import mybatis.config.DBService;

public class BoardDAO {

	/* field */
	final String NAMESPACE = "mybatis.mapper.board.";
	private SqlSessionFactory factory;

	/* single-ton */
	private BoardDAO() {
		factory = DBService.getInstance().getFactory();
	}
	private static BoardDAO instance = new BoardDAO();
	public static BoardDAO getInstance() {
		if(instance == null)
			instance = new BoardDAO();
		return instance;
	}
	
	/* 1. 개시글 작성 */
	public int insert(BoardDTO dto) {
		SqlSession session = factory.openSession(false); // insert 후 수동 커밋하겠다.
		int result = session.insert(NAMESPACE + "insertBoard",dto);
		if (result > 0) {
			session.commit();
		}
		session.close();
		return result;
	}
	
	/* 2. 개시글 개수 */
	public int getTotalRecord() {
		SqlSession session = factory.openSession();
		int totalRecord = session.selectOne(NAMESPACE + "getTotalRecord");
		session.close();
		return totalRecord;
	}
	
	/* 3. 개시글 불러오기 */
	public List<BoardDTO> selectList(Map<String, Integer> map) {
		SqlSession session = factory.openSession();
		List<BoardDTO> list = session.selectList(NAMESPACE + "selectList", map);
		session.close();
		return list;
	}
	
	/* 4. 기존 댓글 groupord UPDATE */
	public void increaseGroupordPreviousReply(long groupno) {
		SqlSession session = factory.openSession(false); // insert 후 수동 커밋하겠다.
		int result = session.update(NAMESPACE + "increaseGroupordPreviousReply", groupno);
		if (result > 0) {
			session.commit();
		}
		session.close();
	}
	
	/* 5. 댓글 작성 */
	public int insertReply(BoardDTO dto) {
		SqlSession session = factory.openSession(false); // insert 후 수동 커밋하겠다.
		int result = session.insert(NAMESPACE + "insertReply",dto);
		if (result > 0) {
			session.commit();
		}
		session.close();
		return result;
	}
	
	/* 6. 찾는 개시글 개수 */
	public int findTotalRecord(Map<String, Object> map) {
		SqlSession session = factory.openSession();
		int totalRecord = session.selectOne(NAMESPACE + "findTotalRecord", map);
		session.close();
		return totalRecord;
	}
	
	/* 7. 찾는 개시글 불러오기 */
	public List<BoardDTO> findList(Map<String, Object> map) {
		SqlSession session = factory.openSession();
		List<BoardDTO> list = session.selectList(NAMESPACE + "findList", map);
		session.close();
		return list;
	}
	
	/* 8. 개시글 삭제 처리 */
	public int delete(long no) {
		SqlSession session = factory.openSession(false);
		int result = session.update(NAMESPACE + "delete", no);
		if(result > 0)
			session.commit();
		session.close();
		return result;
	}
	
	/* 9. 대댓글 목록 */
	public List<BoardDTO> selectList3(Map<String, Integer> map) {
		SqlSession session = factory.openSession();
		List<BoardDTO> list = session.selectList(NAMESPACE + "selectList3", map);
		session.close();
		return list;
	}

	/* 10. 대댓글 groupord UPDATE */
	public void increaseGroupordPreviousReply3(BoardDTO dto) {
		SqlSession session = factory.openSession(false); // insert 후 수동 커밋하겠다.
		int result = session.update(NAMESPACE + "increaseGroupordPreviousReply3", dto);
		if (result > 0) {
			session.commit();
		}
		session.close();
	}

	/* 11. 댓글 작성 */
	public int insertReply3(BoardDTO dto) {
		SqlSession session = factory.openSession(false); // insert 후 수동 커밋하겠다.
		int result = session.insert(NAMESPACE + "insertReply3",dto);
		if (result > 0) {
			session.commit();
		}
		session.close();
		return result;
	}
	
}
