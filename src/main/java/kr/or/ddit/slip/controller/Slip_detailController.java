package kr.or.ddit.slip.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.slip.model.SlipVo;
import kr.or.ddit.slip.model.Slip_detailVo;
import kr.or.ddit.slip.service.ISlipService;
import kr.or.ddit.slip.service.ISlip_detailService;

@Controller
public class Slip_detailController {
	
	private Logger logger = LoggerFactory.getLogger(Slip_detailController.class);
	
	@Resource(name="slip_detailService")
	private ISlip_detailService slip_detailService;
	
	@Resource(name="slipService")
	private ISlipService slipService;
	
	
	@RequestMapping("/insertDetailSlip")
	public String insertDetailSlip(	@RequestParam(name="status")String  status
								,	@RequestParam(name="price")String  price
								,	@RequestParam(name="juckyo", defaultValue="미등록")String  juckyo
								,	@RequestParam(name="dept", defaultValue="미등록")String  dept
								,	@RequestParam(name="slipDate")String  slipDate
								,	@RequestParam(name="establish", defaultValue="미등록")String  establish
								,	@RequestParam(name="client", defaultValue="미등록")String  client
								,	Model model,Slip_detailVo vo) {
		
		
		
		model.addAttribute("status", status);
		model.addAttribute("price", price);
		model.addAttribute("juckyo", juckyo);
		model.addAttribute("dept", dept);
		model.addAttribute("slipDate", slipDate);
		model.addAttribute("establish", establish);
		model.addAttribute("client", client);
		
		return "slip_detail/slip_detailInsert";
	}
	
	
	
	@RequestMapping("/deleteSlip_detail")
	@ResponseBody
	public String deleteSlip_detail(@RequestParam("slipNumber")String slipNumber) {
		slip_detailService.deleteSlip_detail(slipNumber);
		slipService.deleteSlip(slipNumber);
		return "입력중이던 전표가 삭제되었습니다.";
	}
	
	
	@RequestMapping("/getSlip_detailData")
	public String getSlip_detailData(	@RequestParam("slipNumber")String slipNumber
									,	Model model){
			
		List<Slip_detailVo> data = slip_detailService.getDistanguishAccount(slipNumber, "1");
		model.addAttribute("data", data);

		return "slip_detail/modalDetailView";
	}
	
	@RequestMapping("/deleteSlip_detail_one")
	@ResponseBody
	public String deleteSlip_detail_one(@RequestParam("slipNumber")String slipNumber
									,	@RequestParam("detailNum")String detailNum) {
		
			slip_detailService.deleteSlip_detail_one(slipNumber, detailNum);
		
		return "상세전표 1개가 삭제되었습니다.";
	}
	
}
