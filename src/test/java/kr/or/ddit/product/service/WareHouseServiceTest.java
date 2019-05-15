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
import kr.or.ddit.product.model.WareHouseVo;
import kr.or.ddit.set.LogicConfig;

public class WareHouseServiceTest extends LogicConfig{

	private Logger logger = LoggerFactory.getLogger(WareHouseServiceTest.class);
	
	@Resource(name="wareHouseService")
	IWareHouseService wareHouseService;
	
	@Test
	public void getAllWarehouseTest(){
		List<WareHouseVo> allWarehouse = wareHouseService.getAllWarehouse();
		logger.debug("asdfljnsadf:{}",allWarehouse.size());
	}
	
	@Test
	public void insertWarehouseTest() {
		WareHouseVo warehouseVo = new WareHouseVo("2","준호창고");
		int insertWarehouse = wareHouseService.insertWarehouse(warehouseVo);
		assertEquals(1, insertWarehouse);
	}
	@Test
	public void selectWarehouseTest() {
		WareHouseVo selectWarehouse = wareHouseService.selectWarehouse("1");
		assertTrue(selectWarehouse.getWareHouseName().equals("준호창고"));
	}
	@Test
	public void deleteProductTest() {
		int deleteProduct = wareHouseService.deleteWarehouse("2");
		assertEquals(1, deleteProduct);
	}

}
