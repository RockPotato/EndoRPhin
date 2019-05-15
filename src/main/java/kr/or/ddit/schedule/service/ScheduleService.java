package kr.or.ddit.schedule.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.schedule.dao.IScheduleDao;
import kr.or.ddit.schedule.model.ScheduleVo;
@Service("scheduleService")
public class ScheduleService implements IScheduleService{
	
	@Resource(name="scheduleDao")
	private IScheduleDao scheduleDao;

	@Override
	public List<ScheduleVo> getAllSchedule() {
		return scheduleDao.getAllSchedule();
	}

	@Override
	public int insertSchedule(ScheduleVo vo) {
		return scheduleDao.insertSchedule(vo);
	}

	@Override
	public int deleteSchedule(String code) {
		return scheduleDao.deleteSchedule(code);
		
	}

	@Override
	public int modifySchedule(ScheduleVo code) {
		return scheduleDao.modifySchedule(code);
	}

}
