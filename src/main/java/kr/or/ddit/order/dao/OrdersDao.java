package kr.or.ddit.order.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.order.model.OrdersVo;

@Repository("ordersDao")
public class OrdersDao implements IOrdersDao{

	@Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<OrdersVo> searchByName(OrdersVo ordersVo) {
		return sqlSessionTemplate.selectList("orders.searchByName",ordersVo);
	}

	@Override
	public OrdersVo selectOrders(String orderCode) {
		return sqlSessionTemplate.selectOne("orders.selectOrders",orderCode);
	}

	@Override
	public int insertOrders(OrdersVo ordersVo) {
		return sqlSessionTemplate.insert("orders.insertOrders",ordersVo);
	}

	@Override
	public int deleteOrders(String orderCode) {
		return sqlSessionTemplate.delete("orders.deleteOrders",orderCode);
	}

	@Override
	public int updateOrders(OrdersVo ordersVo) {
		return sqlSessionTemplate.insert("orders.updateOrders",ordersVo);
	}
	
}
