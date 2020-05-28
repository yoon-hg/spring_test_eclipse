package evcar.management.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import egovframework.rte.psl.dataaccess.util.EgovMap;
import evcar.management.service.EvManagementService;

@Controller("/evManagementController")
public class EvManagementController {
	
	@Resource (name = "evManagementService")
	private EvManagementService evManagementService;
	
	
	
	//메인 화면
		@RequestMapping(value = "/evmain.do")
		public String main(Model model, @RequestParam(value="id", defaultValue="0") String id,
						@RequestParam(value="custId", defaultValue="0") String custId ,
						@RequestParam(value="stId", defaultValue="0") String stId,
						@RequestParam(value="search", defaultValue="0") String search) throws Exception{
			System.out.println("--main화면 controller--");
			System.out.println(id);
			model.addAttribute("namespasce",id+".jsp");
			switch(id){
			case "station":
				if(search.equals("0")){
					List<?> station_list = evManagementService.selectStation();
					model.addAttribute("list", station_list);
				} else{
					List<?> station_search_list = evManagementService.stationSearch(search);
					model.addAttribute("list", station_search_list);
				}
				break;
			case "client":
				if(search.equals("0")){
					List<?> client_list = evManagementService.selectClient();
					model.addAttribute("client", client_list);
				} else{
					List<?> client_search_list = evManagementService.clientSearch(search);
					model.addAttribute("client", client_search_list);
				}
				break;
			case "updateClient":
				List<EgovMap> ctparam = evManagementService.listClientRead(custId);
				model.addAttribute("client", ctparam);
				break;
			case "updateStation":
				List<EgovMap> stparam = evManagementService.listStationRead(stId);
				model.addAttribute("station", stparam);
				break;
			}
			
			
			return "management/main";
		}
		
		
		
	
	//충전소 화면
	@RequestMapping(value = "/station.do")
	public String test(Model model) throws Exception{
		System.out.println("--station_controller--");
		List<?> station_list = evManagementService.selectStation();
		model.addAttribute("list", station_list);
		return "management/station.tiles";
	}
	//고객화면
	@RequestMapping(value = "/client.do")
	public String check (Model model) throws Exception{
		System.out.println("--client_controller--");
		List<?> client_list = evManagementService.selectClient();
		model.addAttribute("client", client_list);
		return "management/client";
	}
	
	//충전소 조회
	@RequestMapping(value="/stationSearch.do")
	public String stationSearch(Model model, @RequestParam ("search") String search) throws Exception{
		System.out.println("--station_search_controller");
		System.out.println(search);
		List<?> station_search_list = evManagementService.stationSearch(search);
		model.addAttribute("list", station_search_list);
		return "management/station";
	}
	
	
	
	//고객 추가
	@RequestMapping(value="/insertClient.do",method=RequestMethod.GET)
    public String insertGET(){
        System.out.println(" insertClient 입니다. GET방식");
        return "management/insertClient";
    }
	
	@RequestMapping(value = "/insertClient.do", method=RequestMethod.POST)
	public String insertClient (Model model, HttpServletRequest request) throws Exception{
		System.out.println("--insertClient_controller--");
		EgovMap param = new EgovMap();
		Map<String, String> map = new HashMap<String, String>();
		map.put("provider_id",request.getParameter("provider_id"));
		map.put("cust_nm",request.getParameter("cust_nm"));
		map.put("cust_tp",request.getParameter("cust_tp"));
		map.put("tel",request.getParameter("tel"));
		param.putAll(map);
		System.out.println(param.toString());
		evManagementService.insertClient(param);
		return "redirect:/evmain.do?id=client";
	}
	
	
	//고객 수정
		@RequestMapping(value="/updateClient.do",method=RequestMethod.GET)
	    public String updateGET(@RequestParam("custId") String custId, Model model){
			System.out.println("고객 정보를 수정합니다.");
			try {
				List<EgovMap> param = evManagementService.listClientRead(custId);
				System.out.println(param);
				model.addAttribute("client", param);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        return "management/updateClient";
	    }
	
		
		@RequestMapping(value = "/updateClient.do", method=RequestMethod.POST)
		public String updateClient (Model model, HttpServletRequest request) throws Exception{
			System.out.println("--updateClient_controller--");
			
			EgovMap param = new EgovMap();
			Map<String, String> map = new HashMap<String, String>();
			map.put("cust_id",request.getParameter("cust_id"));
			map.put("provider_id",request.getParameter("provider_id"));
			map.put("cust_nm",request.getParameter("cust_nm"));
			map.put("cust_tp",request.getParameter("cust_tp"));
			map.put("tel",request.getParameter("tel"));
			map.put("fax",request.getParameter("fax"));
			param.putAll(map);
			System.out.println(param.toString());
			evManagementService.updateClient(param);
			
			return "redirect:/evmain.do?id=client";
		}
		
		//고객 삭제
				@RequestMapping(value="/deleteClient.do")
				public String deleteClient(@RequestParam("custId") String custId) throws Exception{
					System.out.println("--deleteClient_Controller--");
					evManagementService.deleteClient(custId);
					return "redirect:/evmain.do?id=client";
				}
		
		
		
		//충전소 추가
		@RequestMapping(value="/insertStation.do", method=RequestMethod.GET)
	    public String insertStationGET(){
	        System.out.println(" insertStation 입니다. GET방식");
	        return "management/insertStation";
	    }
		
		@RequestMapping(value = "/insertStation.do", method=RequestMethod.POST)
		public String insertStation(Model model, HttpServletRequest request) throws Exception{
			System.out.println("--insertStation_controller--");
			EgovMap param = new EgovMap();
			Map<String, String> map = new HashMap<String, String>();
			map.put("st_nm",request.getParameter("st_nm"));
			map.put("pnu_si_nm",request.getParameter("pnu_si_nm"));
			
				if((map.get("pnu_si_nm")).equals("제주시")){
					map.put("pnu_si_nm", "11");
				} else {
					map.put("pnu_si_nm", "13");
				}
				
			map.put("addr_rd_m",request.getParameter("addr_rd_m"));
			map.put("addr_rd_d",request.getParameter("addr_rd_d"));
			map.put("addr_ld_m",request.getParameter("addr_ld_m"));
			map.put("addr_ld_d",request.getParameter("addr_ld_d"));
			
			param.putAll(map);
			
			System.out.println(param.toString());
			evManagementService.insertStation(param);
			return "redirect:/evmain.do";
		}
		
		//충전소 수정
				@RequestMapping(value="/updateStation.do",method=RequestMethod.GET)
			    public String updateStationGET(@RequestParam("stId") String stId, Model model){
					System.out.println("충전소 정보를 수정합니다.");
					try {
						List<EgovMap> param = evManagementService.listStationRead(stId);
						System.out.println(param);
						model.addAttribute("station", param);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			        return "management/updateStation";
			    }
				
				
				@RequestMapping(value = "/updateStation.do", method=RequestMethod.POST)
				public String updateStation (Model model, HttpServletRequest request) throws Exception{
					System.out.println("--updateStation_controller--");
					
					EgovMap param = new EgovMap();
					Map<String, String> map = new HashMap<String, String>();
					map.put("st_id",request.getParameter("st_id"));
					map.put("st_nm",request.getParameter("st_nm"));
					map.put("pnu_si_nm",request.getParameter("pnu_si_nm"));
					map.put("addr_rd_m",request.getParameter("addr_rd_m"));
					map.put("addr_rd_d",request.getParameter("addr_rd_d"));
					map.put("addr_ld_m",request.getParameter("addr_ld_m"));
					map.put("addr_ld_d",request.getParameter("addr_ld_d"));
					param.putAll(map);
					System.out.println(param.toString());
					evManagementService.updateStation(param);
					
					return "redirect:/evmain.do?id=station";
				}
				
				
		//충전소 삭제
				@RequestMapping(value="/deleteStation.do")
				public String deleteStation(@RequestParam("stId") String stId) throws Exception{
					System.out.println("--deleteStation_Controller--");
					System.out.println(stId);
					evManagementService.deleteStation(stId);
					return "redirect:/evmain.do?id=station";
				}
		
		//testAjax
		@RequestMapping(value="/main/viewAjax.do")
		public String view() throws Exception{
			System.out.println("--testAjax--");
			return "management/stationAjax";
		}
				
		//시별 동이름 조회 Ajax	
		@RequestMapping(value="/stationAjax.do",  method = RequestMethod.POST)
		public ModelAndView pnu_dong(@RequestParam Map<String, Object> param, Model model) throws Exception{
			System.out.println(param);
			String pnuSiNm = (String)param.get("pnu_si_nm");
			System.out.println(pnuSiNm);
			
			List<?> dong_list = evManagementService.selectStationAjax(pnuSiNm);
			
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("list",dong_list);
			modelAndView.setViewName("jsonView");
			System.out.println(modelAndView);


			return modelAndView;
		}
		
		//Ajax 충전소 조회
		@RequestMapping(value="/searchAjax.do", method = RequestMethod.POST)
		public ModelAndView searchAjax(@RequestParam Map<String, Object> param){
			System.out.println("--searchAjax--");
			System.out.println(param);
			EgovMap params = new EgovMap();
			params.putAll(param);
			List<?> searchAjax = null ;
			try {
				searchAjax = evManagementService.searchAjax(params);
				System.out.println(searchAjax);
			} catch (Exception e) {
				e.printStackTrace();
			}
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("search",searchAjax);
			modelAndView.setViewName("jsonView");
			System.out.println(modelAndView);
			return modelAndView;
		}
		
		//responsbody로 ajax json 통신
		@ResponseBody
		@RequestMapping(value="/contentAjax.do", method = RequestMethod.POST , produces="text/html;charset=UTF-8")
		public String searchAjaxString(@RequestParam Map<String, Object> param){
			String pnuSiNm = (String)param.get("pnu_si_nm");
			System.out.println(pnuSiNm);
			String json = "";
			JSONArray jsonArray = new JSONArray();
			try {
				List<?> searchAjax = evManagementService.selectStationAjax(pnuSiNm);
				jsonArray.addAll(searchAjax);
				System.out.println(jsonArray);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			JSONObject jsonobject = new JSONObject();
			jsonobject.put("list", jsonArray);
			json = jsonobject.toJSONString();
			System.out.println(json);
			return json;
		}
		
		//menuAjax
		@RequestMapping(value="/codemenuAjax.do", produces="text/html;charset=UTF-8")
		@ResponseBody
		public String codemenuAjax()throws Exception{
			System.out.println("--codemenuAjax_controller--");
			List<?> menu = evManagementService.codeMenuAjax();
			JSONArray menuArray = new JSONArray();
			menuArray.addAll(menu);
			JSONObject menuObject = new JSONObject();
			menuObject.put("menu", menuArray);
			String json = menuObject.toJSONString();
			return json;
		}
		
		//contentAjax
		@RequestMapping(value="/contentAjax.do", method = RequestMethod.POST)
		public String codeContent(@RequestParam Map<String,Object> param, Model model) throws Exception{
			System.out.println("--codeContentAjax_controller--");
			System.out.println(param.get("cdGrp"));
			List<?> content = evManagementService.codeContentAjax((String)param.get("cdGrp"));
			System.out.println(content);
			model.addAttribute("codeContent", content);
			return "jsonView";
		}
		
		@RequestMapping(value="/code.do")
		public String code() throws Exception{
			System.out.println("--codeView--");
			return "code/content.tiles";
		}
		
}
