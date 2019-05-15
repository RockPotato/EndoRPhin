package kr.or.ddit.annual.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.Attitude.model.Attitude_recordVo;
import kr.or.ddit.annual.model.AnnualVo;
import kr.or.ddit.annual.service.IAnnualService;
import kr.or.ddit.employee.model.EmployeeVo;
import kr.or.ddit.employee.service.IEmployeeService;

@RequestMapping("/annual")
@Controller
public class AnnualController {
	private Logger logger = LoggerFactory.getLogger(AnnualController.class);
	
	
	@Resource(name = "annualService")
	private IAnnualService annualService;
	
	@Resource(name = "employeeService")
	private IEmployeeService employeeService;
	
	
	
	@RequestMapping(path = "/getAllannual", method = RequestMethod.GET)
	public String getAllannual(Model model) {
		
		List<AnnualVo> allAnnual = annualService.getAllAnnual();
		
		model.addAttribute("allAnnual",allAnnual);
		
		return "AnnualListTiles";
	}
	
	
	
	
	
	@RequestMapping(path = "/annualInsert", method = RequestMethod.POST)
	public String annualInsert_POST(Model model, AnnualVo vo ,RedirectAttributes ra) {
		
		
		String[] tempUser =  vo.getUserid().split(",");
		String[] tempAnnualdate =  vo.getAnnualdate().split(",");
		String[] tempUserdate =  vo.getUserdate().split(",");
		
		AnnualVo annualvo = new AnnualVo();
		
		
		for (int i = 0; i < tempUser.length; i++) {

			annualvo.setUserid(tempUser[i]);
			annualvo.setAnnualdate(tempAnnualdate[i]);
			
			
			EmployeeVo selectEmployee = employeeService.selectEmployee(tempUser[i]);
			String tempYear = selectEmployee.getContinuousYear();
			switch (tempYear) {
			case "1":
			case "2":
				annualvo.setOccurannual("15");
				break;
			case "3":
			case "4":
				annualvo.setOccurannual("16");
				break;
			case "5":
			case "6":
				annualvo.setOccurannual("17");
				break;
			case "7":
			case "8":
				annualvo.setOccurannual("18");
				break;
			case "9":
			case "10":
				annualvo.setOccurannual("19");
				break;
			default:
				break;
			}
			annualvo.setUserdate(tempUserdate[i]);
			
			annualService.insertAnnual(annualvo);
		}
			
			ra.addFlashAttribute("msg", "정상 등록 되었습니다");
			return "redirect:/annual/getAllannual";
		
	}
	
	
	
	
	@RequestMapping(path = "/deleteAnnual", method = RequestMethod.GET)
	public String deleteAnnual(Model model,RedirectAttributes ra, HttpServletRequest req) {
		AnnualVo vo = new AnnualVo();
		
		String index = "";
		
		String[] temps = req.getParameterValues("delete_no");
		
		
		for(String temp : temps){
			
			 index = temp;
		}
		
		String[] deleteArray = index.split(","); 	
		
		
		for (int i = 0; i < deleteArray.length; i+=2) {
			vo.setUserid(deleteArray[i]);
			vo.setAnnualdate(deleteArray[i +1]);
			annualService.deleteAnnual(vo);
			
		}
		
		ra.addFlashAttribute("msg", "정상 삭제 되었습니다");
		return "redirect:/annual/getAllannual";
	}
	
	
	
	@RequestMapping(path = "/annualSearch", method = RequestMethod.GET)
	public String annualSearch(Model model,RedirectAttributes ra,HttpServletRequest req) {
		
		AnnualVo vo = new AnnualVo();
		
		String index = "";
		
		String[] temps = req.getParameterValues("annualSearch");
		
		
			for(String temp : temps){
			 index = temp;
		    }
		
			String[] deleteArray = index.split(","); 	
			
			try {
				
				if(deleteArray[0] !=null){
					vo.setAnnualdate(deleteArray[0]);
					}
					
					if(deleteArray[1] !=null){
					vo.setUsernm(deleteArray[1]);
					}
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			
			List<AnnualVo> allAnnual = annualService.SearchAnnual(vo);
			
			model.addAttribute("allAnnual",allAnnual);
		
			return "AnnualListTiles";
	
	}
	
	
	
	@RequestMapping(path = "/getAllannualAjax", method = RequestMethod.GET)
	@ResponseBody
	public List<AnnualVo> getAllannualAjax(Model model,String userId) {
		
		AnnualVo vo = new AnnualVo();
		vo.setUserid(userId);
		
		List<AnnualVo> searchAnnual = annualService.SearchAnnual(vo);
		
		return searchAnnual;
	}
	

	
	@RequestMapping(path = "/AnnualInsertAuto", method = RequestMethod.GET)
	public String AnnualInsertAuto(RedirectAttributes ra) {
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY");
		Date date = new Date();
		
		AnnualVo vo = new AnnualVo();
		List<EmployeeVo> allEmployee = employeeService.getAllEmployee();
		try {
			for (int i = 0; i < allEmployee.size(); i++) {
				
				vo.setUserid(allEmployee.get(i).getUserId());
				 AnnualVo selectAnnual = annualService.selectAnnual(allEmployee.get(i).getUserId());
				if(selectAnnual == null){

				vo.setUserid(allEmployee.get(i).getUserId());
				vo.setAnnualdate(sdf.format(date) + "0101");
				vo.setAnnualstart(sdf.format(date) + "0101");
				vo.setAnnualend(sdf.format(date) + "1231");
				String tempYear = allEmployee.get(i).getContinuousYear();
				switch (tempYear) {
				case "1":
				case "2":
					vo.setOccurannual("15");
					break;
				case "3":
				case "4":
					vo.setOccurannual("16");
					break;
				case "5":
				case "6":
					vo.setOccurannual("17");
					break;
				case "7":
				case "8":
					vo.setOccurannual("18");
					break;
				case "9":
				case "10":
					vo.setOccurannual("19");
					break;
				default:
					break;
				}

				vo.setUserdate("0");
				annualService.insertAnnual(vo);
				}
	}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	

		
		
		
			
		ra.addFlashAttribute("msg", "정상 등록 되었습니다");
		return "redirect:/annual/getAllannual";

	}






}
