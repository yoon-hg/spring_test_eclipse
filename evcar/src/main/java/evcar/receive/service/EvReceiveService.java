package evcar.receive.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface EvReceiveService {
	public List<?> receiveList(EgovMap param) throws Exception;
	public int receiveListTotCnt(EgovMap param) throws Exception;
	public List<?> selectReceive(EgovMap param) throws Exception;
	public int selectReceiveCnt(EgovMap param) throws Exception;
	public List<EgovMap> container(EgovMap param) throws Exception;
}
