package kr.or.ddit.payment.service;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.payment.dao.IPayment_reportDao;
import kr.or.ddit.payment.model.Payment_reportVo;
import kr.or.ddit.set.LogicConfig;

public class Payment_reportServiceTest extends LogicConfig{
	@Resource(name="paymentreportService")
	IPayment_reportService paymentreportService;
	
	@Test
	public void insertPayment_reportTest() {
		Payment_reportVo payment_reportVo = new Payment_reportVo();
		payment_reportVo.setPaymentReportCode("2");
		payment_reportVo.setPayCode("1");
		int insertPayment_report = paymentreportService.insertPayment_report(payment_reportVo);
		assertEquals(1, insertPayment_report);
	}
	@Test
	public void getAllPayment_reportTest() {
		List<Payment_reportVo> allPayment_report = paymentreportService.getAllPayment_report();
		assertTrue(allPayment_report.size()>0);
	}
	@Test
	public void selectPayment_reportTest() {
		Payment_reportVo selectPayment_report = paymentreportService.selectPayment_report("1");
		assertNotNull(selectPayment_report);
	}
	@Test
	public void deletePayment_reportTest() {
		int deletePayment_report = paymentreportService.deletePayment_report("2");
		assertEquals(1, deletePayment_report);
	}

}
