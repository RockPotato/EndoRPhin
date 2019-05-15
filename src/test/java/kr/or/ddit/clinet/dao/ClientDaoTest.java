package kr.or.ddit.clinet.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.order.dao.IClientDao;
import kr.or.ddit.order.model.ClientVo;
import kr.or.ddit.set.LogicConfig;

public class ClientDaoTest extends LogicConfig{
	
	private Logger logger = LoggerFactory.getLogger(ClientDaoTest.class);
	
	@Resource(name="clientDao")
	private IClientDao clientDao;

	
	
	@Test
	public void getClientTest() {
		/***Given***/

		/***When***/
		List<ClientVo> clientList = clientDao.getAllClient();
		logger.debug("clientList size : {}", clientList.size());

		/***Then***/
		assertEquals(1, clientList.size());
		
	}
	
	@Test
	public void getCodeClientTest() {
		/***Given***/

		/***When***/
		List<ClientVo> clientList = clientDao.getCodeClient("1");
		logger.debug("clientList size : {}", clientList.size());
		
		/***Then***/
		assertNotNull(clientList);
	}
	
	
	@Test
	public void getNameClientTest() {
		/***Given***/

		/***When***/
		List<ClientVo> clientList = clientDao.getNameClient("청");
		logger.debug("clientList size : {}", clientList.size());
		
		/***Then***/
		assertNotNull(clientList);
	}
	
	
	@Test
	public void getBothClientTest() {
		/***Given***/

		/***When***/
		List<ClientVo> clientList = clientDao.getBothClient("청", "1");
		logger.debug("clientList size : {}", clientList.size());
		
		/***Then***/
		assertNotNull(clientList);
	}
	
	
	@Test
	public void insertClient() {
		/***Given***/

		/***When***/
		ClientVo vo = new ClientVo();
		
		vo.setClientCode("102");
		vo.setClientName("지청과");
		vo.setSalesNumber("1231212345");
		vo.setFaxNumber("12312312");
		vo.setManager("지무무");
		vo.setManagerEmail("asdf@ads.com");
		vo.setTelephone("0421230101");
		vo.setBankName("국민은행");
		vo.setAccountNumber("4424242");
		vo.setBusiness("도소매");
		vo.setBusinessType("과세");
		vo.setPlace("zzzz");
		vo.setRelate("zzxcv");
		
		int cnt = clientDao.insertClient(vo);
		
		/***Then***/
		assertEquals(1, cnt);
	}

}
