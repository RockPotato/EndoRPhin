package kr.or.ddit.product.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.product.model.Receive_detailVo;

@Repository("receive_detailDao")
public class Receive_detailDao implements IReceive_detailDao{

	@Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int insertReceive_detail(Receive_detailVo receive_detailVo) {
		return sqlSessionTemplate.insert("receive_detail.insertReceive_detail",receive_detailVo);
	}

	@Override
	public List<Receive_detailVo> getReceive_detail(String receiveCode) {
		return sqlSessionTemplate.selectList("receive_detail.getReceive_detail",receiveCode);
	}

	@Override
	public int deleteReceive_detail(Map<String, Object> map) {
		return sqlSessionTemplate.delete("receive_detail.deleteReceive_detail",map);
	}


}
