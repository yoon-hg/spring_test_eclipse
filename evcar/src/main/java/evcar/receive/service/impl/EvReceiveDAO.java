package evcar.receive.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("evReceiveDAO")
public class EvReceiveDAO extends EgovAbstractDAO{
	

	public List<?> receiveList(EgovMap param) throws Exception {
		System.out.println("--receiveListDAO--");
		return (List<?>) list("EvReceiveDAO.receiveList",param);
	}

	public int receiveListTotCnt(EgovMap param) throws Exception {
		System.out.println("--receiveListTotCntDAO--");
		return (Integer) select("EvReceiveDAO.receiveListTotCnt",param);
	}

	public List<?> selectReceive(EgovMap param) throws Exception {
		System.out.println("--selectReceiveDAO--");
		return (List<?>) list("EvReceiveDAO.selectReceive",param);
	}

	public int selectReceiveCnt(EgovMap param) throws Exception {
		System.out.println("--selectReceiveCntDAO--");
		return (Integer) select("EvReceiveDAO.selectReceiveCnt",param);
	}
	
	public List<EgovMap> container(EgovMap param) throws Exception{
		System.out.println("--containerDAO--");
		return (List<EgovMap>) list("EvReceiveDAO.container",param);
	}
}
