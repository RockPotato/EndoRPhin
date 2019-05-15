package kr.or.ddit.payment.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.payment.dao.IDe_Product_divDao;
import kr.or.ddit.payment.dao.IPaymentDao;
import kr.or.ddit.payment.dao.IPayment_DetailDao;
import kr.or.ddit.payment.model.De_product_divVo;
import kr.or.ddit.payment.model.Payment4UpdVo;
import kr.or.ddit.payment.model.PaymentVo;
import kr.or.ddit.payment.model.Payment_detailVo;
import kr.or.ddit.util.model.PageVo;

@Service("paymentService")
public class PaymentService implements IPaymentService{

	
	@Resource(name="paymentDao")
	IPaymentDao paymentDao;
	
	@Resource(name="payment_detailDao")
	IPayment_DetailDao payment_detailDao;
	
	@Resource(name="de_product_divDao")
	IDe_Product_divDao de_product_divDao;
	
	
	@Override
	public int insertPayment(PaymentVo paymentVo) {
		return paymentDao.insertPayment(paymentVo);
	}

	@Override
	public List<PaymentVo> getAllPayment() {
		return paymentDao.getAllPayment();
	}

	@Override
	public PaymentVo selectPayment(String paycode) {
		return paymentDao.selectPayment(paycode);
	}

	@Override
	public int deletePayment(String paycode) {
		return paymentDao.deletePayment(paycode);
	}

	@Override
	public List<PaymentVo> getPayment_u(String userId) {
		return paymentDao.getPayment_u(userId);
	}


	@Override
	public List<PaymentVo> getPaymentListByUserNm(String usernm) {
		return paymentDao.getPaymentListByUserNm(usernm);
	}

	@Override
	public boolean updateAndInsertPayment(Payment4UpdVo payment4UpdVo) {
		String searchPaymentDupl = paymentDao.searchPaymentDupl(new PaymentVo(payment4UpdVo.getUserid(),payment4UpdVo.getPayday()));
		if(searchPaymentDupl==null){
			paymentDao.insertPayment(new PaymentVo( payment4UpdVo.getUserid(),payment4UpdVo.getPayday()));
			String maxPayment = paymentDao.getMaxPayment();
			if(payment4UpdVo.getDecdPayList().isEmpty()){
				return true;
			}
			for (int i = 0; i < payment4UpdVo.getDecdPayList().size(); i++) {
				payment_detailDao.insertPayment_detail(new Payment_detailVo(
						payment4UpdVo.getDecdMap().get(i), maxPayment, payment4UpdVo.getDecdPayList().get(i)));
			}
			PaymentVo paymentVo = new PaymentVo();
			paymentVo.setPayCode(maxPayment);
			paymentVo.setPayDay(payment4UpdVo.getPayday());
			withhold(paymentVo);
			return true;
		}
		return false;
	}

	@Override
	public void updatePaymentDetailAjax(Payment4UpdVo payment4UpdVo) {
		payment_detailDao.deletePayment_detail(new Payment_detailVo(null,payment4UpdVo.getPayCode(),null,payment4UpdVo.getDeprostatus()));
		if(!(payment4UpdVo.getDecdPayList().isEmpty())){
			for (int i = 0; i < payment4UpdVo.getDecdPayList().size(); i++) {
				Payment_detailVo payment_detailVo = new Payment_detailVo(payment4UpdVo.getDecdMap().get(i),payment4UpdVo.getPayCode());
				payment_detailVo.setDeductPay(payment4UpdVo.getDecdPayList().get(i));
				payment_detailDao.insertPayment_detail(payment_detailVo);
			}
		}
		PaymentVo paymentVo = new PaymentVo();
		paymentVo.setPayCode(payment4UpdVo.getPayCode());
		paymentVo.setPayDay(payment4UpdVo.getPayday());
		withhold(paymentVo);
	}

	private void withhold(PaymentVo paymentVo) {
		int totalpay =0;
		List<Payment_detailVo> selectPayment_detailPaycode = payment_detailDao.selectPayment_detailPaycode(paymentVo.getPayCode());
		for (int i = 0; i < selectPayment_detailPaycode.size(); i++) {
			De_product_divVo selectDe_product_div = de_product_divDao.selectDe_product_div(selectPayment_detailPaycode.get(i).getDeductCode());
			switch(selectPayment_detailPaycode.get(i).getDeductCode()){
				case "2":
					if(Integer.parseInt(selectPayment_detailPaycode.get(i).getDeductPay())>100000)
						totalpay+=Integer.parseInt(selectPayment_detailPaycode.get(i).getDeductPay())-100000;
					break;
				case "4":
					if(Integer.parseInt(selectPayment_detailPaycode.get(i).getDeductPay())>200000)
						totalpay+=Integer.parseInt(selectPayment_detailPaycode.get(i).getDeductPay())-200000;
					break;
				default:
						if(selectDe_product_div.getTaxStatus()!=null&&selectDe_product_div.getTaxStatus().equals("1"))
							totalpay+=Integer.parseInt(selectPayment_detailPaycode.get(i).getDeductPay());
					break;
			}
		}
		paymentVo.setTaxamount(Integer.toString(totalpay));
		List<De_product_divVo> de_product_div = de_product_divDao.getDe_product_div("3");
		for (int i = 0; i < 3; i++) {
			String deductCode="500"+(i+3);
			Payment_detailVo payment_detailVo = new Payment_detailVo(deductCode,paymentVo.getPayCode());
			float percent = Float.parseFloat(de_product_div.get(i).getRelate());
			double tax = Math.floor((totalpay/100*percent)/10);
			if(de_product_div.get(i).getDeductName().equals("국민연금")
					&&totalpay>4860000){
				tax=Math.floor((4860000/100*percent)/10);
			}
			
			payment_detailVo.setDeductPay(Double.toString(tax*10));
			if(payment_detailDao.selectPayment_detail(payment_detailVo)==null){
				payment_detailDao.insertPayment_detail(payment_detailVo);
			}else{
				payment_detailDao.updatePayment_detail(payment_detailVo);
			}
			if(i+3==4){
				deductCode="500"+(i+5);
				percent = Float.parseFloat(de_product_div.get(i+2).getRelate());
				tax = Math.floor(((tax*10)/100*percent)/10);
				
				payment_detailVo.setDeductCode(deductCode);
				payment_detailVo.setDeductPay(Double.toString(tax*10));
				if(payment_detailDao.selectPayment_detail(payment_detailVo)==null){
					payment_detailDao.insertPayment_detail(payment_detailVo);
				}else{
					payment_detailDao.updatePayment_detail(payment_detailVo);
				}
			}
		}
		String incomeTax = paymentDao.selectincometax(Integer.toString(totalpay/1000));
		if(incomeTax==null){
			String selectincometax = paymentDao.selectincometax("10000");
			int over = (totalpay/1000)-10000;
			if(over<4000){
				over = (int) Math.floorDiv((over/10)*(98*35),10)*10;
			}
			else if(over<18000){
				over = (int) Math.floorDiv(((over-4000)/10)*(98*35),10)*10 + 1372000;
			}
			else{
				over = 10000000;
			}
			over +=Integer.parseInt(selectincometax);
			incomeTax = Integer.toString(over);
		}

		List<De_product_divVo> selectDeproductByNm = de_product_divDao.selectDeproductByNm(new De_product_divVo("소득세"));
		for (int i = 0; i < selectDeproductByNm.size(); i++) {
			Payment_detailVo payment_detailVo = new Payment_detailVo(selectDeproductByNm.get(i).getDeductCode()
																		,paymentVo.getPayCode());
			if(i==0)
				payment_detailVo.setDeductPay(incomeTax);
			else{
				double floor = Math.floor((Integer.parseInt(incomeTax)/100*10)/10);
				payment_detailVo.setDeductPay(Double.toString(floor*10));
			}
				
				
			if(payment_detailDao.selectPayment_detail(payment_detailVo)==null){
				payment_detailDao.insertPayment_detail(payment_detailVo);
			}else{
				payment_detailDao.updatePayment_detail(payment_detailVo);
			}
		}	
		paymentDao.updatePayment(paymentVo);
	}

	@Override
	public List<PaymentVo> selectTotalSalaryByDay(String payDay) {
		return paymentDao.selectTotalSalaryByDay(payDay);
	}

	@Override
	public List<PaymentVo> selectPersonalPaymentList(Map<String, Object> payDay) {
		if(payDay.get("paydayYear")!=null){
			return paymentDao.selectYearPaymentList(payDay);
		}
		return paymentDao.selectPersonalPaymentList(payDay);
	}

	@Override
	public String paycodeByIdnDay(PaymentVo paymentVo) {
		return paymentDao.paycodeByIdnDay(paymentVo);
	}

	@Override
	public List<PaymentVo> selectDeptNPayment(String paydayMonth) {
		return paymentDao.selectDeptNPayment(paydayMonth);
	}


	@Override
	public List<PaymentVo> selectYearPaymentListDetail(String paydayMonth) {
		Map<String,Object> map = new HashMap<>();
		map.put("paydayYear", paydayMonth);
		return paymentDao.selectYearPaymentListDetail(map);
	}

	@Override
	public Map<String, Object> getPaymentList(PageVo pageVo) {
		Map<String, Object> resultMap = new HashMap<String, Object>();

		resultMap.put("paymentList", paymentDao.getPaymentList(pageVo));
		resultMap.put("paymentCnt", paymentDao.getPaymentCnt());
		return resultMap;
	}

	@Override
	public List<PaymentVo> getPaymentForAdjust(String payDay) {
		return paymentDao.getPaymentForAdjust(payDay);
	}
}
