package kr.or.ddit.payment.dao;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.payment.model.PaymentVo;
import kr.or.ddit.set.LogicConfig;
import kr.or.ddit.util.model.PageVo;

public class PaymentDaoTest extends LogicConfig{

	private Logger logger = LoggerFactory.getLogger(PaymentDaoTest.class);
	
	@Resource(name="paymentDao")
	IPaymentDao paymentDao;
	
	@Test
	public void searchPaymentDupl(){
		String searchPaymentDupl = paymentDao.searchPaymentDupl(new PaymentVo("1","20190311"));
		logger.debug("asdfljnsadf:{}",searchPaymentDupl);
	}
	
	@Test
	public void insertPaymentTest() {
		PaymentVo paymentVo = new PaymentVo();
		paymentVo.setUserId("1");
		paymentVo.setPayDay("20180101");
		int insertPayment = paymentDao.insertPayment(paymentVo);
		assertEquals(1, insertPayment);
	}
	@Test
	public void getAllPaymentTest() {
		List<PaymentVo> allPayment = paymentDao.getAllPayment();
		assertTrue(allPayment.size()>0);
	}
	@Test
	public void getPaymentListTest() {
		List<PaymentVo> allPayment = paymentDao.getPaymentList(new PageVo());
		for (PaymentVo paymentVo : allPayment) {
			logger.debug("payment111:{}",paymentVo);
		}
		assertTrue(allPayment.size()>0);
	}
	@Test
	public void getPaymentListByUserNmTest() {
		List<PaymentVo> allPayment = paymentDao.getPaymentListByUserNm("호");
		assertTrue(allPayment.size()>0);
	}
	@Test
	public void getPayment_uTest() {
		List<PaymentVo> payment_u = paymentDao.getPayment_u("1");
		assertTrue(payment_u.size()>0);
	}
	@Test
	public void selectPaymentTest() {
		PaymentVo selectPayment = paymentDao.selectPayment("1");
		assertNotNull(selectPayment);
	}
	@Test
	public void deletePaymentTest() {
		int deletePayment = paymentDao.deletePayment("2");
		assertEquals(1, deletePayment);
	}
	@Test
	public void selectTotalSalaryByDayTest() {
		List<PaymentVo> selectTotalSalaryByDay = paymentDao.selectTotalSalaryByDay("201903");
		assertTrue(selectTotalSalaryByDay.size()>0);
	}
	@Test
	public void selectPersonalPaymentListTest() {
		Map<String, Object> payDay=new HashMap<>();
		payDay.put("paydayTo", "2019-03-15");
		payDay.put("paydayFrom", "2019-04-02");
		List<PaymentVo> selectTotalSalaryByDay = paymentDao.selectPersonalPaymentList(payDay);
		logger.debug("asdfkasdf:{}",selectTotalSalaryByDay.size());
	}
	@Test
	public void selectYearPaymentListDetailTest() {
		Map<String, Object> payDay=new HashMap<>();
		payDay.put("userid", "1");
		payDay.put("paydayYear", "2019");
		List<PaymentVo> selectYearPaymentListDetail = paymentDao.selectYearPaymentListDetail(payDay);
		logger.debug("asdfkhb:{}",selectYearPaymentListDetail.size());
		
	}
	@Test
	public void paycodeByIdnDayTest() {
		PaymentVo paymentVo = new PaymentVo("1", "2019-04-02");
		String paycodeByIdnDay = paymentDao.paycodeByIdnDay(paymentVo);
		logger.debug("asdfsadf:{}",paycodeByIdnDay);
	}
	@Test
	public void selectincometaxTest() {
		String selectincometax = paymentDao.selectincometax("2500");
		assertEquals("41630", selectincometax);
	}

}
