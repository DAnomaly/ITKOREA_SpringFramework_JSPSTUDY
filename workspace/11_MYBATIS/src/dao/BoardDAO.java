package dao;

import java.util.ArrayList;
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
		return list;
	}
	
	
}
