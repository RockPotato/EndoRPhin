package kr.or.ddit.slip.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.company.model.DeptVo;
import kr.or.ddit.company.service.IDeptService;
import kr.or.ddit.slip.model.SlipVo;
import kr.or.ddit.slip.model.Slip_detailVo;
import kr.or.ddit.slip.model.WriteSlipVo;
import kr.or.ddit.slip.service.ISlipService;
import kr.or.ddit.slip.service.ISlip_detailService;
import kr.or.ddit.tax_cal.model.EstablishVo;
import kr.or.ddit.tax_cal.service.IEstablishService;
import kr.or.ddit.util.model.PageVo;

@Controller
public class SlipController {

	private Logger logger = LoggerFactory.getLogger(SlipController.class);

	@Resource(name = "slipService")
	private ISlipService slipService;

	@Resource(name = "deptService")
	private IDeptService deptService;

	@Resource(name = "establishService")
	private IEstablishService establishService;

	@Resource(name = "slip_detailService")
	private ISlip_detailService slip_detailService;

	@RequestMapping("/deleteSlip")
	public String deleteSlip(String slipnumber){
		slipService.deleteSlip(slipnumber);
		logger.debug("확인 : {}",slipnumber);
		return "redirect:/paaprovuar";
	}
	
	@RequestMapping("/slipview")
	public String slipView(PageVo pageVo, Model model) {

		Map<String, Object> resultMap = slipService.selectSlipPagingList(pageVo);
		model.addAllAttributes(resultMap);
		model.addAttribute("pageSize", pageVo.getPageSize());
		model.addAttribute("page", pageVo.getPage());

		return "slipview";
	}

	@RequestMapping("/getSlipPageList")
	public String getSlipPageList(PageVo pageVo, Model model) {

		Map<String, Object> resultMap = slipService.selectSlipPagingList(pageVo);
		model.addAllAttributes(resultMap);
		model.addAttribute("pageSize", pageVo.getPageSize());
		model.addAttribute("page", pageVo.getPage());

		return "slip/slipAjaxHtml";
	}

	@RequestMapping("/getSlipInsertBtn")
	public String getSlipInsertBtn(Model model) {

		List<DeptVo> deptList = deptService.getAllDept();
		model.addAttribute("deptList", deptList);

		int slipNumber = slipService.getSlipCnt(null);
		slipNumber++;
		model.addAttribute("slipNumber", slipNumber);

		List<EstablishVo> establishList = establishService.getAllEstablish();
		model.addAttribute("establishList", establishList);

		return "slip/insertSlipAjax";
	}

	@RequestMapping("/establishSearchUseSlip")
	public String establishSearchUseSlip(@RequestParam(name = "searchEstablishValue2") String searchEstablishValue2,
			Model model) {

		List<EstablishVo> searchResultData = establishService.selectEstablishByNm(searchEstablishValue2);

		model.addAttribute("searchResultData", searchResultData);

		return "slip/slipSearchAjaxHtml";
	}

	@RequestMapping("/cancleOnlySlip")
	@ResponseBody
	public String cancleOnlySlip(@RequestParam("slipNumber") String slipNumber) {
		slipService.deleteSlip(slipNumber);
		return "전표입력 정상취소";
	}

	@RequestMapping("/finalSaveSlip")
	@ResponseBody
	public String finalSaveSlip(@RequestParam("slipNumber") String slipNumber, @RequestParam("total") String total,
			@RequestParam("slipDate") String slipDate, @RequestParam("insertDept") String dept,
			@RequestParam("juckyo") String juckyo) {

		SlipVo slipVo = new SlipVo();
		slipVo.setSlipNumber(slipNumber);
		slipVo.setTotal(total);
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
		Date date = null;
		try {
			date = sdf.parse(slipDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		slipVo.setSlipDate(date);
		slipVo.setDepartmentName(dept);
		slipVo.setJukyo(juckyo);

		slipService.finalSaveSlip(slipVo);

		return "";
	}

	@RequestMapping("/insertSlip")
	public String insertSlip(WriteSlipVo vo) throws ParseException {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = sdf.parse(vo.getSlipdate()[0]);

		SlipVo slipVo = new SlipVo();
		slipVo.setSlipDate(date);
		String[] price = vo.getPrice();
		int total = 0;
		for (int i = 0; i < price.length; i++) {
			total += Integer.parseInt(price[i]);
		}
		slipVo.setTotal(Integer.toString(total/2));
		slipVo.setDepartmentName(vo.getDepartmentName()[0]);
		slipVo.setJukyo(vo.getJukyo()[0]);
		logger.debug("확인 : {}", vo);
		slipService.insertSlip(slipVo);
		for (int i = 0; i < price.length; i++) {
			Slip_detailVo sdvo = new Slip_detailVo((i + 1) + "", vo.getStatus()[i], price[i], vo.getClientCard()[i],
					slipVo.getSlipNumber(), vo.getEstablishCode()[i]);
			slip_detailService.insertDetailSlip(sdvo);
		}
		return "redirect:/slipview";
	}

}
