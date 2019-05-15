package kr.or.ddit.order.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.image.dao.IImagesDao;
import kr.or.ddit.image.model.ImagesVo;
import kr.or.ddit.image.service.IImagesService;
import kr.or.ddit.order.dao.IOrdersDao;
import kr.or.ddit.order.model.OrdersVo;
import kr.or.ddit.product.model.ProductVo;
import kr.or.ddit.set.LogicConfig;

public class OrdersDaoTest extends LogicConfig{

	private Logger logger = LoggerFactory.getLogger(OrdersDaoTest.class);
	

	@Resource(name="ordersDao")
	IOrdersDao ordersDao;
	
	@Test
	public void searchByNameTest(){
		List<OrdersVo> searchByName = ordersDao.searchByName(new OrdersVo());
		logger.debug("asdfljnsadf:{}",searchByName.get(0).getOrderCode());
	}
	@Test
	public void selectOrdersTest(){
		OrdersVo selectOrders = ordersDao.selectOrders("0");
		logger.debug("확인 : {}",selectOrders);
	}

}
