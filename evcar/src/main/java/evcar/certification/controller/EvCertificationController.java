package evcar.certification.controller;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import evcar.certification.service.EvCertificationService;

@Controller("/evCertificationController")
public class EvCertificationController {
	
	@Resource(name="evCertificationService")
	private EvCertificationService evCertificationService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@RequestMapping(value = "/certification.do")
	public String test(@ModelAttribute("searchVO") SampleDefaultVO searchVO, Model model) throws Exception{
		System.out.println("--controller--");
		
		return "certification/certification.tiles";
	}
	
	/*@RequestMapping(value ="/ajaxtest.do", method = RequestMethod.POST)
	public String ajaxtest (Model model, @ModelAttribute("searchVO") SampleDefaultVO searchVO, 
			@RequestParam Map<String, Object> param) throws Exception{
		System.out.println("--ajaxtest_controller--");
		System.out.println(Integer.parseInt(param.get("page_num").toString()));
		
		*//** EgovPropertyService.sample *//*
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		*//** pageing setting *//*
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		EgovMap params = new EgovMap();
		
		searchVO.setFirstIndex(Integer.parseInt(param.get("page_num").toString()));
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		params.put("firstIndex",searchVO.getFirstIndex());
		params.put("recordCountPerPage",searchVO.getRecordCountPerPage());
		
		
		List<?> selectList = evCertificationService.selectList(params);
		model.addAttribute("list", selectList);
		
		int totCnt = evCertificationService.selectListTotCnt(params);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		
		return "jsonView";
	}*/
	
	@RequestMapping(value = "/searchCertification.do", method = RequestMethod.POST)
	public String search (@RequestParam Map<String, Object> param, Model model, 
			@ModelAttribute("searchVO") SampleDefaultVO searchVO) throws Exception{
		
		System.out.println("--searchCertification_controller--");
		
		
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
		
		List<?> searchList = evCertificationService.selectList(params);
		model.addAttribute("search",searchList);
		System.out.println(searchList);
		
		int totCnt = evCertificationService.selectListTotCnt(params);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "jsonView";
	}
	
	@RequestMapping(value= "=/searchStation.do")
	public String searchStation(@RequestParam(value="search", defaultValue="") String search, Model model) throws Exception{
		System.out.println("--search_controller--");
		System.out.println(search);
		
		model.addAttribute("search", search);
		
		return "certification/searchStation.jsp";
	}
	
	@RequestMapping(value= "/searchStationAjax.do")
	public String searchStationAjax(@RequestParam Map<String, Object> param, Model model,
			@ModelAttribute("searchVO") SampleDefaultVO searchVO) throws Exception{
		System.out.println("--searchStation_controller--");
		
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
		
		
		List<?> searchStation = evCertificationService.selectStation(params);
		model.addAttribute("searchStation", searchStation);
		System.out.println(searchStation);
		
		int totCnt = evCertificationService.selectStationCnt(params);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "jsonView";
	}
}
