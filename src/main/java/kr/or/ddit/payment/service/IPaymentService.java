package kr.or.ddit.payment.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.payment.model.Payment4UpdVo;
import kr.or.ddit.payment.model.PaymentVo;
import kr.or.ddit.util.model.PageVo;

public interface IPaymentService {
	int insertPayment(PaymentVo paymentVo);
	List<PaymentVo> getAllPayment();
	List<PaymentVo> getPayment_u(String userId);
	PaymentVo selectPayment(String paycode);
	int deletePayment(String paycode);
	Map<String,Object> getPaymentList(PageVo pageVo);
	List<PaymentVo> getPaymentListByUserNm(String usernm);
	boolean updateAndInsertPayment(Payment4UpdVo payment4UpdVo);
	void updatePaymentDetailAjax(Payment4UpdVo payment4UpdVo);
	List<PaymentVo> selectTotalSalaryByDay(String payDay);
	List<PaymentVo> selectPersonalPaymentList(Map<String, Object> payDay);
	String paycodeByIdnDay(PaymentVo paymentVo);
	List<PaymentVo> selectDeptNPayment(String paydayMonth);
	List<PaymentVo> selectYearPaymentListDetail(String paydayMonth);
	List<PaymentVo> getPaymentForAdjust(String payDay);
}
