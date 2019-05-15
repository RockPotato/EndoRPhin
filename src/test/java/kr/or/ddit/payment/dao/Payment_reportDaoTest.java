package kr.or.ddit.payment.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.payment.model.Payment_reportVo;
import kr.or.ddit.set.LogicConfig;

public class Payment_reportDaoTest extends LogicConfig{

	private Logger logger = LoggerFactory.getLogger(Payment_reportDaoTest.class);
	@Resource(name="payment_reportDao")
	IPayment_reportDao paymentreportDao;
	
	@Test
	public void insertPayment_reportTest() {
		Payment_reportVo payment_reportVo = new Payment_reportVo();
		payment_reportVo.setPaymentReportCode("2");
		payment_reportVo.setPayCode("1");
		int insertPayment_report = paymentreportDao.insertPayment_report(payment_reportVo);
		assertEquals(1, insertPayment_report);
	}
	@Test
	public void getAllPayment_reportTest() {
		List<Payment_reportVo> allPayment_report = paymentreportDao.getAllPayment_report();
		assertTrue(allPayment_report.size()>0);
	}
	@Test
	public void selectPayment_reportTest() {
		Payment_reportVo selectPayment_report = paymentreportDao.selectPayment_report("1");
		assertNotNull(selectPayment_report);
	}
	@Test
	public void deletePayment_reportTest() {
		int deletePayment_report = paymentreportDao.deletePayment_report("2");
		assertEquals(1, deletePayment_report);
	}
	@Test
	public void countDeadline4prospectTest() {
		List<String> countDeadline4prospect = paymentreportDao.countDeadline4prospect();
		for (int i = 0; i < countDeadline4prospect.size(); i++) {
			logger.debug("확인 : {}",countDeadline4prospect.get(i));
		}
	}

}
