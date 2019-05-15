package kr.or.ddit.Attitude.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.Attitude.model.Attitude_recordVo;

@Repository("attitude_recordDao")
public class Attitude_recordDao implements IAttitude_recordDao{
	
	@Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<Attitude_recordVo> getAllAttitude_record() {
		return sqlSessionTemplate.selectList("attitude_record.getAllAttitude_record");
		
	}

	@Override
	public int insertAttitude_record(Attitude_recordVo vo) {
		return sqlSessionTemplate.insert("attitude_record.insertAttitude_record",vo);
	}

	@Override
	public int deleteAttitude_record(Attitude_recordVo code) {
		return sqlSessionTemplate.delete("attitude_record.deleteAttitude_record",code);
	}

	
	@Override
	public int updateAttitude_record(Attitude_recordVo Vo) {
		return sqlSessionTemplate.update("attitude_record.updateAttitude_record",Vo);
	}

	@Override
	public List<Attitude_recordVo> SearchAttitude_record(Attitude_recordVo code) {
		return sqlSessionTemplate.selectList("attitude_record.SearchattitudeRecord",code);
	}

	@Override
	public Attitude_recordVo SelectAttitude_record(Attitude_recordVo code) {
		return sqlSessionTemplate.selectOne("attitude_record.SelectAttitude_record",code);
	}

}
