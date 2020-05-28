package mvc.dao;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mvc.domain.MemberVO;

@Repository //DAO라고 명시 (DAO를 스프링에서 인식시켜줌)
public class MemberDAOImpl implements MemberDAO {

	@Inject // 의존관계를 자동으로 연결(JAVA에서 제공) ==@autowired (Spring에서 제공)
    private SqlSession sqlSession;
   
   
    private static final String namespace = "org.hello.mapper.MemberMapper";
                                            //memberMapper.xml의 namespace값


	@Override
	public void insertMember(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".insertMember", vo);
	}

}
