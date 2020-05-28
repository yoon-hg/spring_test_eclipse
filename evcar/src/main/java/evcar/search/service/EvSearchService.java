package evcar.search.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface EvSearchService {
	
	public List<?> selectData() throws Exception;
	public List<?> selectUnion() throws Exception;
	public List<?> selectJoin() throws Exception;
	public List<?> selectIdoDong_list() throws Exception;
	public List<?> selectIdoDong_total() throws Exception;
}
