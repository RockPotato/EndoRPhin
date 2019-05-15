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
import kr.or.ddit.set.LogicConfig;

public class ProductDaoTest extends LogicConfig{

	private Logger logger = LoggerFactory.getLogger(ProductDaoTest.class);
	
	@Resource(name="productDao")
	IProductDao productDao;
	
	@Test
	public void getAllProductTest(){
		List<ProductVo> allProduct = productDao.getAllProduct();
		logger.debug("asdfljnsadf:{}",allProduct.size());
	}
	
	@Test
	public void insertProductTest() {
		ProductVo productVo = new ProductVo();
		productVo.setProductCode("2");
		productVo.setProductName("자1");
		productVo.setStandard("cm");
		productVo.setBasePrice("500");
		int insertPayment = productDao.insertProduct(productVo);
		assertEquals(1, insertPayment);
	}
	@Test
	public void selectProductTest() {
		ProductVo selectProduct = productDao.selectProduct("P1");
		assertTrue(selectProduct.getProductName().equals("자"));
	}
	@Test
	public void deleteProductTest() {
		int deleteProduct = productDao.deleteProduct("P2");
		assertEquals(1, deleteProduct);
	}

}
