package kr.or.ddit.order.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.order.dao.IOrder_detailDao;
import kr.or.ddit.order.model.Order_detailVo;

@Service("order_detailService")
public class Order_detailService implements IOrder_detailService{
	@Resource(name="order_detailDao")
	IOrder_detailDao order_detailDao;

	@Override
	public List<Order_detailVo> getOrder_detailByOrdercd(String orderCode) {
		return order_detailDao.getOrder_detailByOrdercd(orderCode);
	}

	@Override
	public int deleteOrder_detail(String orderdetailcode) {
		return order_detailDao.deleteOrder_detail(orderdetailcode);
	}

	@Override
	public int insertOrder_detail(Order_detailVo order_detailVo) {
		return order_detailDao.insertOrder_detail(order_detailVo);
	}
}
