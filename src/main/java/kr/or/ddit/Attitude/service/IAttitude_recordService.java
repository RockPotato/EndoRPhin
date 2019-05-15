package kr.or.ddit.Attitude.service;

import java.util.List;

import kr.or.ddit.Attitude.model.AttitudeVo;
import kr.or.ddit.Attitude.model.Attitude_recordVo;

public interface IAttitude_recordService {
	
	/**
	* Method : getAllAttitude
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @return
	* Method 설명 : 근태이력 전체 가져오기
	*/
	List<Attitude_recordVo> getAllAttitude_record();
	
	
	/**
	* Method : insertAttitude
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param vo
	* @return
	* Method 설명 : 근태이력 인서트
	*/
	int insertAttitude_record(Attitude_recordVo vo);
	
	
	/**
	* Method : deleteAttitude
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param userId
	* @return
	* Method 설명 : 근태이력 삭제
	*/
	int deleteAttitude_record(Attitude_recordVo code);
	
	
	
	
	/**
	* Method : updateAttitude
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param employeeVo
	* @return
	* Method 설명 : 근태이력 업데이트
	*/
	int updateAttitude_record(Attitude_recordVo Vo);
	
	
	
	/**
	* Method : SearchAttitude
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param userId
	* @return
	* Method 설명 : 근태이력 검색
	*/
	public List<Attitude_recordVo> SearchAttitude_record(Attitude_recordVo code);
	
	
	
	/**
	* Method : SearchEmployee
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param userId
	* @return
	* Method 설명 : 선택 이력 가져오기
	*/
	public Attitude_recordVo SelectAttitude_record(Attitude_recordVo code);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}