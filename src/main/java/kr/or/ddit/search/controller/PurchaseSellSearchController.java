package kr.or.ddit.search.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.slip.model.Slip_detailVo;
import kr.or.ddit.slip.service.ISlip_detailService;
import kr.or.ddit.tax_cal.model.Tax_calVo;
import kr.or.ddit.tax_cal.service.ITax_calService;
import kr.or.ddit.util.model.SumChanceVo;

@Controller
public class PurchaseSellSearchController {
	
	private Logger logger = LoggerFactory.getLogger(PurchaseSellSearchController.class);
	
	@Resource(name="tax_calService")
	private ITax_calService tax_calService;
	
	@Resource(name="slip_detailService")
	private ISlip_detailService slip_detailService;
	
	
	@RequestMapping(path="psList", method=RequestMethod.GET)
	public String PSList() {
		return "psList";
	}
	
	
	@RequestMapping(path="sumChance", method=RequestMethod.GET)
	public String sumChance(Model model) {
		
		List<String> years = new ArrayList<String>();
		
		int year;
		year = Calendar.getInstance().get(Calendar.YEAR);
		
		for(int i = 0; i < 3; i++) {
			years.add(year+"");
			year--;
		}
		
		model.addAttribute("years", years);
		
		return "sumChance";
	}
	
	
	// 유형별 전체조회
	@RequestMapping("/searchAllByType")
	public String searchAllByType(	@RequestParam("searchData1")String searchData1,
									@RequestParam("searchData2")String searchData2,
									@RequestParam("year")String year,
									@RequestParam("month")String month,
									Model model) {
			
		
		Map<String,Object> map = new HashMap<>();
		List<Tax_calVo> taxList = new ArrayList<>();
		String searchMonth;
		if(year.equals("")||month.equals("")){
			SimpleDateFormat df = new SimpleDateFormat("yyyyMM");
			searchMonth = df.format(new Date());
		}else{
			searchMonth =year+month;
		}
		map.put("searchMonth", searchMonth);
		
		if(searchData1.equals("매입") && searchData2.equals("전체")) {
			taxList = tax_calService.searchAllByType(map);
		} else if (searchData1.equals("매출") && searchData2.equals("전체")) {
			taxList = tax_calService.searchAllByType2(map);
		} else {
			map.put("searchData2", searchData2);
			taxList = tax_calService.searchAllByType51(map);
		}
		
		model.addAttribute("taxList", taxList);
		
		return "ps/searchResultList";
	}
	
	
	// 자산 불러오기
	@RequestMapping("/callAssetData")
	public String callAssetData(	@RequestParam("year")String year
								,	@RequestParam("month")String month
								,	Model model) {
		
		
		List<Slip_detailVo> list = slip_detailService.selectAssetData(year, month);
		
		model.addAttribute("list", list);
		
		return "ps/sum_asset";
	}
	
	
	// 부채 불러오기
	@RequestMapping("/callObligationData")
	public String callObligationData(	@RequestParam("year")String year
								,	@RequestParam("month")String month
								,	Model model) {
		
		
		List<Slip_detailVo> list = slip_detailService.selectObligationData(year, month);
		
		model.addAttribute("list", list);
		
		return "ps/sum_obligation";
	}
		
		
	// 자본 불러오기
	@RequestMapping("/callCapitalData")
	public String callCapitalData(	@RequestParam("year")String year
								,	@RequestParam("month")String month
								,	Model model) {
		
		List<Slip_detailVo> list = slip_detailService.selectCapitalData(year, month);
		
		model.addAttribute("list", list);
		
		return "ps/sum_capital";
	}
			
			
			
	// 비용 불러오기
	@RequestMapping("/callCostData")
	public String callCostData(	@RequestParam("year")String year
								,	@RequestParam("month")String month
								,	Model model) {
		
		List<Slip_detailVo> list = slip_detailService.selectCostlData(year, month);
		
		model.addAttribute("list", list);
		
		return "ps/sum_cost";
	}
				
				
	// 수익 불러오기
	@RequestMapping("/callRevenueData")
	public String callRevenueData(	@RequestParam("year")String year
								,	@RequestParam("month")String month
								,	Model model) {
		
		List<Slip_detailVo> list = slip_detailService.selectRevenuelData(year, month);
		
		model.addAttribute("list", list);
		
		return "ps/sum_revenue";
	}
	
	
		
	// 수익 불러오기
	@RequestMapping("/selectSumChance")
	public String selectSumChance(	@RequestParam("year")String year
								,	@RequestParam("month")String month
								,	Model model) {
	
	List<SumChanceVo> list = slip_detailService.selectSumChanceData(year, month);
	
	model.addAttribute("list", list);
	
	return "ps/sum_view";
	}
	
	
	

}
