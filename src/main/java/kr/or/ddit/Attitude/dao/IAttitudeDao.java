package kr.or.ddit.Attitude.dao;

import java.util.List;

import kr.or.ddit.Attitude.model.AttitudeVo;
import kr.or.ddit.employee.model.EmployeeVo;

public interface IAttitudeDao {
	
	/**
	* Method : getAllEmployee
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @return
	* Method 설명 : 근태항목 전체 가져오기
	*/
	List<AttitudeVo> getAllAttitude();
	
	
	/**
	* Method : insertEmployee
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param vo
	* @return
	* Method 설명 : 근태항목 인서트
	*/
	int insertAttitude(AttitudeVo vo);
	
	
	
	
	/**
	* Method : deleteEmployee
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param userId
	* @return
	* Method 설명 : 근태항목 삭제
	*/
	int deleteAttitude(String code);
	
	
	
	
	/**
	* Method : updateEmployee
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param employeeVo
	* @return
	* Method 설명 : 근태항목 업데이트
	*/
	int updateAttitude(AttitudeVo Vo);
	
	
	
	/**
	* Method : SearchEmployee
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param userId
	* @return
	* Method 설명 : 근태항목 검색
	*/
	public List<AttitudeVo> SearchAttitude(AttitudeVo code);
	
	
	/**
	* Method : SearchEmployee
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param userId
	* @return
	* Method 설명 : 선택 항목 가져오기
	*/
	public AttitudeVo SelectAttitude(String code);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
