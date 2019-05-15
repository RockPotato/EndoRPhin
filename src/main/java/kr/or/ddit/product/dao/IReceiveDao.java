package kr.or.ddit.product.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.product.model.ReceiveVo;

public interface IReceiveDao {
	int insertReceive(ReceiveVo receiveVo);
	List<ReceiveVo> getAllReceive(Map<String,Object> map);
	List<ReceiveVo> selectReceive(Map<String,Object> map);
	ReceiveVo selectReceiveBycd(String receiveCode);
	int deleteReceive(String receiveCode);
	int updateReceive(ReceiveVo receiveVo);
	List<ReceiveVo> groupSelectReceiveWhileThisYear(String receivedate);
	
	
}
