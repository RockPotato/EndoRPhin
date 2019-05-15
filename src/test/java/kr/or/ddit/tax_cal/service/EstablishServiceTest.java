package kr.or.ddit.tax_cal.service;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.set.LogicConfig;
import kr.or.ddit.tax_cal.dao.IEstablishDao;
import kr.or.ddit.tax_cal.model.EstablishVo;

public class EstablishServiceTest extends LogicConfig{


	@Resource(name="establishService")
	IEstablishService establishService;
	
	@Test
	public void insertEstablishTest() {
		EstablishVo establishVo = new EstablishVo();
		establishVo.setEstablishCode("444");
		establishVo.setEstablishNameKor("준호급여");
		establishVo.setStatus("c");
		establishVo.setUseStatus("1");
		int insertEstablish = establishService.insertEstablish(establishVo);
		assertEquals(1, insertEstablish);
	}
	@Test
	public void deleteEstablishTest() {
		int deleteEstablish = establishService.deleteEstablish("444");
		assertEquals(1,deleteEstablish);
	}
	@Test
	public void getAllEstablishTest() {
		List<EstablishVo> allEstablish = establishService.getAllEstablish();
		assertTrue(allEstablish.size()>0);
	}
	@Test
	public void selectEstablishTest() {
		EstablishVo selectEstablish = establishService.selectEstablish("1");
		assertEquals("급여", selectEstablish.getEstablishNameKor());
	}
	@Test
	public void selectEstablishByNmTest() {
		List<EstablishVo> allEstablish = establishService.selectEstablishByNm("급");
		assertTrue(allEstablish.size()>0);
	}

}
