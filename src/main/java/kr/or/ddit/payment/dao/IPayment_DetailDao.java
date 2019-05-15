package kr.or.ddit.payment.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.payment.model.Payment_detailVo;

public interface IPayment_DetailDao {
	int insertPayment_detail(Payment_detailVo payment_detailVo);
	int updatePayment_detail(Payment_detailVo payment_detailVo);
	List<Payment_detailVo> getAllPayment_detail();
	Payment_detailVo selectPayment_detail(Payment_detailVo payment_detailVo);
	int deletePayment_detail(Payment_detailVo payment_detailVo);
	List<Payment_detailVo> selectPayment_detailPaycode(String paycode);
	List<Payment_detailVo> selectPayment_detailSlip(Map<String, Object> map);
	int updateForSlip(String paydayMonth);
}
