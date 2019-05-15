package kr.or.ddit.product.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.product.model.ReceiveVo;

@Repository("receiveDao")
public class ReceiveDao implements IReceiveDao{

	@Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int insertReceive(ReceiveVo receiveVo) {
		return sqlSessionTemplate.insert("receive.insertReceive",receiveVo);
	}

	@Override
	public int deleteReceive(String receiveCode) {
		return sqlSessionTemplate.delete("receive.deleteReceive",receiveCode);
	}

	@Override
	public int updateReceive(ReceiveVo receiveVo) {
		return sqlSessionTemplate.update("receive.updateReceive",receiveVo);
	}


	@Override
	public List<ReceiveVo> getAllReceive(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("receive.getAllReceive",map);
	}

	@Override
	public ReceiveVo selectReceiveBycd(String receiveCode) {
		return sqlSessionTemplate.selectOne("receive.selectReceive",receiveCode);
	}



	@Override
	public List<ReceiveVo> selectReceive(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("receive.selectReceive",map);
	}

	@Override
	public List<ReceiveVo> groupSelectReceiveWhileThisYear(String receivedate) {
		return sqlSessionTemplate.selectList("receive.groupSelectReceiveWhileThisYear",receivedate);
	}
}
