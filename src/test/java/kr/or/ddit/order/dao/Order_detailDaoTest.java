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
import kr.or.ddit.order.model.Order_detailVo;
import kr.or.ddit.order.model.OrdersVo;
import kr.or.ddit.product.model.ProductVo;
import kr.or.ddit.set.LogicConfig;

public class Order_detailDaoTest extends LogicConfig{

	private Logger logger = LoggerFactory.getLogger(Order_detailDaoTest.class);
	

	@Resource(name="order_detailDao")
	IOrder_detailDao order_detailDao;
	
	@Test
	public void getOrder_detailByOrdercdTest(){
		List<Order_detailVo> order_detailByOrdercd = order_detailDao.getOrder_detailByOrdercd("0");
		logger.debug("asdfljnsadf:{}",order_detailByOrdercd.size());
	}
	@Test
	public void insertOrder_detailTest(){
		
		Order_detailVo order_detailVo= new Order_detailVo();
		order_detailVo.setOrderCode("0");
		order_detailVo.setOrderDetailCode("1");
		order_detailVo.setProductCode("P0");
		order_detailVo.setQuantity("100");
		order_detailDao.insertOrder_detail(order_detailVo);
	}

}
