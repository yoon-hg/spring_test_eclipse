package evcar.certification.service;

import java.util.List;

import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface EvCertificationService {
	public List<?> selectList(EgovMap param) throws Exception;
	public int selectListTotCnt(EgovMap param) throws Exception;
	public List<?> selectStation(EgovMap param) throws Exception;
	public int selectStationCnt(EgovMap param) throws Exception;
}
