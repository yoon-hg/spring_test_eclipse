package mvc.test.service;



import java.util.List;

import mvc.domain.MemberVO;

public interface TestService {
	
	public void insertMember(MemberVO vo) throws Exception;
	public List<?> selectMember() throws Exception;
}
