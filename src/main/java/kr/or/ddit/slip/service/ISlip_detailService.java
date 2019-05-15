package kr.or.ddit.slip.service;

import java.util.List;

import kr.or.ddit.slip.model.SlipVo;
import kr.or.ddit.slip.model.Slip_detailVo;
import kr.or.ddit.util.model.SumChanceVo;

public interface ISlip_detailService {
	
	/**
	* Method : insertDetailSlip
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param dVo
	* @return
	* Method 설명 : 전표상세 데이터 추가하기
	*/
	public int insertDetailSlip(Slip_detailVo dVo);


	/**
	* Method : getSlip_detailBySlipNumber
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param slipNumber
	* @return
	* Method 설명 : 전표번호로 전표 조회
	*/
	public List<Slip_detailVo> getSlip_detailBySlipNumber(String slipNumber);

	
	
	/**
	* Method : deleteSlip_detail
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param slipNumber
	* @return
	* Method 설명 : 전표번호로 전표 삭제
	*/
	public int deleteSlip_detail(String slipNumber);
	
	
	/**
	* Method : getDistanguishAccount
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param slipNumber
	* @param status
	* @return
	* Method 설명 : 차/ 대변 합계 구하기 (0 : 차 / 1 : 대)
	*/
	public List<Slip_detailVo> getDistanguishAccount(String slipNumber, String status);
	
	
	/**
	* Method : deleteSlip_detail_one
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param slipNumber
	* @param slipDetailNo
	* @return
	* Method 설명 : 전표번호, 전표상세번호로 전표 하나 삭제하기
	*/
	public int deleteSlip_detail_one(String slipNumber, String slipDetailNo);
	
	
	/**
	* Method : selectAssetData
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param chooseYear
	* @param chooseMonth
	* @return
	* Method 설명 : 자산 불러오기
	*/
	public List<Slip_detailVo> selectAssetData(String chooseYear, String chooseMonth);
	
	
	
	
	/**
	* Method : selectAssetData
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param chooseYear
	* @param chooseMonth
	* @return
	* Method 설명 : 부채 불러오기
	*/
	public List<Slip_detailVo> selectObligationData(String chooseYear, String chooseMonth);
	
	
	
	/**
	* Method : selectAssetData
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param chooseYear
	* @param chooseMonth
	* @return
	* Method 설명 : 자본 불러오기
	*/
	public List<Slip_detailVo> selectCapitalData(String chooseYear, String chooseMonth);
	
	
	
	/**
	* Method : selectAssetData
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param chooseYear
	* @param chooseMonth
	* @return
	* Method 설명 : 비용 불러오기
	*/
	public List<Slip_detailVo> selectCostlData(String chooseYear, String chooseMonth);
	
	/**
	* Method : selectAssetData
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param chooseYear
	* @param chooseMonth
	* @return
	* Method 설명 : 수익 불러오기
	*/
	public List<Slip_detailVo> selectRevenuelData(String chooseYear, String chooseMonth);
	
	/**
	* Method : selectSumChanceData
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param chooseYear
	* @param chooseMonth
	* @return
	* Method 설명 : 합계잔액시산표 데이터 불러오기
	*/
	public List<SumChanceVo> selectSumChanceData(String chooseYear, String chooseMonth);
}


