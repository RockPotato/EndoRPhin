package kr.or.ddit.payment.dao;

import java.util.List;

import kr.or.ddit.payment.model.PaymentVo;
import kr.or.ddit.payment.model.Payment_reportVo;

public interface IPayment_reportDao {
	int insertPayment_report(Payment_reportVo payment_reportVo);
	int deletePayment_report(String paymentreportcode);
	List<Payment_reportVo> getAllPayment_report();
	Payment_reportVo selectPayment_report(String paymentDate);
	PaymentVo selectPayment_reportByMonth(String payDay);
	List<String> countDeadline4prospect();
}
