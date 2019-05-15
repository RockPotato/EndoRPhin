package kr.or.ddit.establish;

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

import kr.or.ddit.tax_cal.model.EstablishVo;
import kr.or.ddit.tax_cal.service.IEstablishService;
import kr.or.ddit.util.model.PageVo;

@Controller
public class EstablishController {
	
	private Logger logger = LoggerFactory.getLogger(EstablishController.class);
	
	@Resource(name="establishService")
	private IEstablishService establishService;
	
	
	
	@RequestMapping(path="/establishview", method=RequestMethod.GET)
	public String establishView(PageVo pageVo, Model model) {
		
		Map<String, Object> resultMap = establishService.selectEstablishPagingList(pageVo);
		
		model.addAllAttributes(resultMap);
		model.addAttribute("pageSize", pageVo.getPageSize());
		model.addAttribute("page", pageVo.getPage());
		
		
		return "establishview";
	}

	@RequestMapping("/establishAjaxHtml")
	public String establishAjaxHtml(PageVo pageVo, Model model) {
		
		Map<String, Object> resultMap = establishService.selectEstablishPagingList(pageVo);
		
		model.addAllAttributes(resultMap);
		model.addAttribute("pageSize", pageVo.getPageSize());
		model.addAttribute("page", pageVo.getPage());
		
		return "establish/establishAjaxHtml";
	}
	
	
	@RequestMapping("/getEstablishPageList")
	public String getEstablishPageList(PageVo pageVo, Model model) {
		
		Map<String, Object> resultMap = establishService.selectEstablishPagingList(pageVo);
		model.addAllAttributes(resultMap);
		model.addAttribute("pageSize", pageVo.getPageSize());
		model.addAttribute("page", pageVo.getPage());
		
		return "establish/establishAjaxHtml";
	}
	
	@RequestMapping(path="deleteEstablish", method=RequestMethod.GET)
	public String deleteEstablish(	@RequestParam("delCode")String establishCode) {
		
		String[] arrIdx = establishCode.toString().split(",");
		
        for (int i=0; i<arrIdx.length; i++) {
        	int cnt = establishService.deleteEstablish(arrIdx[i]);
		}
		
		
		return "redirect:/establishview";
	}
	
	@RequestMapping(path="/insertEstablish", method=RequestMethod.POST)
	public String insertEstablish(	@RequestParam(name="frmEsCode")String establishCode
								  , @RequestParam(name="frmEsNameKor", defaultValue="미등록")String establishNameKor
								  , @RequestParam(name="frmEsNameEng", defaultValue="unknown")String establishNameEng
								  , @RequestParam(name="frmEsStatus", defaultValue="자본")String status
								  , @RequestParam(name="frmEsSlipStatus", defaultValue="Y")String slipstatus
								  , @RequestParam(name="frmEsClientStatus", defaultValue="Y")String clientStatus
								  , @RequestParam(name="frmEsUseStatus", defaultValue="1")String useStatus) {
		
		
		EstablishVo vo = new EstablishVo();
		vo.setEstablishCode(establishCode);
		vo.setEstablishNameKor(establishNameKor);
		vo.setEstablishNameEng(establishNameEng);
		vo.setStatus(status);
		vo.setSlipstatus(slipstatus);
		vo.setClientStatus(clientStatus);
		vo.setUseStatus(useStatus);
		
		int cnt = establishService.insertEstablish(vo);
		
		return "redirect:/establishview";
	}
	
	
	@RequestMapping(path="/updateEatablish", method=RequestMethod.POST)
	public String updateEatablish(	@RequestParam(name="frm2EsCode")String establishCode	
								  , @RequestParam(name="frm2EsNameKor", defaultValue="미등록")String establishNameKor
								  , @RequestParam(name="frm2EsNameEng", defaultValue="undefined")String establishNameEng
								  , @RequestParam(name="frm2EsStatus", defaultValue="자본")String status
								  , @RequestParam(name="frm2EsSlipStatus", defaultValue="Y")String slipstatus
								  , @RequestParam(name="frm2EsClientStatus", defaultValue="Y")String clientStatus
								  , @RequestParam(name="frm2EsUseStatus", defaultValue="1")String useStatus) {
	
		
		EstablishVo vo = new EstablishVo();
		vo.setEstablishCode(establishCode);
		vo.setEstablishNameKor(establishNameKor);
		vo.setEstablishNameEng(establishNameEng);
		vo.setStatus(status);
		vo.setSlipstatus(slipstatus);
		vo.setClientStatus(clientStatus);
		vo.setUseStatus(useStatus);
		
		int cnt = establishService.updateEstblish(vo);
		
		return "redirect:/establishview";
	}
	
	
	@RequestMapping("/searchEstablishBtn")
	public String searchEstablish(EstablishVo vo, Model model) {
		
		List<EstablishVo> establishList = establishService.selectEstablishByNm(vo.getEstablishNameKor());
		
		model.addAttribute("establishList", establishList);
		
		return "establish/establishSearchAjax";
	}

}











