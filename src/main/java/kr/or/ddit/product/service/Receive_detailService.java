package kr.or.ddit.product.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.product.dao.IReceive_detailDao;
import kr.or.ddit.product.model.Receive_detailVo;

@Service("receive_detailService")
public class Receive_detailService implements IReceive_detailService{

	@Resource(name="receive_detailDao")
	IReceive_detailDao receive_detailDao;
	
	@Override
	public int insertReceive_detail(Receive_detailVo receive_detailVo) {
		return receive_detailDao.insertReceive_detail(receive_detailVo);
	}

	@Override
	public List<Receive_detailVo> getReceive_detail(String receiveCode) {
		return receive_detailDao.getReceive_detail(receiveCode);
	}

	@Override
	public int deleteReceive_detail(Map<String, Object> map) {
		return receive_detailDao.deleteReceive_detail(map);
	}

}
