package mvc.test.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mvc.domain.MemberVO;
import mvc.test.service.TestService;

@Service
public class TestServiceImpl implements TestService{
	
	@Inject
	private TestMapper testMapper;
	
	@Override
	public void insertMember(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("--insertMember_service--");
		testMapper.insertMember(vo);
	}

	@Override
	public List<?> selectMember() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("--selectMember_service--");
		return testMapper.selectMember();
	}

}
