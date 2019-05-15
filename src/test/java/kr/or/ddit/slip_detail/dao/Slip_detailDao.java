package kr.or.ddit.slip_detail.dao;

import static org.junit.Assert.assertEquals;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.set.LogicConfig;
import kr.or.ddit.slip.dao.ISlip_detailDao;
import kr.or.ddit.slip.model.Slip_detailVo;

public class Slip_detailDao extends LogicConfig {

	@Resource(name = "slip_detailDao")
	private ISlip_detailDao slip_detailDao;

	@Test
	public void insertDetailSlipTest() {
		/*** Given ***/
		Slip_detailVo vo = new Slip_detailVo();

		/*** When ***/
		vo.setSlipNumber("01");
		vo.setStatus("2");
		vo.setPrice("15000");
		vo.setClientCard("김청과");
		vo.setSlipDetailNo("002");
		vo.setEstablishCode("101");

		int cnt = slip_detailDao.insertDetailSlip(vo);

		/*** Then ***/
		assertEquals(1, cnt);
	}

}
