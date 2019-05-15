package kr.or.ddit.tax_cal.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.tax_cal.model.Tax_calVo;
import kr.or.ddit.util.model.PageVo;

public interface ITax_calDao {
	
	/**
	* Method : selecTax_calPagingList
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : Ajax를 통한 페이지 리스트 뷰
	*/
	public List<Tax_calVo> selecTax_calPagingList(PageVo pageVo);
	
	

	/**
	* Method : selecTax_calPagingList
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : Ajax를 통한 페이지 리스트 뷰 검
	*/
	public List<Tax_calVo> selecTax_calPagingList_search(PageVo pageVo);
	
	
	/**
	* Method : getTax_calCnt
	* 작성자 : sanghoyun
	* 변경이력 :
	* @return
	* Method 설명 : 매입매출전표 수량 확인
	*/
	public int getTax_calCnt();
	
	

	

	
	/**
	* Method : insertTax_cal
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param tax_calVo
	* @return
	* Method 설명 : 매입매출전표 데이터 추가
	*/
	public int insertTax_cal(Tax_calVo tax_calVo);
	
	
	/**
	* Method : getTax_seqNextval
	* 작성자 : sanghoyun
	* 변경이력 :
	* @return  
	* Method 설명 : 시퀀스 값 가져오기
	*/
	public String getTax_seqNextval();
	
	
	/**
	* Method : updateTax_cal
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param tax_calVo
	* @return
	* Method 설명 : 전표내역 수정
	*/
	public int updateTax_cal(Tax_calVo tax_calVo);
	
	
	/**
	* Method : deleteTax_cal
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param salesCode
	* @return
	* Method 설명 : 전표내용 삭제
	*/
	public int deleteTax_cal(String salesCode);
	
	
	
	
	/**
	* Method : searchAllByType
	* 작성자 : sanghoyun
	* 변경이력 :
	* @return
	* Method 설명 : 매입 전체 조회하기
	*/
	public List<Tax_calVo> searchAllByType(Map<String,Object> map);
	
	
	/**
	* Method : searchAllByType
	* 작성자 : sanghoyun
	* 변경이력 :
	* @return
	* Method 설명 : 매출 전체 조회하기
	*/
	public List<Tax_calVo> searchAllByType2(Map<String,Object> map);
	
	
	/**
	* Method : searchAllByType51
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param searchData2
	* @return
	* Method 설명 : 데이터로 겸색
	*/
	public List<Tax_calVo> searchAllByType51(Map<String,Object> map);
	
	/**
	* Method : selectBy51
	* 작성자 : sanghoyun
	* 변경이력 :
	* @return
	* Method 설명 : 과세매입 가져오기
	*/
	public List<Map<String, String>> selectBy51(String startDate, String endDate);
	
	
}
