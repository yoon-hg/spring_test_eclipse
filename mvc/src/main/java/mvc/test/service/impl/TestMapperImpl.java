package mvc.test.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mvc.domain.MemberVO;

@Repository
public class TestMapperImpl implements TestMapper {
	
	@Inject // 의존관계를 자동으로 연결(JAVA에서 제공) ==@autowired (Spring에서 제공)
    private SqlSession sqlSession;
   
   
    private static final String namespace = "org.hello.mapper.MemberMapper";
    
	@Override
	public void insertMember(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("--insertMember_mapper--");
		sqlSession.insert(namespace+".insertMember",vo);
	}

	@Override
	public List<?> selectMember() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("--selectMember_mapper--");
		return (List<?>) sqlSession.selectList(namespace+".selectMember");
	}

}
