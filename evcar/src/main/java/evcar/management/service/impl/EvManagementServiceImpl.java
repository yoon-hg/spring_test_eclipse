package evcar.management.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import evcar.management.service.EvManagementService;

@Service("evManagementService")
public class EvManagementServiceImpl implements EvManagementService {
	
	@Resource(name = "evManagementDAO")
	private EvManagementDAO evManagementDAO;
	
	//충전소 목록 검색
	@Override
	public List<?> selectStation() throws Exception {
		System.out.println("--selectStation_service--");
		return evManagementDAO.selectStation();
	}

	//고객 목록 검색
	@Override
	public List<?> selectClient() throws Exception {
		System.out.println("--selectClient_service--");
		return evManagementDAO.selectClient();
	}

	//충전소 등록
	@Override
	public void insertStation(EgovMap param) throws Exception {
		System.out.println("--insertStation_service--");
		evManagementDAO.insertStation(param);
	}

	//고객 등록
	@Override
	public void insertClient(EgovMap param) throws Exception {
		System.out.println("--insertClient_service--");
		evManagementDAO.insertClient(param);
	}

	//충전소 수정
	@Override
	public void updateStation(EgovMap param) throws Exception {
		System.out.println("--updateStation_service--");
		evManagementDAO.updateStation(param);
	}

	//고객 수정
	@Override
	public void updateClient(EgovMap param) throws Exception {
		System.out.println("--updateClient_service--");
		evManagementDAO.updateClient(param);
	}

	//충전소 삭제
	@Override
	public void deleteStation(String stId) throws Exception {
		System.out.println("--deleteStation_service--");
		evManagementDAO.deleteStation(stId);
	}

	//고객 삭제
	@Override
	public void deleteClient(String custId) throws Exception {
		System.out.println("--deleteClient_service--");
		evManagementDAO.deleteClient(custId);
	}

	//선택 고객 조회_수정
	@Override
	public List<EgovMap> listClientRead(String custId) throws Exception {
		System.out.println("--updateClient_service--");
		return evManagementDAO.listClientRead(custId);
	}

	//선택 충전소 조회_수정
	@Override
	public List<EgovMap> listStationRead(String stId) throws Exception {
		System.out.println("--updateStation_service--");
		return evManagementDAO.listStationRead(stId);
	}

	//충전소 조회
	@Override
	public List<?> stationSearch(String search) throws Exception {
		System.out.println("--stationSearch_service--");
		return evManagementDAO.stationSearch(search);
	}
	
	//고객 조회
	@Override
	public List<?> clientSearch(String search) throws Exception {
		System.out.println("--clientSearch_service--");
		return evManagementDAO.clientSearch(search);
	}
	
	//ajax 동조회
	@Override
	public List<?> selectStationAjax(String pnuSiNm) throws Exception {
		System.out.println("--dong_ajax--");
		return evManagementDAO.selectStationAjax(pnuSiNm);
	}

	//ajax 조회
	@Override
	public List<?> searchAjax(EgovMap param) throws Exception {
		System.out.println("--searchAjax--");
		return evManagementDAO.searchAjax(param);
	}

	//codemenu ajax
	@Override
	public List<?> codeMenuAjax() throws Exception {
		System.out.println("--codeMenuAjax_service--");
		return evManagementDAO.codemenuAjax();
	}

	@Override
	public List<?> codeContentAjax(String cdGrp) throws Exception {
		System.out.println("--codeContentAjaxService--");
		return evManagementDAO.codeContentAjax(cdGrp);
	}

}
