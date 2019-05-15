package kr.or.ddit.slip.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.slip.model.AssetVo;
import kr.or.ddit.slip.service.IAssetService;

@Controller
public class AssetSellCotroller {
	private Logger logger = LoggerFactory.getLogger(AssetSellCotroller.class);
	
	
	@Resource(name="assetService")
	private IAssetService assetService;

	@RequestMapping("assetSell")
	public String assetSell(Model model){
		List<AssetVo> assetSellList = assetService.getAllAsset();
		model.addAttribute("assetSellList",assetSellList);

		return "assetSell";
	}
	
	@RequestMapping("insertApply")
	public String insertApply(Model model, String acquisitionDate, String acquisitionPrice, String depreciation){
		
		return "assetSell";
	}
	
	@RequestMapping("insertCheck")
	public String disposal_check(AssetVo assetVo,String assetCode, String disposalPrice, String disposalDate){
		
		int updCnt = assetService.updateDisposal(assetVo);
		
		return "assetSell";
	}
	
}
