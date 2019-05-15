package kr.or.ddit.annual.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.velocity.runtime.directive.Parse;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.annual.model.AnnualVo;
import kr.or.ddit.employee.model.EmployeeVo;
import kr.or.ddit.employee.service.IEmployeeService;
import kr.or.ddit.set.LogicConfig;

public class AnnualTest extends LogicConfig{
	private Logger logger = LoggerFactory.getLogger(AnnualTest.class);

	
	
	@Resource(name = "annualService")
	private IAnnualService annualService;
	
	@Resource(name = "employeeService")
	private IEmployeeService employeeService;
	
	
	@Test
	public void allAnnualTest() {
		
		List<AnnualVo> allAnnuals = annualService.getAllAnnual();
		for(AnnualVo allAnnual : allAnnuals){
			logger.debug("치약 :{}",allAnnual);
		}
		
	}
	
	
	
	
	
	
	@Test
	public void insertAnnualTest() {
		
		AnnualVo vo = new AnnualVo();
		vo.setUserid("3");
		vo.setAnnualdate("19800808");
		vo.setOccurannual("3");
		vo.setUserdate("3");
		
		annualService.insertAnnual(vo);
		
		
		
	}
	
	
	@Test
	public void yearAnnualTest() {
		
		String a = "7";
		
		switch (a) {
		
		case "1":
		case "2":
			System.out.println("여기" + "1,2");
			break;
		case "3":
		case "4":
			System.out.println("여기" +"3,4");
			break;
		case "5":
		case "6":
			System.out.println("여기" +"5,6");
			break;
		case "7":
		case "8":
			System.out.println("여기" +"7,8");
			break;

		default:
			break;
		}
		
		
	}
	
	
	
	@Test
	public void deleteAnnualTest() {
		
		AnnualVo vo = new AnnualVo();
		
		vo.setUserid("1004");
		vo.setAnnualdate("2020-02-02");
		annualService.deleteAnnual(vo);
		
		
		
	}
	
	
	@Test
	public void searchAnnualTest() {
		
		AnnualVo vo = new AnnualVo();
		vo.setUserid("5343");
		//vo.setUsernm("윤상호");
		//vo.setAnnualdate("2018");
		List<AnnualVo> searchAnnual = annualService.SearchAnnual(vo);
		
		System.out.println("감자 : " + searchAnnual);
		
	}
	@Test
	public void selectAnnualTest() {
		 AnnualVo selectAnnual = annualService.selectAnnual("5343");
		 
		 System.out.println("스톰 :" + selectAnnual);
		 
		
		
	}
	
	@Test
	public void autoAnnualTest() {
		
		AnnualVo vo = new AnnualVo();
		List<EmployeeVo> allEmployee = employeeService.getAllEmployee();
		
		
		for (int i = 0; i < allEmployee.size(); i++) {
			vo.setUserid(allEmployee.get(i).getUserId());
			vo.setAnnualdate("20190101");
			/*vo.setAnnualstart("2019-01-01");
			vo.setAnnualend("2019-12-31");*/
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
	@Test
	public void dateTest() {
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY");
		
		Date date = new Date();
		System.out.println(sdf.format(date));
		
	}
	
	
	@Test
	public void AnnualUpdate() {
		
		AnnualVo vo = new AnnualVo();
		vo.setUserid("2");
		vo.setUserdate("2");
		annualService.updateAnnual(vo);
		
	}
	
	@Test
	public void Annualauto() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY");
		Date date = new Date();
		
		AnnualVo vo = new AnnualVo();
		List<EmployeeVo> allEmployee = employeeService.getAllEmployee();

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
		
		
		
		
	}
	
	
	
	
}
