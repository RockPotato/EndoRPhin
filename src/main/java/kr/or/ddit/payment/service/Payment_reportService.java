package kr.or.ddit.payment.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.payment.dao.IPayment_reportDao;
import kr.or.ddit.payment.model.PaymentVo;
import kr.or.ddit.payment.model.Payment_reportVo;

@Service("payment_reportService")
public class Payment_reportService implements IPayment_reportService{

	@Resource(name="payment_reportDao")
	IPayment_reportDao paymentreportDao;
	
	@Override
	public int insertPayment_report(Payment_reportVo payment_reportVo) {
		return paymentreportDao.insertPayment_report(payment_reportVo);
	}

	@Override
	public int deletePayment_report(String paymentDate) {
		return paymentreportDao.deletePayment_report(paymentDate);
	}

	@Override
	public List<Payment_reportVo> getAllPayment_report() {
		return paymentreportDao.getAllPayment_report();
	}

	@Override
	public Payment_reportVo selectPayment_report(String paymentreportcode) {
		return paymentreportDao.selectPayment_report(paymentreportcode);
	}

	@Override
	public void insertPaymentReport(String paymentDate, String[] payCode) {
		for (int i = 0; i < payCode.length; i++) {
			paymentreportDao.insertPayment_report(new Payment_reportVo(payCode[i],paymentDate));
		}
	}

	@Override
	public PaymentVo selectPayment_reportByMonth(String payDay) {
		return paymentreportDao.selectPayment_reportByMonth(payDay);
	}

}
