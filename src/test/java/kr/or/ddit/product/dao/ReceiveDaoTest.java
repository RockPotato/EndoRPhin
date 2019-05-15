package kr.or.ddit.product.dao;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.payment.model.PaymentVo;
import kr.or.ddit.product.model.ProductVo;
import kr.or.ddit.product.model.ReceiveVo;
import kr.or.ddit.set.LogicConfig;

public class ReceiveDaoTest extends LogicConfig{

	private Logger logger = LoggerFactory.getLogger(ReceiveDaoTest.class);
	
	@Resource(name="receiveDao")
	IReceiveDao receiveDao;
	
	@Test
	public void getAllProductTest(){
		List<ReceiveVo> allReceive = receiveDao.getAllReceive(new HashMap<>());
		logger.debug("asdfljnsadf:{}",allReceive.size());
	}
	
	@Test
	public void insertReceiveTest() {
		ReceiveVo receiveVo= new ReceiveVo("2019-04-11", "0", "1");
		int insertPayment = receiveDao.insertReceive(receiveVo);
		assertEquals(1, insertPayment);
	}
	@Test
	public void selectReceiveTest() {
		Map<String, Object> map = new HashMap<>();
		map.put("orderCode", "5");
		List<ReceiveVo> selectReceive = receiveDao.selectReceive(map);
		logger.debug("호ㅓㅏㄱ인 : {}",selectReceive.size());
		assertTrue(selectReceive.get(0).getWarehousename().equals("처음 준호 창고"));
	}
	@Test
	public void deleteReceiveTest() {
		int deleteReceive = receiveDao.deleteReceive("3");
		assertEquals(1, deleteReceive);
	}
	@Test
	public void updateReceiveTest() {
		ReceiveVo receiveVo= new ReceiveVo("2019-04-19", "0", "1");
		receiveVo.setReceiveCode("3");
		receiveDao.updateReceive(receiveVo);
	}

}
