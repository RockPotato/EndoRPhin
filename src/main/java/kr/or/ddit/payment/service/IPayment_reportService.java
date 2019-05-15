package kr.or.ddit.payment.service;

import java.util.List;

import kr.or.ddit.payment.model.PaymentVo;
import kr.or.ddit.payment.model.Payment_reportVo;

public interface IPayment_reportService {
	int insertPayment_report(Payment_reportVo payment_reportVo);
	int deletePayment_report(String paymentDate);
	List<Payment_reportVo> getAllPayment_report();
	Payment_reportVo selectPayment_report(String paymentreportcode);
	PaymentVo selectPayment_reportByMonth(String paymentdate);
	void insertPaymentReport(String paymentDate,String[] payCode);
}
