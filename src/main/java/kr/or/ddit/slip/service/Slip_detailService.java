package kr.or.ddit.slip.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.slip.dao.ISlip_detailDao;
import kr.or.ddit.slip.model.Slip_detailVo;
import kr.or.ddit.util.model.SumChanceVo;

@Service("slip_detailService")
public class Slip_detailService implements ISlip_detailService{

	@Resource(name="slip_detailDao")
	private ISlip_detailDao slip_detailDao;
	
	/**
	* Method : insertDetailSlip
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param dVo
	* @return
	* Method 설명 : 전표상세 데이터 추가하기
	*/
	@Override
	public int insertDetailSlip(Slip_detailVo dVo) {
		
		return slip_detailDao.insertDetailSlip(dVo);
	}
	
	
	/**
	* Method : getSlip_detailBySlipNumber
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param slipNumber
	* @return
	* Method 설명 : 전표번호로 전표 조회
	*/
	@Override
	public List<Slip_detailVo> getSlip_detailBySlipNumber(String slipNumber) {
		return slip_detailDao.getSlip_detailBySlipNumber(slipNumber);
	}
	
	
	/**
	* Method : deleteSlip_detail
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param slipNumber
	* @return
	* Method 설명 : 전표번호로 전표 삭제
	*/
	@Override
	public int deleteSlip_detail(String slipNumber) {
		return slip_detailDao.deleteSlip_detail(slipNumber);
	}

	/**
	* Method : getDistanguishAccount
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param slipNumber
	* @param status
	* @return
	* Method 설명 : 차/ 대변 합계 구하기 (0 : 차 / 1 : 대)
	*/
	@Override
	public List<Slip_detailVo> getDistanguishAccount(String slipNumber, String status) {
		return slip_detailDao.getDistanguishAccount(slipNumber, status);
	}


	@Override
	public int deleteSlip_detail_one(String slipNumber, String slipDetailNo) {
		return slip_detailDao.deleteSlip_detail_one(slipNumber, slipDetailNo);
	}


	@Override
	public List<Slip_detailVo> selectAssetData(String chooseYear, String chooseMonth) {
		return slip_detailDao.selectAssetData(chooseYear, chooseMonth);
	}


	@Override
	public List<Slip_detailVo> selectObligationData(String chooseYear, String chooseMonth) {
		return slip_detailDao.selectObligationData(chooseYear, chooseMonth);
	}


	@Override
	public List<Slip_detailVo> selectCapitalData(String chooseYear, String chooseMonth) {
		return slip_detailDao.selectCapitalData(chooseYear, chooseMonth);
	}


	@Override
	public List<Slip_detailVo> selectCostlData(String chooseYear, String chooseMonth) {
		return slip_detailDao.selectCostlData(chooseYear, chooseMonth);
	}


	@Override
	public List<Slip_detailVo> selectRevenuelData(String chooseYear, String chooseMonth) {
		return slip_detailDao.selectRevenuelData(chooseYear, chooseMonth);
				
	}


	@Override
	public List<SumChanceVo> selectSumChanceData(String chooseYear, String chooseMonth) {
		return slip_detailDao.selectSumChanceData(chooseYear, chooseMonth);
	}

}
