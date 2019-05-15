package kr.or.ddit.tax_cal.dao;

import java.util.List;

import kr.or.ddit.tax_cal.model.Sales_detailVo;

public interface ISales_detailDao {
	
	/**
	* Method : insertSales_detail
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param sales_detailVo
	* @return
	* Method 설명 : 디테일 전표 삽입
	*/
	public int insertSales_detail(Sales_detailVo sales_detailVo);
	
	
	/**
	* Method : selectSales_detail
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param salesCode
	* @return
	* Method 설명 : salesCode를 통해 전표상세 가져오기
	*/
	public List<Sales_detailVo> selectSales_detail(String salesCode);
	
	
	/**
	* Method : updateSales_detail
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param sales_detailVo
	* @return
	* Method 설명 : 상세전표 수정하기
	*/
	public int updateSales_detail(Sales_detailVo sales_detailVo);
	
	
	/**
	* Method : deleteSales_detail
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param salesCode
	* @return
	* Method 설명 : 상세전표 삭제
	*/
	public int deleteSales_detail(String salesCode);
		

}
