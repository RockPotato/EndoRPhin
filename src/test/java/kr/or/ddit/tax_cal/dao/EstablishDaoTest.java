package kr.or.ddit.tax_cal.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.set.LogicConfig;
import kr.or.ddit.tax_cal.model.EstablishVo;

public class EstablishDaoTest extends LogicConfig{

	@Resource(name="establishDao")
	IEstablishDao establishDao;
	
	@Test
	public void insertEstablishTest() {
		EstablishVo establishVo = new EstablishVo();
		establishVo.setEstablishCode("444");
		establishVo.setEstablishNameKor("준호급여");
		establishVo.setStatus("c");
		establishVo.setUseStatus("1");
		int insertEstablish = establishDao.insertEstablish(establishVo);
		assertEquals(1, insertEstablish);
	}
	@Test
	public void deleteEstablishTest() {
		int deleteEstablish = establishDao.deleteEstablish("444");
		assertEquals(1,deleteEstablish);
	}
	@Test
	public void getAllEstablishTest() {
		List<EstablishVo> allEstablish = establishDao.getAllEstablish();
		assertTrue(allEstablish.size()>0);
	}
	@Test
	public void selectEstablishByNmTest() {
		List<EstablishVo> allEstablish = establishDao.selectEstablishByNm("급");
		assertTrue(allEstablish.size()>0);
	}
	@Test
	public void selectEstablishTest() {
		EstablishVo selectEstablish = establishDao.selectEstablish("1");
		assertEquals("급여", selectEstablish.getEstablishNameKor());
	}

}
