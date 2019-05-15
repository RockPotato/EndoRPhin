package kr.or.ddit.product.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.product.model.ReceiveVo;

public interface IReceiveService {
	int insertReceive(ReceiveVo receiveVo);
	List<ReceiveVo> getAllReceive(Map<String,Object> map);
	List<ReceiveVo> selectReceive(Map<String,Object> map);
	int deleteReceive(String receiveCode);
	int updateReceive(ReceiveVo receiveVo);
	Map<String,Object> selectReceiveNdetail(String orderCode);
	List<ReceiveVo> groupSelectReceiveWhileThisYear(String receivedate);
}
