package kr.or.ddit.order.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.order.model.Order_detailVo;

@Repository("order_detailDao")
public class Order_detailDao implements IOrder_detailDao{

	@Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<Order_detailVo> getOrder_detailByOrdercd(String orderCode) {
		return sqlSessionTemplate.selectList("order_detail.getOrder_detailByOrdercd",orderCode);
	}

	@Override
	public int deleteOrder_detail(String orderdetailcode) {
		return sqlSessionTemplate.delete("order_detail.deleteOrder_detail",orderdetailcode);
	}

	@Override
	public int insertOrder_detail(Order_detailVo order_detailVo) {
		return sqlSessionTemplate.insert("order_detail.insertOrder_detail",order_detailVo);
	}

	@Override
	public int deleteOrder_detailByOdcd(String orderCode) {
		return sqlSessionTemplate.delete("order_detail.deleteOrder_detailByOdcd",orderCode);
	}

}
