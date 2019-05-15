package kr.or.ddit.slip.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.slip.model.AssetVo;
import kr.or.ddit.slip.model.SlipVo;
import kr.or.ddit.slip.model.Slip_detailVo;
import kr.or.ddit.slip.service.IAssetService;
import kr.or.ddit.slip.service.ISlipService;
import kr.or.ddit.slip.service.ISlip_detailService;

@Controller
public class assetUsedController {
	
	private Logger logger = LoggerFactory.getLogger(assetUsedController.class);
	
	@Resource(name="assetService")
	private IAssetService assetService;
	
	@Resource(name="slipService")
	private ISlipService slipService;
	
	@Resource(name="slip_detailService")
	private ISlip_detailService slip_detailService;
	
	@RequestMapping("assetUsed")
	public String ListDepreciation(Model model) {
		
		List<AssetVo> depreciationList = assetService.getAllAsset();
		
		model.addAttribute("depreciationList", depreciationList);
		
		return "assetUsed";
	}
	
	//날짜 검색
	@RequestMapping("assetDateSearch")
	public String assetDateSearch(Model model , String accountName , String acquisitionDate) {
		
		List<AssetVo> depreciationList = assetService.searchDateAsset(accountName, acquisitionDate);
		
		model.addAttribute("depreciationList", depreciationList);
		
		return "assetUsed/assetDateSearchAjax";
	}

	@RequestMapping("insertslipApply")
	public String slipInsertApply(SlipVo slipVo, String assetCode,String acquisitionDate,Model model,
								  String depreciation,String clientName, String sanggakCode) throws ParseException {
		
		Date date = new Date();									
		SimpleDateFormat sdf1 = new SimpleDateFormat("yy/MM/dd");
        date= sdf1.parse(acquisitionDate);
		
		slipVo.setTotal("000");
		slipVo.setDepartmentName("미등록");
		slipVo.setJukyo("미등록");
		slipVo.setStatus("0");
	    slipVo.setSlipDate(date);
	    
		slipService.insertSlip(slipVo);
	
		String currval = slipService.currvalSeq();
		
		int slipNumber = slipService.getSlipCnt(null)+1;
		
		String currvalNum = slipService.currvalSeq();
		
		Slip_detailVo vo = new Slip_detailVo();

		vo.setSlipNumber(currvalNum);
		vo.setSlipDetailNo("1");
		vo.setStatus("1");
		vo.setPrice(depreciation);
		vo.setClientCard(clientName);
		vo.setEstablishCode(sanggakCode);
		
		slip_detailService.insertDetailSlip(vo);
		
		Slip_detailVo vo1 = new Slip_detailVo();
		vo1.setSlipNumber(currvalNum);
		vo1.setSlipDetailNo("2");
		vo1.setStatus("0");
		vo1.setPrice(depreciation);
		vo1.setClientCard(clientName);
		vo1.setEstablishCode("818");
		
		slip_detailService.insertDetailSlip(vo1);
		
		AssetVo assetVo = new AssetVo();
		assetVo.setSlipNumber(currvalNum);
		assetVo.setAssetCode(assetCode);
		assetService.updateSlipNumber(assetVo);
		
		return "assetUsed";
	}
	
	
}
