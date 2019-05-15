package kr.or.ddit.payment.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.payment.model.Payment4SlipVo;
import kr.or.ddit.payment.model.Payment_detailVo;

public interface IPayment_DetailService {
	int insertPayment_detail(Payment_detailVo payment_detailVo);
	List<Payment_detailVo> getAllPayment_detail();
	Payment_detailVo selectPayment_detail(Payment_detailVo payment_detailVo);
	int deletePayment_detail(Payment_detailVo payment_detailVo);
	List<Payment_detailVo> selectPayment_detailPaycode(String useStatus);
	Map<String, Object> getDeNmPayList(String userid);
	Map<String, Object> getPayDetail(String paycode);
	Map<String, Object> getPayDetailByYear(Map<String, Object> paymap);
	Map<String, Object> selectPayment_detailSlip(Payment4SlipVo vo);
	int updateForSlip(String paydayMonth);
}
