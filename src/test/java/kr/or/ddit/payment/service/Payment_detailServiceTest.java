package kr.or.ddit.payment.service;

import static org.junit.Assert.*;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.payment.model.Payment_detailVo;
import kr.or.ddit.set.LogicConfig;

public class Payment_detailServiceTest extends LogicConfig{

	@Resource(name="payment_detailService")
	IPayment_DetailService payment_detailService;
	
	@Test
	public void insertPayment_detailTest() {
		Payment_detailVo payment_detailVo= new Payment_detailVo();
		payment_detailVo.setDeductCode("3");
		payment_detailVo.setPayCode("2");
		payment_detailVo.setDeductPay("2000000");
		int insertPayment_detail = payment_detailService.insertPayment_detail(payment_detailVo);
		assertEquals(1, insertPayment_detail);
	}
	@Test
	public void getAllPayment_detailTest() {
		List<Payment_detailVo> allPayment_detail = payment_detailService.getAllPayment_detail();
		assertTrue(allPayment_detail.size()>0);
	}
	@Test
	public void selectPayment_detailTest() {
		Payment_detailVo selectPayment_detail = payment_detailService.selectPayment_detail(new Payment_detailVo("3","1"));
		assertNotNull(selectPayment_detail);
	}
	@Test
	public void deletePayment_detailTest() {
		int deletePayment_detail = payment_detailService.deletePayment_detail(new Payment_detailVo("3","2"));
		assertEquals(1, deletePayment_detail);
	}
	@Test
	public void selectPayment_detailStatusTest() {
		List<Payment_detailVo> selectPayment_detailStatus = payment_detailService.selectPayment_detailPaycode("1");
		assertTrue(selectPayment_detailStatus.size()>0);
	}
	@Test
	public void getDeNmPayListTest() {
		Map<String, Object> deNmPayList = payment_detailService.getDeNmPayList("1");
		
		assertTrue(deNmPayList.size()>0);
	}

}
