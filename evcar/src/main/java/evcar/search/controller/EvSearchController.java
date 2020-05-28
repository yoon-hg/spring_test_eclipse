package evcar.search.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import evcar.search.service.EvSearchService;

@Controller("/evSearchCotroller")
public class EvSearchController {
	@Resource(name = "evSearchService")
	private EvSearchService  evSearchService;
	
	@RequestMapping(value = "/check.do")
	public String newfile()throws Exception{
		
		return "viewer/check.tiles";
	}
	
	@RequestMapping(value = "/slider.do")
	public String newmenu()throws Exception{
		
		return "viewer/slider";
	}
	@RequestMapping(value = "/test.do")
	public String main()throws Exception{
		
		return "viewer/NewFile2";
	}
	
	@RequestMapping(value = "/db.do")
	public String database(Model model)throws Exception{
		System.out.println("db연결 확인!!!!");
		List<?> dblist = evSearchService.selectJoin();
		System.out.println(dblist.get(0).toString());
		model.addAttribute("result", dblist);
		return "viewer/db_join";
	}
	
	@RequestMapping(value ="/idoidong_list.do")
	public String idoidong_list(Model model)throws Exception{
		System.out.println("이도이동 충전 목록");
		List<?> charge_list = evSearchService.selectIdoDong_list();
		System.out.println(charge_list.get(0).toString());
		model.addAttribute("list", charge_list);
		return "viewer/idoidong_list";
	}
	
	@RequestMapping(value ="/idoidong_1m_list.do")
	public String idoidong_total(Model model)throws Exception{
		System.out.println("이도이동 충전 목록");
		List<?> charge_total = evSearchService.selectIdoDong_total();
		model.addAttribute("list", charge_total);
		return "viewer/idoidong_1m_list";
	}
	
	/////////////////////////////////////////////////////////////////
	
	
}
