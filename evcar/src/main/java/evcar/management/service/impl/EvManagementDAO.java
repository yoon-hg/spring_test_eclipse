package evcar.management.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("evManagementDAO")
public class EvManagementDAO extends EgovAbstractDAO{
	//충전소 조회
	public List<?> selectStation() throws Exception{
		System.out.println("--selectionStation_DAO--");
		return (List<?>) list("EvManagementDAO.selectStation"); // sql로 넘겨줄 ID
	}
	
	//고객 조회
	public List<?> selectClient() throws Exception{
		System.out.println("--selectClient.DAO--");
		return (List<?>) list("EvManagementDAO.selectClient"); // sql로 넘겨줄 ID
	}
	
	//충전소 등록
	public void insertStation(EgovMap param) throws Exception {
		try{
			System.out.println("--insertStationDAO_service--");
			insert("EvManagementDAO.insertStation",param);
		} catch(Exception e){
			System.out.println(e.getMessage());
		}
		
	}
	
	//고객 등록
	public void insertClient(EgovMap param) throws Exception {
		try{
			System.out.println("--insertClientDAO_service--");
			insert("EvManagementDAO.insertClient",param);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}

	//충전소 수정
	public void updateStation(EgovMap param) throws Exception {
		try{
			System.out.println("--updateStationDAO_service--");
			update("EvManagementDAO.updateStation",param);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
	}

	//고객 수정
	public void updateClient(EgovMap param) throws Exception {
		System.out.println("--updateClientDAO_service--");
		update("EvManagementDAO.updateClient",param);
	}

	//충전소 삭제
	public void deleteStation(String stId) throws Exception {
		System.out.println("--deleteStationDAO_service--");
		update("EvManagementDAO.deleteStation",stId);
	}

	//고객 삭제
	public void deleteClient(String custId) throws Exception {
		System.out.println("--deleteClientDAO_service--");
		update("EvManagementDAO.deleteClient",custId);
	}
	
	//cust_id 고객 검색
	public List<EgovMap> listClientRead(String custId) throws Exception{
		System.out.println("--listClientDAO_service--");
		return (List<EgovMap>) list("EvManagementDAO.listClientRead",custId);
	}
	
	//station_id 고객 검색
	public List<EgovMap> listStationRead(String stId) throws Exception{
		System.out.println("--listStationDAO_service--");
		return (List<EgovMap>) list("EvManagementDAO.listStationRead",stId);
	}
		
	//충전소 조회
	public List<?> stationSearch(String search) throws Exception{
		System.out.println("--stationSearchDAO--");
		return (List<?>) list("EvManagementDAO.stationSearch",search);
	}
	
	//고객 조회
	public List<?> clientSearch(String search) throws Exception{
		System.out.println("--clientSearchDAO--");
		return (List<?>) list("EvManagementDAO.clientSearch",search);
	}
	
	//ajax 동 조회
	public List<?> selectStationAjax(String pnuSiNm) throws Exception{
		System.out.println("--dong_Ajax--");
		return (List<?>) list("EvManagementDAO.selectStationAjax",pnuSiNm);
	}
	
	//ajax 조회
	public List<?> searchAjax(EgovMap param) throws Exception{
		System.out.println("--searchAjax--");
		return (List<?>) list("EvManagementDAO.searchAjax",param);
	}
	
	public List<?> codemenuAjax() throws Exception{
		System.out.println("--codemenuAjaxDAO--");
		return (List<?>) list("EvManagementDAO.codemenuAjax");
	}
	
	public List<?> codeContentAjax(String cdGrp) throws Exception{
		System.out.println("--codeContentAjaxDAO--");
		return (List<?>) list("EvManagementDAO.codeContentAjax",cdGrp);
	}
	

}
