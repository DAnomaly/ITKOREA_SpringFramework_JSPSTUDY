package dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.Member;
import mybatis.config.DBService;

public class MemberDAO {

	final String NAMESPACE = "dao.member.";
	private SqlSessionFactory factory;
	private static MemberDAO instance = new MemberDAO();
	private MemberDAO() {
		factory = DBService.getInstance().getFactory();
	}
	public static MemberDAO getInstance() {
		if(instance == null)
			instance = new MemberDAO();
		return instance;
	}
	
	/* 1. 로그인 */
	public Member login(Member member) {
		SqlSession session = factory.openSession();
		Member loginUser = session.selectOne(NAMESPACE + "login",member);
		session.close();
		return loginUser;
	}
	
	/* 2. 아이디 중복 확인 */
	public int IdCheck(String id) {
		SqlSession session = factory.openSession();
		int cnt = session.selectOne(NAMESPACE + "idCheck", id);
		session.close();
		return cnt;
	}
	
	/* 3. 가입 */
	public int join(Member member) {
		SqlSession session = factory.openSession(false);
		int result = session.insert(NAMESPACE + "join", member);
		if(result > 0)
			session.commit();
		session.close();
		return result;
	}
	
	/* 4. 회원정보수정 */
	public int update(Member member) {
		SqlSession session = factory.openSession(false);
		int result = session.update(NAMESPACE + "update", member);
		if(result > 0)
			session.commit();
		session.close();
		return result;
	}
	
	/* 5. 회원탈퇴 */
	public int delete(long no) {
		SqlSession session = factory.openSession(false);
		int result = session.delete(NAMESPACE + "delete", no);
		if(result > 0)
			session.commit();
		session.close();
		return result;
	}
}
