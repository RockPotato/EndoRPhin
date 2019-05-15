package kr.or.ddit.payment.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.payment.model.De_product_divVo;
import kr.or.ddit.set.LogicConfig;

public class De_Product_divDaoTest extends LogicConfig{

	@Resource(name="de_product_divDao")
	IDe_Product_divDao de_product_divDao;
	
	@Test
	public void getAllDe_product_divTest() {
		List<De_product_divVo> allDe_product_div = de_product_divDao.getAllDe_product_div();
		assertTrue(allDe_product_div.size()>0);
	}
	@Test
	public void selectDe_product_divTest() {
		De_product_divVo selectDe_product_div = de_product_divDao.selectDe_product_div("1");
		assertNotNull(selectDe_product_div);
	}
	@Test
	public void insertDe_product_divTest() {
		De_product_divVo de_product_divVo= new De_product_divVo();
		de_product_divVo.setDeductCode("3");
		de_product_divVo.setDeductName("야근수당");
		de_product_divVo.setUseStatus("1");
		int insertDe_product_div = de_product_divDao.insertDe_product_div(de_product_divVo);
		assertEquals(1, insertDe_product_div);
	}
	@Test
	public void updateDe_product_divTest() {
		De_product_divVo de_product_divVo= new De_product_divVo();
		de_product_divVo.setDeductCode("3");
		de_product_divVo.setDeductName("야근수당1");
		de_product_divVo.setUseStatus("1");
		int insertDe_product_div = de_product_divDao.updateDe_product_div(de_product_divVo);
		assertEquals(1, insertDe_product_div);
	}
	@Test
	public void deleteDe_product_divTest() {
		int deleteDe_product_div = de_product_divDao.deleteDe_product_div("3");
		assertEquals(1, deleteDe_product_div);
		
	}
	
	@Test
	public void selectDeproductByNmTest() {
		De_product_divVo de_product_divVo = new De_product_divVo();
		de_product_divVo.setDeductName("급");
		de_product_divVo.setDeprostatus("1");
		List<De_product_divVo> selectDeproductByNm = de_product_divDao.selectDeproductByNm(de_product_divVo);
		assertEquals("기본급", selectDeproductByNm.get(0).getDeductName());
		
	}
	@Test
	public void getDe_product_divTest() {
		List<De_product_divVo> selectDeproductByNm = de_product_divDao.getDe_product_div("1");
		assertEquals("기본급", selectDeproductByNm.get(0).getDeductName());
	}

}
