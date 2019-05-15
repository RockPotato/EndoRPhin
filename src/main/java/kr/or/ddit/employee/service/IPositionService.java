package kr.or.ddit.employee.service;

import java.util.List;

import kr.or.ddit.employee.model.PositionVo;

public interface IPositionService {
	
	/**
	* Method : selectPosition
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param code
	* @return
	* Method 설명 :
	*/
	public PositionVo selectPosition(String code);
	/**
	* Method : insertPosition
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param Vo
	* @return
	* Method 설명 :
	*/
	int insertPosition(PositionVo Vo);
	/**
	* Method : deletePosition
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param code
	* @return
	* Method 설명 :
	*/
	int deletePosition(String code);
	/**
	* Method : getAllPosition
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @return
	* Method 설명 :
	*/
	List<PositionVo> getAllPosition();
	
	
	/**
	* Method : insertPosition
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param Vo
	* @return
	* Method 설명 : 직급/직책 업뎃
	*/
	int updatePosition(PositionVo Vo);

}
