package evcar.search.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("evSearchMapper")
public interface EvSearchMapper {
	
	public List<?> selectData() throws Exception;
}
