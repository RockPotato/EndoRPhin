package kr.or.ddit.annual.dao;

import java.util.List;

import kr.or.ddit.annual.model.AnnualVo;

public interface IAnnualDao {
	
	/**
	* Method : getAllAttitude
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @return
	* Method 설명 : 휴가이력 전체 가져오기
	*/
	List<AnnualVo> getAllAnnual();
	
	
	/**
	* Method : insertAttitude
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param vo
	* @return
	* Method 설명 : 휴가이력 인서트
	*/
	int insertAnnual(AnnualVo vo);
	
	
	/**
	* Method : deleteAttitude
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param userId
	* @return
	* Method 설명 : 휴가이력 삭제
	*/
	int deleteAnnual(AnnualVo code);
	
	
	
	
	/**
	* Method : updateAttitude
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param employeeVo
	* @return
	* Method 설명 : 휴가이력 업데이트
	*/
	int updateAnnual(AnnualVo Vo);
	
	
	
	/**
	* Method : SearchAttitude
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param userId
	* @return
	* Method 설명 : 휴가이력 검색
	*/
	public List<AnnualVo> SearchAnnual(AnnualVo code);
	
	
	
	/**
	* Method : SearchEmployee
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param userId
	* @return
	* Method 설명 : 선택 이력 가져오기
	*/
	public AnnualVo selectAllAnnual(AnnualVo code);
	public AnnualVo selectAnnual(String code);

}
