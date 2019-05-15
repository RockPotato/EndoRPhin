package kr.or.ddit.schedule.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.schedule.model.ScheduleVo;

@Repository("scheduleDao")
public class ScheduleDao implements IScheduleDao{

	
	@Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;
	
	
	
	@Override
	public List<ScheduleVo> getAllSchedule() {
		
		return sqlSessionTemplate.selectList("schedule.getAllSchedule");
	}

	
	
	@Override
	public int insertSchedule(ScheduleVo vo) {
		return sqlSessionTemplate.insert("schedule.insertSchedule",vo);
	}

	
	@Override
	public int deleteSchedule(String code) {
		return sqlSessionTemplate.delete("schedule.deleteSchedule",code);
	}

	
	@Override
	public int modifySchedule(ScheduleVo code) {
		return sqlSessionTemplate.update("schedule.updateSchedule",code);
				
	}

	
}
