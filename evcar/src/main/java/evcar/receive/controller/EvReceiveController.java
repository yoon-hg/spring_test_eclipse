package evcar.receive.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.JsonObject;

import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import evcar.receive.service.EvReceiveService;
import evcar.receive.service.impl.EvReceiveVO;


@Controller("/evReceiveController")
public class EvReceiveController {

	@Resource(name = "evReceiveService")
	private EvReceiveService evReceiveService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@RequestMapping (value = "/receiveMain.do")
	public String main() throws Exception{
		System.out.println("--main_controller--");
		return "iwmis/main/receive/check.tiles";
	}
	
	
	@RequestMapping (value="/receiveListAjax.do", method = RequestMethod.POST)
	public String list(@RequestParam Map<String, Object> param, Model model,
			@ModelAttribute("searchVO") SampleDefaultVO searchVO) throws Exception{
		System.out.println("--receiveList_controller--");
		
		EgovMap params = new EgovMap();
		params.putAll(param);
		System.out.println(params);
		
		

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		
		searchVO.setFirstIndex(Integer.parseInt(param.get("page_num").toString()));
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		params.put("firstIndex",searchVO.getFirstIndex());
		params.put("recordCountPerPage",searchVO.getRecordCountPerPage());
		
		List<?> receiveList = evReceiveService.receiveList(params);
		model.addAttribute("search",receiveList);
		System.out.println(receiveList);
		
		int totCnt = evReceiveService.receiveListTotCnt(params);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "jsonView";
	}
	
	@RequestMapping(value="/searchChgr.do")
	public String searchStation (@RequestParam(value="search", defaultValue="") String search, Model model) throws Exception{
		System.out.println("--searchStation_controller--");
		model.addAttribute("search",search);
		return "iwmis/main/receive/searchStation.jsp";
	}
	
	@RequestMapping(value="/searchChgrAjax.do")
	public String searchChgrAjax(Model model,@RequestParam Map<String, Object> param,
			@ModelAttribute("searchVO") SampleDefaultVO searchVO) throws Exception{
		System.out.println("--searchChgrAjax_controller--");
		
		EgovMap params = new EgovMap();
		String select = param.get("station").toString();
		if(select.equals("0")){
			params.put("chgr", param.get("name"));
		}else{
			params.put("st", param.get("name"));
		}
		params.putAll(param);
		params.remove("name");
		params.remove("station");
		System.out.println(params);
		
		/** EgovPropertyService.sample */
		searchVO.setPageUnit(5);
		searchVO.setPageSize(5);
		
		
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		
		searchVO.setFirstIndex(Integer.parseInt(param.get("page_num").toString()));
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		params.put("firstIndex",searchVO.getFirstIndex());
		params.put("recordCountPerPage",searchVO.getRecordCountPerPage());
		
		
		List<?> searchStation = evReceiveService.selectReceive(params);
		model.addAttribute("searchStation", searchStation);
		System.out.println(searchStation);
		
		int totCnt = evReceiveService.selectReceiveCnt(params);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "jsonView";
	}
	
	@RequestMapping(value="/container.do")
	public String container(@RequestParam(value="stId") String stId,
			@RequestParam(value="chgrNm") String chgrNm,@RequestParam(value="cmdTp") String cmdTp,
			@RequestParam(value="resDt") String resDt, Model model, EvReceiveVO vo) throws Exception{
		System.out.println("--container_windowopen--");
		System.out.println(resDt);
		String date[] = resDt.split("d");
		resDt = date[0]+" "+date[1];
		
		EgovMap params = new EgovMap();
		
		params.put("stId", stId);
		params.put("chgrNm", chgrNm);
		params.put("cmdTp", cmdTp);
		params.put("resDt", resDt);
		
		List<?> container = evReceiveService.container(params);
		model.addAttribute("container", container.get(0));
		String[] container_msg = container.get(0).toString().split("="); //1->resMsg, 2->recvMsg
		String[] container_resMsg = container_msg[1].split(",");
		container_resMsg[container_resMsg.length-1] = "";
		
		String[] container_recvMsg = container_msg[2].split(","); 
		
		
		vo.setRecvMsg(container_recvMsg);
		vo.setResMsg(container_resMsg);
		
		model.addAttribute("vores",vo.getResMsg());
		model.addAttribute("vorecv",vo.getRecvMsg());
		
		model.addAttribute("id",params);
		System.out.println(params);
		return "iwmis/main/receive/container.jsp";
	}
	

}
