package evcar.certification.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import evcar.certification.service.EvCertificationService;

@Service("evCertificationService")
public class EvCertificationServiceImpl implements EvCertificationService {

	@Resource(name = "evCertificationDAO")
	private EvCertificationDAO evCertificationDAO;

	@Override
	public List<?> selectList(EgovMap param) throws Exception {
		System.out.println("--selectList_service--");
		return evCertificationDAO.selectList(param);
	}

	@Override
	public int selectListTotCnt(EgovMap param) throws Exception {
		System.out.println("--selectListTotCnt_service--");
		return evCertificationDAO.selectListTotCnt(param);
	}

	@Override
	public List<?> selectStation(EgovMap param) throws Exception {
		System.out.println("--selectStation_service--");
		return evCertificationDAO.selectStation(param);
	}

	@Override
	public int selectStationCnt(EgovMap param) throws Exception {
		System.out.println("--selectStataionCnt_service--");
		return evCertificationDAO.selectStationTotCnt(param);
	}

}
