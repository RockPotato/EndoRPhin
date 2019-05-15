package kr.or.ddit.payment.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.employee.model.EmployeeVo;
import kr.or.ddit.employee.service.IEmployeeService;
import kr.or.ddit.login.LoginController;
import kr.or.ddit.payment.model.De_product_divVo;
import kr.or.ddit.payment.model.Payment2SlipVo;
import kr.or.ddit.payment.model.Payment4SlipVo;
import kr.or.ddit.payment.model.PaymentVo;
import kr.or.ddit.payment.model.Payment_detailVo;
import kr.or.ddit.payment.model.Payment_reportVo;
import kr.or.ddit.payment.model.Payment4UpdVo;
import kr.or.ddit.payment.service.IDe_Product_divService;
import kr.or.ddit.payment.service.IPaymentService;
import kr.or.ddit.payment.service.IPayment_DetailService;
import kr.or.ddit.payment.service.IPayment_reportService;
import kr.or.ddit.slip.model.SlipVo;
import kr.or.ddit.slip.model.Slip_detailVo;
import kr.or.ddit.slip.service.ISlipService;
import kr.or.ddit.slip.service.ISlip_detailService;
import kr.or.ddit.tax_cal.model.EstablishVo;
import kr.or.ddit.tax_cal.service.IEstablishService;
import kr.or.ddit.util.model.PageVo;

@Controller
public class PaymentController {

	private Logger logger = LoggerFactory.getLogger(PaymentController.class);

	@Autowired
	private JavaMailSender mailSender;

	@Resource(name = "establishService")
	IEstablishService establishService;

	@Resource(name = "employeeService")
	IEmployeeService employeeService;

	@Resource(name = "paymentService")
	IPaymentService paymentService;

	@Resource(name = "de_product_divService")
	IDe_Product_divService de_product_divService;

	@Resource(name = "payment_detailService")
	IPayment_DetailService payment_detailService;

	@Resource(name = "slipService")
	ISlipService slipService;

	@Resource(name = "slip_detailService")
	ISlip_detailService slip_detailService;

	@Resource(name = "payment_reportService")
	IPayment_reportService payment_reportService;

	// 급여 명세서 메일 발송
	@RequestMapping(path = "/sendPaymentMail", method = RequestMethod.POST)
	@ResponseBody
	public String sendPaymentMail(String[] htmlText, String[] email,HttpSession session) {
		int check = 0;
		try {
			ServletContext servletContext = session.getServletContext();
			for (int j = 0; j < email.length; j++) {
				fileWrite(servletContext.getContextPath(),htmlText[j]);
				MimeMessage message = mailSender.createMimeMessage();
				message.setContent("<h1>EndoRPhin</h1>", "text/html");
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				messageHelper.setFrom(LoginController.setfrom); // 보내는사람 생략하거나
																// 하면 정상작동을 안함
				messageHelper.setTo(email[j]); // 받는사람 이메일
				messageHelper.setSubject("급여 명세서"); // 메일제목은 생략이 가능하다
				messageHelper.setText(
						"급여 명세서 파일입니다. 수고하셨습니다.",
						true);
				messageHelper.addAttachment((new Date().getMonth()+1)+"월 명세서.html", new File(servletContext.getContextPath()+"/upload/tempHtml.html"));
				mailSender.send(message);
				check++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Integer.toString(check);
	}

	private void fileWrite(String path, String string) {
			String writeStr = "<html><head><style>.table{width:100%;max-width:100%;margin-bottom:20px}.table>tbody>tr>td,.table>tbody>tr>th,.table>tfoot>tr>td,.table>tfoot>tr>th,.table>thead>tr>td,.table>thead>tr>th{padding:8px;line-height:1.42857143;vertical-align:top;border-top:1px solid #ddd}.table>thead>tr>th{vertical-align:bottom;border-bottom:2px solid #ddd}.table>caption+thead>tr:first-child>td,.table>caption+thead>tr:first-child>th,.table>colgroup+thead>tr:first-child>td,.table>colgroup+thead>tr:first-child>th,.table>thead:first-child>tr:first-child>td,.table>thead:first-child>tr:first-child>th{border-top:0}.table>tbody+tbody{border-top:2px solid #ddd}.table .table{background-color:#fff}.table-condensed>tbody>tr>td,.table-condensed>tbody>tr>th,.table-condensed>tfoot>tr>td,.table-condensed>tfoot>tr>th,.table-condensed>thead>tr>td,.table-condensed>thead>tr>th{padding:5px}.table-bordered{border:1px solid #ddd}.table-bordered>tbody>tr>td,.table-bordered>tbody>tr>th,.table-bordered>tfoot>tr>td,.table-bordered>tfoot>tr>th,.table-bordered>thead>tr>td,.table-bordered>thead>tr>th{border:1px solid #ddd}.table-bordered>thead>tr>td,.table-bordered>thead>tr>th{border-bottom-width:2px}.table-striped>tbody>tr:nth-of-type(odd){background-color:#f9f9f9}.table-hover>tbody>tr:hover{background-color:#f5f5f5}.table-striped tbody tr:nth-of-type(odd){background-color:rgba(0,0,0,.05)}.table-dark.table-striped tbody tr:nth-of-type(odd){background-color:rgba(255,255,255,.05)}</style></head><body><div style=\"margin: 50px 200px;\""
					+ "'><h2>급여 명세서</h2>"
					+ string + "</div></body></html>";
			byte[] bytes = writeStr.getBytes();
			FileOutputStream fos;
			try {
				fos = new FileOutputStream(new File(path+"/upload/tempHtml.html"),false);
				fos.write(bytes);
				fos.close();
			}catch (FileNotFoundException e1) {
				e1.printStackTrace();
			}catch (IOException e) {
				e.printStackTrace();
			}
	}

	// 급여 명쇄서 인쇄
	@RequestMapping(path = "/goPaymentPrint")
	public String goPaymentPrint(Model model, String paydayYear, String paydayMonth) {
		String payDay = paydayYear + paydayMonth;
		if (paydayYear == null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
			payDay = sdf.format(new Date());
		}
		List<PaymentVo> selectTotalSalaryByDay = paymentService.selectTotalSalaryByDay(payDay);
		model.addAttribute("paymentList", selectTotalSalaryByDay);
		return "paymentPrint";
	}

	// 급여 전표 등록 이벤트
	@RequestMapping(path = "/writeSlipPayment", method = RequestMethod.POST)
	public String writeSlipPayment(Payment2SlipVo list) {
		SlipVo slipVo = new SlipVo(list.getTotal(), new Date(), list.getPaydayMonth() + "월 급여");
		slipService.insertSlip(slipVo);
		for (int i = 0; i < list.getPrice().length; i++) {
			slip_detailService.insertDetailSlip(new Slip_detailVo((i + 1) + "", list.getStatus()[i], list.getPrice()[i],
					list.getClientCard()[i], slipVo.getSlipNumber(), list.getEstablishCode()[i]));
		}
		payment_detailService.updateForSlip(list.getPaydayMonth());

		return "redirect:/slipview";
	}

	// 급여 전표 등록 화면 이동
	@RequestMapping(path = "/gotoSlipInput", method = RequestMethod.POST)
	public String gotoSlipInput(Payment4SlipVo vo, Model model) {
		model.addAllAttributes(payment_detailService.selectPayment_detailSlip(vo));
		return "paymentslipInput";
	}

	// 급여 명세서 장부반영 이벤트
	@RequestMapping(path = "/getPaymentForSlip", produces = { "application/json" })
	@ResponseBody
	public Map<String, Object> paymentYearDetail(String paydayMonth, String deptDiv) {
		Map<String, Object> map = new HashMap<>();
		map.put("allEstablish", establishService.getAllEstablish());
		if (deptDiv.equals("1")) {
			map.put("deptList", paymentService.selectDeptNPayment(paydayMonth));
		} else {
			map.put("deptList", paymentService.selectTotalSalaryByDay(paydayMonth));
		}
		map.put("payCodeList", paymentService.selectYearPaymentListDetail(paydayMonth));
		return map;
	}

	// 유저 이름으로 검색
	@RequestMapping(path = "/searchUserNmToPayment", produces = { "application/json" })
	@ResponseBody
	public List<EmployeeVo> searchUserNmToPayment(String usernm) {
		return employeeService.selectUserByNm(usernm);
	}

	// 연도별 급여 조회 상세 내역 이벤트
	@RequestMapping(path = "/paymentYearDetail", method = RequestMethod.GET)
	public String paymentYearDetail(String userid, String paydayYear, Model model) {
		Map<String, Object> map = new HashMap<>();
		if (userid != null) {
			map.put("userid", userid);
		}
		map.put("paydayYear", paydayYear);
		model.addAllAttributes(payment_detailService.getPayDetailByYear(map));
		if (userid == null) {
			return "paymentCalDetail";
		}
		return "paymentYearDetail";
	}

	// 연도별 급여 조회
	@RequestMapping(path = "/paymentYear", method = RequestMethod.GET)
	public String paymentYear(String userid, String paydayYear, Model model) {
		model.addAttribute("employeeList", employeeService.getAllEmployee());
		Map<String, Object> map = new HashMap<>();
		if (paydayYear == null)
			paydayYear = "2019";
		map.put("paydayYear", paydayYear);
		map.put("userid", userid);
		model.addAttribute("paydayYear", paydayYear);
		model.addAttribute("paymentYearList", paymentService.selectPersonalPaymentList(map));
		return "paymentYear";
	}

	// 개인별 급여 조회
	@RequestMapping(path = "/paymentPersonal", method = RequestMethod.GET)
	public String paymentPersonal(String userid, String paydayTo, String paydayFrom, Model model) {
		model.addAttribute("employeeList", employeeService.getAllEmployee());
		List<PaymentVo> selectPersonalPaymentList;

		Map<String, Object> map = new HashMap<>();
		map.put("paydayTo", paydayTo);
		map.put("paydayFrom", paydayFrom);
		map.put("userid", userid);
		model.addAllAttributes(map);
		selectPersonalPaymentList = paymentService.selectPersonalPaymentList(map);
		model.addAttribute("selectPersonalPaymentList", selectPersonalPaymentList);

		return "paymentPersonal";
	}

	// 급여 명세서 리스트
	@RequestMapping(path = "/paymentCal", method = RequestMethod.GET)
	public String paymentCal(Model model, String paydayYear, String paydayMonth) {
		String payDay = paydayYear + paydayMonth;
		if (paydayYear == null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
			payDay = sdf.format(new Date());
		}
		List<PaymentVo> selectTotalSalaryByDay;
		selectTotalSalaryByDay = paymentService.selectTotalSalaryByDay(payDay);

		model.addAttribute("paymentList", selectTotalSalaryByDay);
		model.addAttribute("paydayYear", paydayYear);
		model.addAttribute("paydayMonth", paydayMonth);
		return "paymentCal";
	}

	// 급여 계산
	@RequestMapping(path = "/paymentAdjust")
	public String paymentAdjust(Model model, String paydayYear, String paydayMonth) {
		PaymentVo selectPayment_reportByMonth;
		if (paydayYear != null)
		{
			if(Integer.parseInt(paydayMonth)<10){
				selectPayment_reportByMonth = payment_reportService
						.selectPayment_reportByMonth(paydayYear + "0" + paydayMonth);
			}else{
				selectPayment_reportByMonth = payment_reportService
						.selectPayment_reportByMonth(paydayYear + paydayMonth);
			}
		}
		else
			selectPayment_reportByMonth = payment_reportService.selectPayment_reportByMonth(null);

		model.addAttribute("paymentVo", selectPayment_reportByMonth);
		return "paymentAdjustView";
	}

	// 급여 삭제 이벤트
	@RequestMapping(path = "/deletePayment", produces = { "application/json" })
	@ResponseBody
	public Map<String, Object> deletePayment(String paycode, String userid) {
		paymentService.deletePayment(paycode);
		return getPaymentList(userid, null);
	}

	// 급여 수정
	@RequestMapping(path = "/updatePaymentDetailAjax", produces = { "application/json" })
	@ResponseBody
	public Map<String, Object> updatePaymentDetailAjax(@RequestBody Payment4UpdVo testVo) {

		paymentService.updatePaymentDetailAjax(testVo);
		Map<String, Object> paymentList = getPaymentList(testVo.getUserid(), null);
		return paymentList;
	}

	// 급여 등록
	@RequestMapping(path = "/insertAndUpdatePayment", produces = { "application/json" })
	@ResponseBody
	public Map<String, Object> insertAndUpdatePayment(@RequestBody Payment4UpdVo testVo) {
		boolean updateAndInsertPayment = paymentService.updateAndInsertPayment(testVo);
		Map<String, Object> paymentList = getPaymentList(testVo.getUserid(), null);
		paymentList.put("msg", updateAndInsertPayment);
		return paymentList;
	}

	// 개인별 급여 조회
	@RequestMapping(path = "/getPaymentListPersonal", method = RequestMethod.GET, produces = { "application/json" })
	@ResponseBody
	public Map<String, Object> getPaymentListPersonal(String userid, String payday) {
		String payCode = paymentService.paycodeByIdnDay(new PaymentVo(userid, payday));
		return payment_detailService.getPayDetail(payCode);
	}

	@RequestMapping(path = "/getPaymentList", method = RequestMethod.GET, produces = { "application/json" })
	@ResponseBody
	public Map<String, Object> getPaymentList(String userid, String payCode) {
		Map<String, Object> deNmPayList = null;
		if (userid != null) {
			deNmPayList = payment_detailService.getDeNmPayList(userid);
		} else {
			deNmPayList = payment_detailService.getPayDetail(payCode);
		}

		return deNmPayList;
	}

	@RequestMapping(path = "/addProduct", method = RequestMethod.GET)
	public String addProduct(Model model, De_product_divVo de_product_divVo, String searchDeductName) {
		if (searchDeductName == null) {
			List<De_product_divVo> allDe_product_div = de_product_divService.getDe_product_div("1");
			model.addAttribute("allDe_product_div", allDe_product_div);
		} else {
			de_product_divVo.setDeductName(searchDeductName);
			List<De_product_divVo> selectDeproductByNm = de_product_divService.selectDeproductByNm(de_product_divVo);
			model.addAttribute("allDe_product_div", selectDeproductByNm);
		}
		return "addProductView";
	}

	@RequestMapping(path = "/addDeduct", method = RequestMethod.GET)
	public String addDeduct(Model model, De_product_divVo de_product_divVo, String searchDeductName) {
		if (searchDeductName == null) {
			List<De_product_divVo> allDe_product_div = de_product_divService.getDe_product_div("2");
			model.addAttribute("allDe_product_div", allDe_product_div);
		} else {
			de_product_divVo.setDeductName(searchDeductName);
			List<De_product_divVo> selectDeproductByNm = de_product_divService.selectDeproductByNm(de_product_divVo);
			model.addAttribute("allDe_product_div", selectDeproductByNm);

		}
		return "addDeductView";
	}

	@RequestMapping(path = "/delDeproduct", method = RequestMethod.GET)
	public String delDeproduct(Model model, String[] deductCode, String deprostatus) {
		for (String str : deductCode) {
			de_product_divService.deleteDe_product_div(str);
		}
		if (deprostatus.equals("1")) {
			return "redirect:/addProduct";
		} else {
			return "redirect:/addDeduct";
		}
	}

	@RequestMapping(path = "/addDeproduct", method = RequestMethod.POST)
	public String addDeproduct_post(Model model, De_product_divVo de_product_divVo) {
		de_product_divService.insertDe_product_div(de_product_divVo);
		if (de_product_divVo.getDeprostatus().equals("1")) {
			return "redirect:/addProduct";
		} else {
			return "redirect:/addDeduct";
		}
	}

	@RequestMapping(path = "/findDeductCode", method = RequestMethod.GET)
	@ResponseBody
	public String findDeductCode(Model model, String deductCode) {
		De_product_divVo selectDe_product_div = de_product_divService.selectDe_product_div(deductCode);
		if (selectDe_product_div == null) {
			return "1"; // 중복 x
		} else {
			return "2"; // 중복
		}
	}

	@RequestMapping(path = "/findDeductCode", method = RequestMethod.POST, produces = { "application/json" })
	@ResponseBody
	public De_product_divVo findDeductCode_post(Model model, De_product_divVo selectDe_product_div) {
		selectDe_product_div = de_product_divService.selectDe_product_div(selectDe_product_div.getDeductCode());
		return selectDe_product_div;
	}

	@RequestMapping(path = "/updDeduct", method = RequestMethod.GET)
	public String updDeduct(De_product_divVo selectDe_product_div) {
		de_product_divService.updateDe_product_div(selectDe_product_div);
		if (selectDe_product_div.getDeprostatus().equals("1")) {
			return "redirect:/addProduct";
		} else {
			return "redirect:/addDeduct";
		}
	}

	@RequestMapping(path = "/addPayment", method = RequestMethod.GET)
	public String addPaymentView(PageVo pageVo, String searchPaymentName, Model model) {
		if (searchPaymentName == null) {
			model.addAllAttributes(paymentService.getPaymentList(pageVo));
			model.addAttribute("pageSize", pageVo.getPageSize());
			model.addAttribute("page", pageVo.getPage());
		} else {
			model.addAttribute("paymentList", paymentService.getPaymentListByUserNm(searchPaymentName));
		}
		return "addPaymentView";
	}

	@RequestMapping(path = "/getPaymentForAdjust")
	@ResponseBody
	public Map<String, Object> getPaymentForAdjust(String payDay, boolean printCheck) {
		Map<String, Object> map = new HashMap<>();
		List<PaymentVo> paymentForAdjust = paymentService.getPaymentForAdjust(payDay);
		map.put("paymentList", paymentForAdjust);
		if (printCheck) {
			List<EmployeeVo> employeeList = new ArrayList<>();
			for (PaymentVo paymentVo : paymentForAdjust) {
				employeeList.add(employeeService.selectEmployee(paymentVo.getUserId()));
			}
			map.put("employeeList", employeeList);

		}
		return map;
	}

	@RequestMapping(path = "/insertPaymentReport", method = RequestMethod.POST)
	public String insertPaymentReport(String paymentDate, String[] payCode) {
		payment_reportService.insertPaymentReport(paymentDate, payCode);
		return "redirect:/paymentAdjust";
	}

	@RequestMapping(path = "/cogCheck")
	@ResponseBody
	public int cogCheck(String paymentDate) {
		String[] split = paymentDate.split("-");
		paymentDate = split[0] + split[1];
		PaymentVo selectPayment_reportByMonth = payment_reportService.selectPayment_reportByMonth(paymentDate);
		return Integer.parseInt(selectPayment_reportByMonth.getTotalSalary());
	}

	@RequestMapping(path = "/deletePaymentReport")
	public String deletePaymentReport(String paymentDate) {
		String[] split = paymentDate.split("-");
		payment_reportService.deletePayment_report(split[0] + split[1]);
		return "redirect:/paymentAdjust";
	}
}
