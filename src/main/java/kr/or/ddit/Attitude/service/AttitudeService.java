package kr.or.ddit.Attitude.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.Attitude.dao.IAttitudeDao;
import kr.or.ddit.Attitude.model.AttitudeVo;


@Service("attitudeService")
public class AttitudeService implements IAttitudeService{
	
	
	
	@Resource(name="attitudeDao")
	private IAttitudeDao attitudeDao;

	@Override
	public List<AttitudeVo> getAllAttitude() {
		return attitudeDao.getAllAttitude();
	}

	
	
	@Override
	public int insertAttitude(AttitudeVo vo) {
		return attitudeDao.insertAttitude(vo);
	}



	@Override
	public int deleteAttitude(String code) {
		return attitudeDao.deleteAttitude(code);
	}



	@Override
	public int updateAttitude(AttitudeVo Vo) {
		return attitudeDao.updateAttitude(Vo);
	}


	@Override
	public List<AttitudeVo> SearchAttitude(AttitudeVo code) {
		return attitudeDao.SearchAttitude(code);
	}



	@Override
	public AttitudeVo SelectAttitude(String code) {
		return attitudeDao.SelectAttitude(code);
	}

	
	
	
	
}
