package kr.or.ddit.product.service;

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

public class ProductServiceTest extends LogicConfig{

	private Logger logger = LoggerFactory.getLogger(ProductServiceTest.class);
	
	@Resource(name="productService")
	IProductService productService;
	
	@Test
	public void getAllProductTest(){
		List<ProductVo> allProduct = productService.getAllProduct();
		logger.debug("asdfljnsadf:{}",allProduct.size());
	}
	
	@Test
	public void insertProductTest() {
		ProductVo productVo = new ProductVo();
		productVo.setProductCode("2");
		productVo.setProductName("자1");
		productVo.setStandard("cm");
		productVo.setBasePrice("500");
		int insertPayment = productService.insertProduct(productVo);
		assertEquals(1, insertPayment);
	}
	@Test
	public void selectProductTest() {
		ProductVo selectProduct = productService.selectProduct("P1");
		assertTrue(selectProduct.getProductName().equals("자"));
	}
	@Test
	public void deleteProductTest() {
		int deleteProduct = productService.deleteProduct("P2");
		assertEquals(1, deleteProduct);
	}

}
