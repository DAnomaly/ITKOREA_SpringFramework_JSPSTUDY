package dao;

import java.util.List;
import java.util.Map;

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
	
	/* 1. 회원 목록 불러오기 */
	public List<Member> selectMemberList(Map<String, Object> recordMap) {
		SqlSession ss = factory.openSession();
		List<Member> list = ss.selectList(NAMESPACE + "selectMemberList", recordMap);
		ss.close();
		return list;
	}
	
	/* 2. 회원 정보 불러오기 */
	public Member selectMemberOne(long no) {
		SqlSession ss = factory.openSession();
		Member member= ss.selectOne(NAMESPACE + "selectMemberOne",no);
		ss.close();
		return member;
	}
	
	/* 3. 회원 삭제하기 */
	public int deleteMember(long no) {
		SqlSession ss = factory.openSession(false);
		int result = ss.delete(NAMESPACE + "deleteMember",no);
		if(result > 0)
			ss.commit();
		ss.close();
		return result;
	}
	
	/* 4. 회원 추가하기 */
	public int insertMember(Member member) {
		SqlSession ss = factory.openSession(false);
		int result = ss.delete(NAMESPACE + "insertMember",member);
		if(result > 0)
			ss.commit();
		ss.close();
		return result;
	}
	
	/* 5. 회원 정보 수정하기 */
	public int updateMember(Member member) {
		SqlSession ss = factory.openSession(false);
		int result = ss.update(NAMESPACE + "updateMember",member);
		if(result > 0)
			ss.commit();
		ss.close();
		return result;
	}
	
	/* 6. 전체 회원 수 반환 */
	public int getMemberCount() {
		SqlSession ss = factory.openSession();
		int count = ss.selectOne(NAMESPACE + "getMemberCount");
		ss.close();
		return count;
	}
	
}
