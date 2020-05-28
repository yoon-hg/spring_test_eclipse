package evcar.receive.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import evcar.receive.service.EvReceiveService;

@Service("evReceiveService")
public class EvReceiveServiceImpl implements EvReceiveService{
	
	@Resource(name = "evReceiveDAO")
	private EvReceiveDAO evReceiveDAO;

	@Override
	public List<?> receiveList(EgovMap param) throws Exception {
		System.out.println("--receiveList_Service--");
		return evReceiveDAO.receiveList(param);
	}

	@Override
	public int receiveListTotCnt(EgovMap param) throws Exception {
		System.out.println("--receiveListTotCnt_Service--");
		return evReceiveDAO.receiveListTotCnt(param);
	}

	@Override
	public List<?> selectReceive(EgovMap param) throws Exception {
		System.out.println("--selectReceive_Service--");
		return evReceiveDAO.selectReceive(param);
	}

	@Override
	public int selectReceiveCnt(EgovMap param) throws Exception {
		System.out.println("--receiveList_Service--");
		return evReceiveDAO.selectReceiveCnt(param);
	}

	@Override
	public List<EgovMap> container(EgovMap param) throws Exception {
		System.out.println("--container_service--");
		return evReceiveDAO.container(param);
	}
}
