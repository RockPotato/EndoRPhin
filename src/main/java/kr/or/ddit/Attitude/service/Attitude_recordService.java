package kr.or.ddit.Attitude.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.Attitude.dao.IAttitude_recordDao;
import kr.or.ddit.Attitude.model.Attitude_recordVo;
@Service("attitude_recordService")
public class Attitude_recordService implements IAttitude_recordService{
	
	@Resource(name="attitude_recordDao")
	private IAttitude_recordDao attitude_recordDao;

	@Override
	public List<Attitude_recordVo> getAllAttitude_record() {
		return attitude_recordDao.getAllAttitude_record();
		
	}

	@Override
	public int insertAttitude_record(Attitude_recordVo vo) {
		return attitude_recordDao.insertAttitude_record(vo);
		
	}

	@Override
	public int deleteAttitude_record(Attitude_recordVo code) {
		
		return attitude_recordDao.deleteAttitude_record(code);
	}

	@Override
	public int updateAttitude_record(Attitude_recordVo Vo) {
		return attitude_recordDao.updateAttitude_record(Vo);
		
	}

	@Override
	public List<Attitude_recordVo> SearchAttitude_record(Attitude_recordVo code) {
		return attitude_recordDao.SearchAttitude_record(code);
	}

	@Override
	public Attitude_recordVo SelectAttitude_record(Attitude_recordVo code) {
		return attitude_recordDao.SelectAttitude_record(code);
	}

	
	
}
