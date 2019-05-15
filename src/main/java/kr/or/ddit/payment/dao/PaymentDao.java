package kr.or.ddit.payment.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.payment.model.PaymentVo;
import kr.or.ddit.util.model.PageVo;

@Repository("paymentDao")
public class PaymentDao implements IPaymentDao{

	@Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int insertPayment(PaymentVo paymentVo) {
		return sqlSessionTemplate.insert("payment.insertPayment",paymentVo);
	}

	@Override
	public List<PaymentVo> getAllPayment() {
		List<PaymentVo> selectList = sqlSessionTemplate.selectList("payment.getAllPayment");
		return selectList;
	}

	@Override
	public PaymentVo selectPayment(String paycode) {
		return sqlSessionTemplate.selectOne("payment.selectPayment",paycode);
	}

	@Override
	public int deletePayment(String paycode) {
		return sqlSessionTemplate.delete("payment.deletePayment",paycode);
	}

	@Override
	public List<PaymentVo> getPayment_u(String userId) {
		return sqlSessionTemplate.selectList("payment.getPayment_u",userId);
	}

	@Override
	public List<PaymentVo> getPaymentList(PageVo pageVo) {
		return sqlSessionTemplate.selectList("payment.getPaymentList",pageVo);
	}

	@Override
	public List<PaymentVo> getPaymentListByUserNm(String usernm) {
		return sqlSessionTemplate.selectList("payment.getPaymentListByUserNm",usernm);
	}

	@Override
	public String getMaxPayment() {
		return sqlSessionTemplate.selectOne("payment.getMaxPayment");
	}

	@Override
	public int updatePayment(PaymentVo paymentVo) {
		return sqlSessionTemplate.update("payment.updatePayment",paymentVo);
	}

	@Override
	public String searchPaymentDupl(PaymentVo paymentVo) {
		return sqlSessionTemplate.selectOne("payment.searchPaymentDupl",paymentVo);
		
	}

	@Override
	public List<PaymentVo> selectTotalSalaryByDay(String payDay) {
		return sqlSessionTemplate.selectList("payment.selectTotalSalaryByDay",payDay);
	}

	@Override
	public List<PaymentVo> selectPersonalPaymentList(Map<String, Object> payDay) {
		return sqlSessionTemplate.selectList("payment.selectPersonalPaymentList",payDay);
	}
	@Override
	public List<PaymentVo> selectYearPaymentList(Map<String, Object> payDay) {
		return sqlSessionTemplate.selectList("payment.selectYearPaymentList",payDay);
	}

	@Override
	public String paycodeByIdnDay(PaymentVo paymentVo) {
		return sqlSessionTemplate.selectOne("payment.paycodeByIdnDay",paymentVo);
	}

	@Override
	public List<PaymentVo> selectYearPaymentListDetail(Map<String, Object> payDay) {
		return sqlSessionTemplate.selectList("payment.selectYearPaymentListDetail",payDay);
	}

	@Override
	public String selectincometax(String divsalary) {
		return sqlSessionTemplate.selectOne("payment.selectincometax",divsalary);
	}

	@Override
	public List<PaymentVo> selectDeptNPayment(String paydayMonth) {
		return sqlSessionTemplate.selectList("payment.selectDeptNPayment",paydayMonth);
	}

	@Override
	public int getPaymentCnt() {
		return sqlSessionTemplate.selectOne("payment.getPaymentCnt");
	}

	@Override
	public List<PaymentVo> getPaymentForAdjust(String payDay) {
		return sqlSessionTemplate.selectList("payment.getPaymentForAdjust",payDay);
	}
}
