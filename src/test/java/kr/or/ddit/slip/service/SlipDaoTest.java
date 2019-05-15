package kr.or.ddit.slip.service;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.set.LogicConfig;
import kr.or.ddit.slip.controller.SlipController;
import kr.or.ddit.slip.model.SlipVo;

public class SlipDaoTest extends LogicConfig {
	private Logger logger = LoggerFactory.getLogger(SlipController.class);
	
	@Resource(name="slipService")
	private ISlipService slipService;

	@Test
	public void serachDateTest() {
		/***Given***/

		/***When***/
		List<SlipVo> slipList = slipService.getBetweenSlip("19/03/13", "19/03/16");
		logger.debug("slipList : {}", slipList.size());
		/***Then***/
		assertNotNull(slipList);
	}
}
