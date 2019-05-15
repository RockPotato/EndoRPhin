package kr.or.ddit.tax_cal.dao;

import java.util.List;

import kr.or.ddit.tax_cal.model.EstablishVo;
import kr.or.ddit.util.model.PageVo;

public interface IEstablishDao {
	int insertEstablish(EstablishVo establishVo);
	int deleteEstablish(String establishcode);
	List<EstablishVo> getAllEstablish();
	List<EstablishVo> selectEstablishByNm(String establishNameKor);
	EstablishVo selectEstablish(String establishcode); 
	
	/**
	* Method : selectEstablishPagingList
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : Ajax를 통한 페이징 조회
	*/
	public List<EstablishVo> selectEstablishPagingList(PageVo pageVo);
	
	
	/**
	* Method : getEstablishCount
	* 작성자 : sanghoyun
	* 변경이력 :
	* @return
	* Method 설명 : 계정과목 수량 확인
	*/
	public int getEstablishCount();
	
	
	/**
	* Method : updateEstblish
	* 작성자 : sanghoyun
	* 변경이력 :
	* @return
	* Method 설명 : 계정과목 코드를 키값으로 하는 데이터수정
	*/
	public int updateEstblish(EstablishVo vo);
	
}
