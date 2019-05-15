package kr.or.ddit.order.service;

import java.util.List;

import kr.or.ddit.order.model.Order_detailVo;

public interface IOrder_detailService {
	List<Order_detailVo> getOrder_detailByOrdercd(String orderCode);
	int deleteOrder_detail(String orderdetailcode);
	int insertOrder_detail(Order_detailVo order_detailVo);
}
