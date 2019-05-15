package kr.or.ddit.payment.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.payment.model.Payment_detailVo;

@Repository("payment_detailDao")
public class Payment_DetailDao implements IPayment_DetailDao{

	@Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int insertPayment_detail(Payment_detailVo payment_detailVo) {
		return sqlSessionTemplate.insert("payment_detail.insertPayment_detail",payment_detailVo);
	}

	@Override
	public List<Payment_detailVo> getAllPayment_detail() {
		return sqlSessionTemplate.selectList("payment_detail.getAllPayment_detail");
	}

	@Override
	public Payment_detailVo selectPayment_detail(Payment_detailVo payment_detailVo) {
		return sqlSessionTemplate.selectOne("payment_detail.selectPayment_detail",payment_detailVo);
	}

	@Override
	public int deletePayment_detail(Payment_detailVo payment_detailVo) {
		return sqlSessionTemplate.delete("payment_detail.deletePayment_detail",payment_detailVo);
	}

	@Override
	public List<Payment_detailVo> selectPayment_detailPaycode(String paycode) {
		return sqlSessionTemplate.selectList("payment_detail.selectPayment_detailPaycode",paycode);
	}

	@Override
	public int updatePayment_detail(Payment_detailVo payment_detailVo) {
		return sqlSessionTemplate.update("payment_detail.updatePayment_detail",payment_detailVo);
		
	}

	@Override
	public List<Payment_detailVo> selectPayment_detailSlip(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("payment_detail.selectPayment_detailSlip",map);
	}

	@Override
	public int updateForSlip(String paydayMonth) {
		return sqlSessionTemplate.update("payment_detail.updateForSlip",paydayMonth);
	}

	
}
