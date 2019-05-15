package kr.or.ddit.payment.service;

import static org.junit.Assert.*;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.payment.model.PaymentVo;
import kr.or.ddit.set.LogicConfig;
import kr.or.ddit.util.model.PageVo;

public class PaymentServiceTest extends LogicConfig{

	private Logger logger = LoggerFactory.getLogger(PaymentServiceTest.class);
	
	@Resource(name="paymentService")
	IPaymentService paymentService;

	@Test
	public void insertPaymentTest() {
		PaymentVo paymentVo = new PaymentVo();
		paymentVo.setPayCode("2");
		paymentVo.setUserId("1");
		int insertPayment = paymentService.insertPayment(paymentVo);
		assertEquals(1, insertPayment);
	}
	@Test
	public void getAllPaymentTest() {
		List<PaymentVo> allPayment = paymentService.getAllPayment();
		assertTrue(allPayment.size()>0);
	}
	@Test
	public void selectPaymentTest() {
		PaymentVo selectPayment = paymentService.selectPayment("1");
		assertNotNull(selectPayment);
	}
	@Test
	public void deletePaymentTest() {
		int deletePayment = paymentService.deletePayment("2");
		assertEquals(1, deletePayment);
	}
	@Test
	public void getPayment_uTest() {
		List<PaymentVo> payment_u = paymentService.getPayment_u("1");
		assertTrue(payment_u.size()>0);
	}
	@Test
	public void getPaymentListTest() {
		Map<String, Object> allPayment = paymentService.getPaymentList(new PageVo());
		assertTrue(allPayment.size()>0);
	}
	@Test
	public void getPaymentListByUserNmTest() {
		List<PaymentVo> allPayment = paymentService.getPaymentListByUserNm("호");
		assertTrue(allPayment.size()>0);
	}
	@Test
	public void paycodeByIdnDayTest() {
		PaymentVo paymentVo = new PaymentVo("1", "2019-04-02");
		String paycodeByIdnDay = paymentService.paycodeByIdnDay(paymentVo);
		logger.debug("asdfsadf:{}",paycodeByIdnDay);
	}
}
