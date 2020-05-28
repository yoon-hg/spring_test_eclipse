package mvc.test.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import mvc.domain.MemberVO;
import mvc.test.service.TestService;

@Controller
public class TestController {

	@Inject
	private TestService testService;
	
	@RequestMapping(value="/test")
	public String test(Model model, MemberVO vo)throws Exception{
		System.out.println("--test_controller--");
		
		
		
		//testService.insertMember(vo);
		
		System.out.println(vo);
		List<?> member = testService.selectMember();
		model.addAttribute("list",member);
		System.out.println(member);
		return "test";
	}
}
