package kr.or.ddit.product.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.product.model.ReceiveVo;
import kr.or.ddit.product.model.Receive_detailVo;
import kr.or.ddit.set.LogicConfig;

public class Receive_detailDaoTest extends LogicConfig{

	private Logger logger = LoggerFactory.getLogger(Receive_detailDaoTest.class);
	
	@Resource(name="receive_detailDao")
	IReceive_detailDao receive_detailDao;
	
	@Test
	public void getAllProductTest(){
		List<Receive_detailVo> receive_detail = receive_detailDao.getReceive_detail("3");
		logger.debug("asdfljnsadf:{}",receive_detail.size());
	}
	
	@Test
	public void insertReceiveTest() {
		Receive_detailVo receive_detailVo = new Receive_detailVo("3", "P11", "20");
		int insertPayment = receive_detailDao.insertReceive_detail(receive_detailVo );
		assertEquals(1, insertPayment);
	}
	@Test
	public void deleteReceiveTest() {
		Map<String, Object> map = new HashMap<>();
		map.put("receiveCode", "3");
		int deleteReceive_detail = receive_detailDao.deleteReceive_detail(map);
		assertTrue(deleteReceive_detail>0);
	}

}
