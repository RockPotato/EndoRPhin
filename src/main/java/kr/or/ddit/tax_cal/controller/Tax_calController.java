package kr.or.ddit.tax_cal.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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

import kr.or.ddit.company.model.DeptVo;
import kr.or.ddit.company.service.IDeptService;
import kr.or.ddit.constant.SalesCodeConstant;
import kr.or.ddit.order.model.ClientVo;
import kr.or.ddit.order.service.ICilentService;
import kr.or.ddit.tax_cal.model.Sales_detailVo;
import kr.or.ddit.tax_cal.model.Tax_calVo;
import kr.or.ddit.tax_cal.service.IEstablishService;
import kr.or.ddit.tax_cal.service.ISales_detailService;
import kr.or.ddit.tax_cal.service.ITax_calService;
import kr.or.ddit.util.model.PageVo;

@Controller
public class Tax_calController {
	
	private Logger logger = LoggerFactory.getLogger(Tax_calController.class);
	
	@Resource(name="clientService")
	private ICilentService clientService;
	
	@Resource(name="deptService")
	private IDeptService deptService;
	
	@Resource(name="tax_calService")
	private ITax_calService tax_calService;
	
	@Resource(name="sales_detailService")
	private ISales_detailService sales_detailService;
	
	@Resource(name="establishService")
	IEstablishService establishService;
	
	
	// 최초 페이지 뷰
	@RequestMapping(path="taxcalview", method=RequestMethod.GET)
	public String taxcallview(PageVo pageVo, Model model) {
		
		Map<String, Object> resultMap = tax_calService.selecTax_calPagingList(pageVo);
		model.addAllAttributes(resultMap);
		model.addAttribute("pageSize", pageVo.getPageSize());
		model.addAttribute("page", pageVo.getPage());
		
		model.addAttribute("scCode", SalesCodeConstant.salesCode);
		model.addAttribute("phCode", SalesCodeConstant.purchaseCode);
		
		return "taxcalview";
	}

	
	
	// ajax를 통한 페이징 뷰
	@RequestMapping("/getTax_calPageList")
	public String getTax_calPageList(PageVo pageVo, Model model) {
		
		Map<String, Object> resultMap = tax_calService.selecTax_calPagingList(pageVo);
		model.addAllAttributes(resultMap);
		model.addAttribute("pageSize", pageVo.getPageSize());
		model.addAttribute("page", pageVo.getPage());
		
		return "taxcal/taxcalAjaxPaging";
	}
	
	
	
	// Ajax를 통해 거래처 데이터 가져오기
	@RequestMapping("/findClient")
	public String findClient(Model model) {
		List<ClientVo> clientList = clientService.getAllClient(); 
		model.addAttribute("clientList", clientList);
			
		return "taxcal/findClient";
	}
	
	
	
	// Ajax를 통해 부서 데이터 가져오기
	@RequestMapping("/findDept")
	public String findDept(Model model) {
		List<DeptVo> deptList = deptService.getAllDept();
		model.addAttribute("deptList", deptList);
		
		return "taxcal/findDept";
	}
	
	
	// Ajax를 통해 발주번호 데이터 가져오기 (개발예정)
	@RequestMapping("/findOrderCode")
	public String findOrderCode(Model model) {
		
		/*개발 예정*/
		model.addAttribute("developYet", "developYet");
		
		return "taxcal/findOrderCode";
	}
	
	
	// Ajax를 통해 입력폼의 html을 로드
	@RequestMapping("/openInsertViewArea")
	@ResponseBody
	public String openInsertViewArea(	@RequestParam(name="slipDate")String slipDate
								,		@RequestParam(name="supplyValue")String supplyValue
								,		@RequestParam(name="surtax")String surtax
								,		@RequestParam(name="sumValue")String sumValue	
								,		@RequestParam(name="salesStatus")String salesStatus	
								,		@RequestParam(name="clientName")String clientName	
								,		@RequestParam(name="deptName", defaultValue="미등록")String deptName	
								,		@RequestParam(name="auto")String auto	
								,		@RequestParam(name="slipType")String slipType	
			) {
		
		
		
		logger.debug("slipDate : {}", slipDate);
		logger.debug("supplyValue : {}", supplyValue);
		logger.debug("surtax : {}", surtax);
		logger.debug("sumValue : {}", sumValue);
		logger.debug("salesStatus : {}", salesStatus);
		logger.debug("clientName : {}", clientName);
		logger.debug("deptName : {}", deptName);
		logger.debug("auto : {}", auto);
		logger.debug("slipType : {}", slipType);
		
		return "Connection";
		
	}
	
	@RequestMapping("/openInsertViewAreaLoad")
	public String openInsertViewAreaLoad(@RequestParam("slipType")String slipType
										,@RequestParam("salesStatus")String salesStatus
										,@RequestParam("supplyValue")String supplyValue
										,@RequestParam("surtax")String surtax
										,@RequestParam("sumValue")String sumValue
										,@RequestParam("clientCode")String clientCode
										,@RequestParam("clientName")String clientName
										,@RequestParam("slipDate")String slipDate
										,@RequestParam("deptCode")String deptCode
										,@RequestParam("auto")String auto
										,Model model) {
			
			model.addAttribute("slipType", slipType);
			model.addAttribute("salesStatus", salesStatus);
			model.addAttribute("supplyValue", supplyValue);
			model.addAttribute("surtax", surtax);
			model.addAttribute("sumValue", sumValue);
			model.addAttribute("clientCode", clientCode);
			model.addAttribute("clientName", clientName);
			model.addAttribute("slipDate", slipDate);
			model.addAttribute("deptCode", deptCode);
			model.addAttribute("auto", auto);
			
		return "taxcal/openInsertViewArea";
		
	}
	
	
	@RequestMapping("/inesrtTax_calAjax")
	@ResponseBody
	public String inesrtTax_calAjax(	@RequestParam(name="insertSlipDate")String SlipDate
									,	@RequestParam(name="insertSupplyValue") String supplyValue
									,	@RequestParam(name="insertSalesStatus") String salesStatus
									,	@RequestParam(name="insertDeptCode", defaultValue="회사전체") String deptCode
									,	@RequestParam(name="insertSurtax", defaultValue="0") String surtax
									,	@RequestParam(name="insertClientName", defaultValue="미등록") String clientName
									,	@RequestParam(name="insertSumValue") String sumValue
									,	@RequestParam(name="insertAuto", defaultValue="여") String auto
									,	@RequestParam(name="insertEntryType", defaultValue="미등록") String entryType
	) throws ParseException{
		
		
		// 문자열 수정 : databases format으로 변경
		sumValue = sumValue.replaceAll(",", "");
		supplyValue = supplyValue.replaceAll(",", "");
		surtax = surtax.replaceAll(",", "");
		
		SimpleDateFormat df = new SimpleDateFormat("yy/MM/dd");
		Date date = df.parse(SlipDate);
		
		String salesCode = tax_calService.getTax_seqNextval();
		
		
		Tax_calVo tax_calVo = new Tax_calVo();
		
		tax_calVo.setSalesCode(salesCode);
		tax_calVo.setSlipDate(date);
		tax_calVo.setSalesStatus(salesStatus);
		tax_calVo.setDeptCode(deptCode);
		tax_calVo.setClientName(clientName);
		tax_calVo.setAuto(auto);
		tax_calVo.setEntryType(entryType);
		tax_calVo.setnSumValue(sumValue);
		tax_calVo.setnSupplyValue(supplyValue);
		tax_calVo.setnSurtax(surtax);
		
		tax_calService.insertTax_cal(tax_calVo);
		
		
		return salesCode;
	}
	
	
	@RequestMapping("/inesrtSales_detail")
	@ResponseBody
	public String inesrtSales_detail(Sales_detailVo sales_detailVo) {
		
		sales_detailVo.setPrice(sales_detailVo.getPrice().replace(",", ""));
		
		int cnt = sales_detailService.insertSales_detail(sales_detailVo);
		
		return "insert ajax detail sales";
	}
	
	
	@RequestMapping("/sales_detailView")
	public String sales_detailView(@RequestParam(name="salesCode")String salesCode
								,Model model ) {
			
		List<Sales_detailVo> sales_detailList = sales_detailService.selectSales_detail(salesCode);
		model.addAttribute("sales_detailList", sales_detailList);
			
		return "taxcal/sales_detailView";
	}
	
	
	@RequestMapping("/updateSales_detail")
	@ResponseBody
	public String updateSales_detail(Sales_detailVo sales_detailVo, @RequestParam("sumPrice")String sumPrice) {
		
		sales_detailVo.setPrice(sales_detailVo.getPrice().replaceAll(",", ""));
		sales_detailService.updateSales_detail(sales_detailVo);
		
		//===================================================================
		String updateSumValue = sumPrice.replaceAll(",", "");
		
		int supplyValue = Integer.parseInt(updateSumValue);
		supplyValue = (int) (supplyValue * 0.9);
		int surtax = Integer.parseInt(updateSumValue) - supplyValue;
		
		Tax_calVo tax_calVo = new Tax_calVo();
		tax_calVo.setSalesCode(sales_detailVo.getSalesCode());
		tax_calVo.setnSumValue(updateSumValue);
		tax_calVo.setnSupplyValue(supplyValue + "");
		tax_calVo.setnSurtax(surtax + "");
		
		tax_calService.updateTax_cal(tax_calVo);
		
		return "update Data";
	}
	
	
	@RequestMapping("/deletetax_cal")
	@ResponseBody
	public String deletetax_cal(@RequestParam("salesCode")String salesCode) {
		
		sales_detailService.deleteSales_detail(salesCode);
		
		tax_calService.deleteTax_cal(salesCode);
		
		return "delete Data";
	}
	
	
	@RequestMapping("/tax_report")
	public String tax_report( Model model) {
		
			
		return "tax_report";
	}
	
	
	@RequestMapping("/searchTax_report")
	public String searchTax_report(@RequestParam("startDate")String startDate
								,@RequestParam("endDate")String endDate
								,Model model) {
		
		
		List<Map<String,String>> map51 = tax_calService.selectBy51(startDate, endDate);
		
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		
		model.addAttribute("map51", map51);
		
		return "taxcal/tax_reportView"; 
	}

}
