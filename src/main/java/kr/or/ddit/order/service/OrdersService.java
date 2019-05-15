package kr.or.ddit.order.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.ddit.order.dao.IOrder_detailDao;
import kr.or.ddit.order.dao.IOrdersDao;
import kr.or.ddit.order.model.Order_detailVo;
import kr.or.ddit.order.model.OrdersVo;
import kr.or.ddit.tax_cal.dao.ISales_detailDao;
import kr.or.ddit.tax_cal.dao.ITax_calDao;
import kr.or.ddit.tax_cal.model.Sales_detailVo;
import kr.or.ddit.tax_cal.model.Tax_calVo;

@Service("ordersService")
public class OrdersService implements IOrdersService {

	private Logger logger = LoggerFactory.getLogger(OrdersService.class);

	@Resource(name = "ordersDao")
	IOrdersDao ordersDao;

	@Resource(name = "order_detailDao")
	IOrder_detailDao order_detailDao;

	@Resource(name = "tax_calDao")
	ITax_calDao tax_calDao;
	
	@Resource(name="sales_detailDao")
	ISales_detailDao sales_detailDao;

	@Override
	public List<OrdersVo> searchByName(OrdersVo ordersVo) {
		return ordersDao.searchByName(ordersVo);
	}

	@Override
	public OrdersVo selectOrders(String orderCode) {
		return ordersDao.selectOrders(orderCode);
	}

	@Override
	public void updateAndInsertOrder(String[] quantity, String[] productCode, OrdersVo orderVo) {
		if (orderVo.getOrderCode().equals("")) {
			ordersDao.insertOrders(orderVo);
			String tax_seqNextval = tax_calDao.getTax_seqNextval();
			int orderPrice = Integer.parseInt(orderVo.getOrderPrice());
			tax_calDao.insertTax_cal(
					new Tax_calVo(tax_seqNextval
							, new Date(), orderVo.getOrderPrice(), "과세매입",
							orderVo.getDeptCode(), Integer.toString(orderPrice / 10), orderVo.getOrderCode(),
							orderVo.getClientname(), Integer.toString(orderPrice + (orderPrice / 10)), "여", "외상"));
			sales_detailDao.insertSales_detail(new Sales_detailVo("차변",orderVo.getOrderPrice(),"146"
					,tax_seqNextval,"발주 공급가액"));
			sales_detailDao.insertSales_detail(new Sales_detailVo("차변",Integer.toString(orderPrice / 10),"135"
					,tax_seqNextval,"발주 부가세"));
			sales_detailDao.insertSales_detail(new Sales_detailVo("대변",Integer.toString(orderPrice + (orderPrice / 10)),"251"
					,tax_seqNextval,"발주 대변"));
		}

		else {
			ordersDao.updateOrders(orderVo);
		}
		order_detailDao.deleteOrder_detailByOdcd(orderVo.getOrderCode());
		for (int i = 0; i < quantity.length; i++) {
			order_detailDao.insertOrder_detail(
					new Order_detailVo((i + 1) + "", orderVo.getOrderCode(), quantity[i], productCode[i]));
		}
		ordersDao.updateOrders(orderVo);
	}

	@Override
	public int deleteOrders(String orderCode) {
		return ordersDao.deleteOrders(orderCode);
	}

}
