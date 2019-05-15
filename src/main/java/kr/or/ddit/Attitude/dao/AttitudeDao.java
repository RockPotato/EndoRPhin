package kr.or.ddit.Attitude.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.Attitude.model.AttitudeVo;

@Repository("attitudeDao")
public class AttitudeDao implements IAttitudeDao{
	
	@Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;
	

	@Override
	public List<AttitudeVo> getAllAttitude() {
				
				
		List<AttitudeVo> list = sqlSessionTemplate.selectList("attitude.getAllAttitude");
		
				return list;
				
	}
	
	@Override
	public int insertAttitude(AttitudeVo vo) {
		return sqlSessionTemplate.insert("attitude.insertAttitude",vo);
		
	}

	@Override
	public int deleteAttitude(String code) {
		return sqlSessionTemplate.delete("attitude.deleteAttitude",code);
	}

	@Override
	public int updateAttitude(AttitudeVo Vo) {
		return sqlSessionTemplate.update("attitude.updateAttitude",Vo);
	}

	@Override
	public List<AttitudeVo> SearchAttitude(AttitudeVo code) {
		return sqlSessionTemplate.selectList("attitude.SearchAttitude",code);
	}

	@Override
	public AttitudeVo SelectAttitude(String code) {
		return sqlSessionTemplate.selectOne("attitude.SelectAttitude",code);
	}

}





























