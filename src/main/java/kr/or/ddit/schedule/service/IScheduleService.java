package kr.or.ddit.schedule.service;

import java.util.List;

import kr.or.ddit.schedule.model.ScheduleVo;

public interface IScheduleService {
	
	/**
	* Method : getAllAttitude
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @return
	* Method 설명 : 스케줄이력 전체 가져오기
	*/
	List<ScheduleVo> getAllSchedule();
	
	
	/**
	* Method : insertAttitude
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param vo
	* @return
	* Method 설명 : 스케줄이력 인서트
	*/
	int insertSchedule(ScheduleVo vo);
	
	/**
	* Method : deleteAttitude
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param userId
	* @return
	* Method 설명 : 스케줄이력 삭제
	*/
	int deleteSchedule(String code);
	
	/**
	* Method : deleteAttitude
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param userId
	* @return
	* Method 설명 : 스케줄이력 수정
	*/
	int modifySchedule(ScheduleVo code);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}