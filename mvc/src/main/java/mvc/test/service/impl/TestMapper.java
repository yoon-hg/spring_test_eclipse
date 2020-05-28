package mvc.test.service.impl;

import java.util.List;

import mvc.domain.MemberVO;

public interface TestMapper {
	
	public void insertMember(MemberVO vo) throws Exception;
	public List<?> selectMember() throws Exception;
}
