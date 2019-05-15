package kr.or.ddit.order.service;

import java.util.List;

import kr.or.ddit.order.model.OrdersVo;

public interface IOrdersService {
	List<OrdersVo> searchByName(OrdersVo ordersVo);
	OrdersVo selectOrders(String orderCode);
	void updateAndInsertOrder(String[] quantity,String[] productCode,OrdersVo orderVo);
	int deleteOrders(String orderCode);
}
