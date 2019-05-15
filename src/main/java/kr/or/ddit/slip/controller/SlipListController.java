package kr.or.ddit.slip.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.slip.model.SlipVo;
import kr.or.ddit.slip.service.ISlipService;
import kr.or.ddit.util.model.PageVo;

@Controller
public class SlipListController {
	private Logger logger = LoggerFactory.getLogger(SlipListController.class);
	
	@Resource(name="slipService")
	private ISlipService slipService;

	@RequestMapping("/approval")
	public String approval(PageVo pageVo, Model model) {

		pageVo.setBoardTypeCode("1");
		Map<String,Object> resultMap = slipService.selectSlipPagingList(pageVo);
		model.addAllAttributes(resultMap);
		model.addAttribute("pageSize", pageVo.getPageSize());
		model.addAttribute("page", pageVo.getPage());
		
		return "approval";
	}
	@RequestMapping("/approvalPageList")
	public String approvalPageList(PageVo pageVo, Model model) {

		pageVo.setBoardTypeCode("1");
		Map<String,Object> resultMap = slipService.selectSlipPagingList(pageVo);
		model.addAllAttributes(resultMap);
		model.addAttribute("pageSize", pageVo.getPageSize());
		model.addAttribute("page", pageVo.getPage());
		
		return "slipList/approvalAjaxHtml";
	}

	@RequestMapping("/paaprovuar")
	public String paaprovuar(PageVo pageVo, Model model) {

		pageVo.setBoardTypeCode("0");
		Map<String,Object> resultMap = slipService.selectSlipPagingList(pageVo);
		model.addAllAttributes(resultMap);
		model.addAttribute("pageSize", pageVo.getPageSize());
		model.addAttribute("page", pageVo.getPage());
		
		return "paaprovuar";
	}
	@RequestMapping("/paaprovuarPageList")
	public String paaprovuarPageList(PageVo pageVo, Model model) {

		pageVo.setBoardTypeCode("0");
		Map<String,Object> resultMap = slipService.selectSlipPagingList(pageVo);
		model.addAllAttributes(resultMap);
		model.addAttribute("pageSize", pageVo.getPageSize());
		model.addAttribute("page", pageVo.getPage());
		
		return "slipList/paaprovuarAjaxHtml";
	}
	
	//승인->승인 취소 
	@RequestMapping("/updateSlip")
	public String updateSlip(Model model, @RequestParam("checkRow") String checkRow ){
		
		int updCnt = 0;
		 
		String[] arrIdx = checkRow.toString().split(",");
	
        for (int i=0; i<arrIdx.length; i++) {
        	
        	updCnt = slipService.updateSlip(arrIdx[i]);
		}
		if(updCnt > 0){
			return "approval";
		}
		return "approval";
	}
	//미승인->승인
	@RequestMapping("/updateSlip_paaprovuar")
	public String updateSlip_paaprovuar(Model model, @RequestParam("checkRow") String checkRow ){
		
		int updCnt = 0;
		 
		String[] arrIdx = checkRow.toString().split(",");
	
        for (int i=0; i<arrIdx.length; i++) {
        	
        	updCnt = slipService.updateSlip_paaprovuar(arrIdx[i]);
		}
		if(updCnt > 0){
			return "redirect:/paaprovuar";
		}
		return "redirect:/paaprovuar";
	}
	
	//날짜 검색
	@RequestMapping("/searchAjax")
	public String search_Date(SlipVo slipVo, @RequestParam("before_slipDate")String before_slipDate,
										 	 @RequestParam("after_slipDate")String after_slipDate, Model model,PageVo pageVo) {
		
		pageVo.setBoardTypeCode("1");
		Map<String,Object> resultMap = slipService.selectSlipPagingList(pageVo);
		
		List<SlipVo> dateList = slipService.getBetweenSlip(before_slipDate,after_slipDate);
		model.addAttribute("dateList", dateList);
		
		model.addAllAttributes(resultMap);
		model.addAttribute("pageSize", pageVo.getPageSize());
		model.addAttribute("page", pageVo.getPage());
		
		return "slipList/search_approvalAjax";
	}
	
	//날짜 검색
	@RequestMapping("/searchAjax_p")
	public String search_DateP(SlipVo slipVo, @RequestParam("before_slipDate")String before_slipDate,
											@RequestParam("after_slipDate")String after_slipDate, Model model, PageVo pageVo) {
		pageVo.setBoardTypeCode("0");
		Map<String,Object> resultMap = slipService.selectSlipPagingList(pageVo);
		
		List<SlipVo> dateList = slipService.getBetweenSlip_zero(before_slipDate,after_slipDate);
		model.addAttribute("dateList_p", dateList);
		
		model.addAllAttributes(resultMap);
		model.addAttribute("pageSize", pageVo.getPageSize());
		model.addAttribute("page", pageVo.getPage());
		
		logger.debug("dateList_p : {} " , dateList);
		logger.debug("dateList_p.size : {} " , dateList.size());
		
		return "slipList/search_paaprovuarAjax";
	}
	
}
