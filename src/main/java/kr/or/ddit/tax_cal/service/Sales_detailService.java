package kr.or.ddit.tax_cal.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.tax_cal.dao.ISales_detailDao;
import kr.or.ddit.tax_cal.model.Sales_detailVo;

@Service("sales_detailService")
public class Sales_detailService implements ISales_detailService{

	
	@Resource(name="sales_detailDao")
	private ISales_detailDao sales_detailDao;

	@Override
	public int insertSales_detail(Sales_detailVo sales_detailVo) {
		return sales_detailDao.insertSales_detail(sales_detailVo);
	}

	@Override
	public List<Sales_detailVo> selectSales_detail(String salesCode) {
		return sales_detailDao.selectSales_detail(salesCode);
	}

	@Override
	public int updateSales_detail(Sales_detailVo sales_detailVo) {
		return sales_detailDao.updateSales_detail(sales_detailVo);
	}

	@Override
	public int deleteSales_detail(String salesCode) {
		return sales_detailDao.deleteSales_detail(salesCode);
	}
	
	
}
