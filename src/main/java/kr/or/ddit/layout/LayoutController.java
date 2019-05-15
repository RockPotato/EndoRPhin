package kr.or.ddit.layout;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/include")
@Controller
public class LayoutController {
	
	
	@RequestMapping(path = "/include", method = RequestMethod.GET)
	public String SearchEmployeeAjax(Model model, String erpinclude) {
		
		
		model.addAttribute("erpinclude",erpinclude);
		
		return "helloTiles";
	}
	
	
	
	






}
