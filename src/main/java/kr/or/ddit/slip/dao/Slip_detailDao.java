package kr.or.ddit.slip.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.slip.model.Slip_detailVo;
import kr.or.ddit.util.model.SumChanceVo;

@Repository("slip_detailDao")
public class Slip_detailDao implements ISlip_detailDao{
	
	
	
	@Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;
	
	
	
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
		
		return sqlSessionTemplate.insert("slipdetail.insertSlipdetail", dVo);
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
	
		return sqlSessionTemplate.selectList("slipdetail.getSlip_detailBySlipNumber",slipNumber);
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
		return sqlSessionTemplate.delete("slipdetail.deleteSlip_detail", slipNumber);
	}


	/**
	* Method : getDistanguishAccount
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param slipNumber
	* @param status
	* @return
	* Method 설명 : 차/대변 구하기
	*/
	@Override
	public List<Slip_detailVo> getDistanguishAccount(String slipNumber, String status) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("slipNumber", slipNumber);
		map.put("status", status);
		
		return sqlSessionTemplate.selectList("slipdetail.getDistanguishAccount", map);
	}


	@Override
	public int deleteSlip_detail_one(String slipNumber, String slipDetailNo) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("slipNumber", slipNumber);
		map.put("slipDetailNo", slipDetailNo);
		
		return sqlSessionTemplate.delete("slipdetail.deleteSlip_detail_one", map);
	}


	@Override
	public List<Slip_detailVo> selectAssetData(String chooseYear, String chooseMonth) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("chooseYear", chooseYear);
		map.put("chooseMonth", chooseMonth);
		
		return sqlSessionTemplate.selectList("slipdetail.selectAssetDataLeft", map);
	}


	@Override
	public List<Slip_detailVo> selectObligationData(String chooseYear, String chooseMonth) {

		Map<String, String> map = new HashMap<String, String>();
		map.put("chooseYear", chooseYear);
		map.put("chooseMonth", chooseMonth);
		
		return sqlSessionTemplate.selectList("slipdetail.selectObligationDataLeft", map);
	}


	@Override
	public List<Slip_detailVo> selectCapitalData(String chooseYear, String chooseMonth) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("chooseYear", chooseYear);
		map.put("chooseMonth", chooseMonth);
		
		return sqlSessionTemplate.selectList("slipdetail.selectCapitalDataLeft", map);
	}


	@Override
	public List<Slip_detailVo> selectCostlData(String chooseYear, String chooseMonth) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("chooseYear", chooseYear);
		map.put("chooseMonth", chooseMonth);
		
		return sqlSessionTemplate.selectList("slipdetail.selectCostDataLeft", map);
	}


	@Override
	public List<Slip_detailVo> selectRevenuelData(String chooseYear, String chooseMonth) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("chooseYear", chooseYear);
		map.put("chooseMonth", chooseMonth);
		
		return sqlSessionTemplate.selectList("slipdetail.selectRevenueDataLeft", map);
	}


	@Override
	public List<SumChanceVo> selectSumChanceData(String chooseYear, String chooseMonth) {
		
	Map<String, String> map = new HashMap<String, String>();
	map.put("chooseYear", chooseYear);
	map.put("chooseMonth", chooseMonth);
	
	return sqlSessionTemplate.selectList("slipdetail.selectSumChance", map);
	}
	
	
	
	
	
	
	

}
