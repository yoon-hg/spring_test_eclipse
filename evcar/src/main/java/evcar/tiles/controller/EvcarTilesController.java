package evcar.tiles.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("/evcarTilesController")
public class EvcarTilesController {
	
	@RequestMapping(value="content1.do")
	public String content1View(Model model) throws Exception{
		model.addAttribute("url", "/main/content1.do");
		return "iwmis/main/content1.tiles";
	}
	
	@RequestMapping(value="content2.do")
	public String content2View(Model model) throws Exception{
		model.addAttribute("url", "/main/content2.do");
		return "iwmis/main/content2.tiles";
	}
	
	@RequestMapping(value="content3.do")
	public String content3View(Model model) throws Exception{
		model.addAttribute("url", "/main/content3.do");
		return "iwmis/main/receive/check.tiles";
	}
	
}
