package kr.or.ddit.employee.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.employee.model.PositionVo;

@Repository("positionDao")
public class PositionDao implements IPositionDao{
	
	@Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public PositionVo selectPosition(String code) {
		return sqlSessionTemplate.selectOne("position.selectPosition", code);
	}

	@Override
	public int insertPosition(PositionVo Vo) {
		return sqlSessionTemplate.insert("position.insertPosition", Vo);
	}

	@Override
	public int deletePosition(String code) {
		return sqlSessionTemplate.delete("position.deletePosition", code);
	}

	@Override
	public List<PositionVo> getAllPosition() {
		List<PositionVo> selectList = sqlSessionTemplate.selectList("position.getAllPosition");
		return selectList;
	}

	@Override
	public int updatePosition(PositionVo Vo) {
		return sqlSessionTemplate.update("position.updatePosition",Vo);
	}
	
	
	
	

}
