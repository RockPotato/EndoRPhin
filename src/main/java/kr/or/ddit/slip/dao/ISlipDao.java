package kr.or.ddit.slip.dao;

import java.util.List;

import kr.or.ddit.slip.model.SlipVo;
import kr.or.ddit.util.model.PageVo;

public interface ISlipDao {
	
	/**
	* Method : getSlipCount
	* 작성자 : sanghoyun
	* 변경이력 :
	* @return
	* Method 설명 : 전표 수량 확인
	*/
	public int getSlipCount(String status);
	
	
	/**
	* Method : selectSlipPagingList
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : 페이징처리를 위한 쿼리 실행
	*/
	public List<SlipVo> selectSlipPagingList(PageVo pageVo);
	
	/**
	* Method : insertSlip
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param slipVo
	* @return
	* Method 설명 : 전표 추가 메서드
	*/
	public int insertSlip(SlipVo slipVo);
	
	
	/**
	* Method : currvalSeq
	* 작성자 : sanghoyun
	* 변경이력 :
	* @return
	* Method 설명 : 시퀀스 불러오기 - 현재값
	*/
	public String currvalSeq();
	
	
	/**
	* Method : deleteSlip
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param slipNumber
	* @return
	* Method 설명 : 전표 삭제
	*/
	public int deleteSlip(String slipNumber);
	
	
	
	/**
	* Method : updateSlip_paaprovuar
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param slipNumber
	* @return
	* Method 설명 : 미승인 -> 승인으로 처리
	*/
	public int updateSlip_paaprovuar(String status);
	
	
	/**
	* Method : updateSlip
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param slipNumber
	* @return
	* Method 설명 : 승인 -> 미승인으로 처리
	*/
	public int updateSlip(String status);

	
	
	/**
	* Method : getBetweenProd
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param slipNumber
	* @return
	* Method 설명 : 날짜 검색 
	*/
	public List<SlipVo> getBetweenSlip(String pre_date, String post_date);
	
	public List<SlipVo> getBetweenSlip_zero(String pre_date, String post_date);
	
	
	/**
	* Method : finalSaveSlip
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param slipVo
	* @return
	* Method 설명 : 전표저장 버튼으로 인한 임시전표 -> 최종전표 수정
	*/
	public int finalSaveSlip(SlipVo slipVo);
	
	/**
	* Method : getSlipMax
	* 작성자 : PC05
	* 변경이력 :
	* @return
	* Method 설명 : max값 asset테이블에 넘겨주기 
	*/
	int getSlipMax();
	
	
	
}
