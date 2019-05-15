package kr.or.ddit.slip.dao;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.set.LogicConfig;
import kr.or.ddit.slip.controller.SlipController;
import kr.or.ddit.slip.dao.ISlipDao;
import kr.or.ddit.slip.model.SlipVo;

public class SlipDaoTest extends LogicConfig {
	private Logger logger = LoggerFactory.getLogger(SlipController.class);
	
	@Resource(name="slipDao")
	private ISlipDao slipDao;

	@Test
	public void serachDateTest() {
		/***Given***/

		/***When***/
		List<SlipVo> slipList = slipDao.getBetweenSlip("19/03/13", "19/03/16");
		logger.debug("slipList : {}", slipList.size());
		/***Then***/
		assertNotNull(slipList);
	}
	@Test
	public void insertSlipTest() {
		SlipVo slipVo = new SlipVo();
		slipVo.setTotal("444");
		slipVo.setStatus("0");
		int insertSlip = slipDao.insertSlip(slipVo);
		logger.debug("asdflkn:{}",slipVo.getSlipNumber());
	}
}
