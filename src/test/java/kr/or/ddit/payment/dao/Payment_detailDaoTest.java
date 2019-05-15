package kr.or.ddit.payment.dao;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.payment.model.De_product_divVo;
import kr.or.ddit.payment.model.Payment_detailVo;
import kr.or.ddit.set.LogicConfig;

public class Payment_detailDaoTest extends LogicConfig{

	private Logger logger = LoggerFactory.getLogger(Payment_detailDaoTest.class);
	
	@Resource(name="payment_detailDao")
	IPayment_DetailDao payment_detailDao;
	
	@Resource(name="de_product_divDao")
	IDe_Product_divDao de_product_divDao;
	
	@Test
	public void insertPayment_detailTest() {
		Payment_detailVo payment_detailVo= new Payment_detailVo();
		payment_detailVo.setDeductCode("3");
		payment_detailVo.setPayCode("2");
		payment_detailVo.setDeductPay("2000000");
		int insertPayment_detail = payment_detailDao.insertPayment_detail(payment_detailVo);
		assertEquals(1, insertPayment_detail);
	}
	@Test
	public void getAllPayment_detailTest() {
		List<Payment_detailVo> allPayment_detail = payment_detailDao.getAllPayment_detail();
		assertTrue(allPayment_detail.size()>0);
	}
	@Test
	public void selectPayment_detailTest() {
		Payment_detailVo selectPayment_detail = payment_detailDao.selectPayment_detail(new Payment_detailVo("3","1"));
		assertNotNull(selectPayment_detail);
	}
	@Test
	public void deletePayment_detailTest() {
		int deletePayment_detail = payment_detailDao.deletePayment_detail(new Payment_detailVo(null,"2"));
		assertEquals(1, deletePayment_detail);
	}
	@Test
	public void selectPayment_detailStatusTest() {
		List<Payment_detailVo> selectPayment_detailStatus = payment_detailDao.selectPayment_detailPaycode("1");
		assertTrue(selectPayment_detailStatus.size()>0);
	}
	@Test
	public void selectPayment_detailSlipTest() {
		List<De_product_divVo> divList = new ArrayList<>();
		divList.addAll(de_product_divDao.getDe_product_div("2"));
		divList.addAll(de_product_divDao.getDe_product_div("3"));
		Map<String, Object> paymap = new HashMap<>();
		paymap.put("divList", divList);
		paymap.put("paydayMonth", "201904");
		List<Payment_detailVo> selectPayment_detailSlip = payment_detailDao.selectPayment_detailSlip(paymap);
		for (Payment_detailVo payment_detailVo : selectPayment_detailSlip) {
			logger.debug("결과:{}",payment_detailVo);
		}
	}

}
