package evcar.certification.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("evCertificationDAO")
public class EvCertificationDAO extends EgovAbstractDAO{
	
	
	public List<?> selectList(EgovMap param) throws Exception{
		System.out.println("--selectListDAO--");
		return (List<?>) list("EvCertificationDAO.selectList",param);
	}
	
	public int selectListTotCnt(EgovMap param) throws Exception{
		System.out.println("--selectListTocntDAO--");
		return (Integer) select("EvCertification.selectListTotCnt",param);
	}
	
	public List<?> selectStation(EgovMap param) throws Exception{
		System.out.println("--selectStationDAO--");
		return (List<?>) list("EvCertificationDAO.selectStation",param);
	}
	
	public int selectStationTotCnt(EgovMap param) throws Exception{
		System.out.println("--selectStationTotCntDAO--");
		return (Integer) select("EvCertification.selectStationTotCnt",param);
	}
}
