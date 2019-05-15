package kr.or.ddit.product.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.product.model.Receive_detailVo;

public interface IReceive_detailDao {
	int insertReceive_detail(Receive_detailVo receive_detailVo);
	List<Receive_detailVo> getReceive_detail(String receiveCode);
	int deleteReceive_detail(Map<String, Object> map);
}
