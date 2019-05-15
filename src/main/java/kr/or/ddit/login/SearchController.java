package kr.or.ddit.login;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.tax_cal.model.EstablishVo;
import kr.or.ddit.tax_cal.service.IEstablishService;

@Controller
public class SearchController {
	
	@Resource(name="establishService")
	IEstablishService establishService;
	
	@RequestMapping(path="/searchEstablish",method=RequestMethod.GET)
	public String searchEstablish(Model model,String check){
		List<EstablishVo> allEstablish = establishService.getAllEstablish();
		model.addAttribute("check",check);
		model.addAttribute("establishList",allEstablish);
		return "search/establishSearch";
	}
	@RequestMapping(path="/searchEstablish",method=RequestMethod.POST)
	public String searchEstablish_post(Model model,String establishNameKor){
		List<EstablishVo> allEstablish = establishService.selectEstablishByNm(establishNameKor);
		model.addAttribute("establishList",allEstablish);
		return "search/establishSearch";
	}
}
