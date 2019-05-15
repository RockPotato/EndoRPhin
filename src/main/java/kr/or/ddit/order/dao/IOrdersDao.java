package kr.or.ddit.order.dao;

import java.util.List;

import kr.or.ddit.order.model.OrdersVo;

public interface IOrdersDao {
	List<OrdersVo> searchByName(OrdersVo ordersVo);
	OrdersVo selectOrders(String orderCode);
	int insertOrders(OrdersVo ordersVo);
	int updateOrders(OrdersVo ordersVo);
	int deleteOrders(String orderCode);
}
