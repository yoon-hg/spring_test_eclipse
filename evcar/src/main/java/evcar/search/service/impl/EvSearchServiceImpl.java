package evcar.search.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import evcar.search.service.EvSearchService;

@Service("evSearchService")
public class EvSearchServiceImpl extends EgovAbstractServiceImpl implements EvSearchService {
	
	
	@Resource(name="evSearchDAO")
	private EvSearchDAO evSearchDAO;

	@Override
	public List<?> selectData() throws Exception {
		System.out.println("testImpl.java - selectData()");
		return evSearchDAO.selectData();
	}
	
	@Override
	public List<?> selectUnion() throws Exception {
		System.out.println("testImpl.java - selectUnion()");
		return evSearchDAO.selectUnion();
	}
	
	@Override
	public List<?> selectJoin() throws Exception {
		System.out.println("testImpl.java - selectJoin()");
		return evSearchDAO.selectJoin();
	}

	@Override
	public List<?> selectIdoDong_list() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("이동이동_목록 serivceImpl");
		return evSearchDAO.selectIdoDong_list();
	}

	@Override
	public List<?> selectIdoDong_total() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("이동이동_합계 serivceImpl");
		return evSearchDAO.selectIdoDong_total();
	}
	

}
