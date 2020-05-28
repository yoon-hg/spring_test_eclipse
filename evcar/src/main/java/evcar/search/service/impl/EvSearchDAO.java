package evcar.search.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("evSearchDAO")
public class EvSearchDAO extends EgovAbstractDAO{
	public List<?> selectData() throws Exception{
		System.out.println("testDAO.java - selectData()");
		return (List<?>) list("EvSearchDAO.selectData");//sql로 넘겨줄 id
	}
	
	public List<?> selectUnion() throws Exception{
		System.out.println("testDAO.java - selectUnion()");
		return (List<?>) list("EvSearchDAO.selectUnion");//sql로 넘겨줄 id
	}
	
	public List<?> selectJoin() throws Exception{
		System.out.println("testDAO.java - selectJoin()");
		return (List<?>) list("EvSearchDAO.selectJoin");//sql로 넘겨줄 id
	}
	
	public List<?> selectIdoDong_list() throws Exception{
		System.out.println("이도이동_목록 DAO");
		return (List<?>) list("EvSearchDAO.selectIdoDong_list");//sql로 넘겨줄 id
	}
	
	public List<?> selectIdoDong_total() throws Exception{
		System.out.println("이도이동_합계 DAO");
		return (List<?>) list("EvSearchDAO.selectIdoDong_total");//sql로 넘겨줄 id
	}
}
