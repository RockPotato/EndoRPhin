package kr.or.ddit.employee.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.employee.dao.IPositionDao;
import kr.or.ddit.employee.model.PositionVo;


@Service("positionService")
public class PositionService implements IPositionService{
	
	@Resource(name="positionDao")
	private IPositionDao positionDao;

	@Override
	public PositionVo selectPosition(String code) {
		return positionDao.selectPosition(code);
	}

	@Override
	public int insertPosition(PositionVo Vo) {
		return positionDao.insertPosition(Vo);
	}

	@Override
	public int deletePosition(String code) {
		return positionDao.deletePosition(code);
	}

	@Override
	public List<PositionVo> getAllPosition() {
		return positionDao.getAllPosition();
	}

	@Override
	public int updatePosition(PositionVo Vo) {
		return positionDao.updatePosition(Vo);
	}
	
	

}
