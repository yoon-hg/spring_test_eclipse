package evcar.management.service;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface EvManagementService {
	public List<?> selectStation() throws Exception;
	public List<?> selectClient() throws Exception;
	public void insertStation(EgovMap param) throws Exception;
	public void insertClient(EgovMap param) throws Exception;
	public List<EgovMap> listClientRead(String custId) throws Exception;
	public List<EgovMap> listStationRead(String stId) throws Exception;
	public void updateStation(EgovMap param) throws Exception;
	public void updateClient(EgovMap param) throws Exception;
	public void deleteStation(String stId) throws Exception;
	public void deleteClient(String custId) throws Exception;
	public List<?> stationSearch(String search) throws Exception;
	public List<?> clientSearch(String search) throws Exception;
	public List<?> selectStationAjax(String pnuSiNm) throws Exception;
	public List<?> searchAjax(EgovMap param) throws Exception;
	public List<?> codeMenuAjax() throws Exception;
	public List<?> codeContentAjax(String cdGrp) throws Exception;
}
