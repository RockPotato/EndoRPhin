package kr.or.ddit.tax_cal.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.tax_cal.model.Sales_detailVo;

@Repository("sales_detailDao")
public class Sales_detailDao implements ISales_detailDao{
	
	
	@Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int insertSales_detail(Sales_detailVo sales_detailVo) {
		return sqlSessionTemplate.insert("sales_detail.insertSales_detail", sales_detailVo);
				
	}

	@Override
	public List<Sales_detailVo> selectSales_detail(String salesCode) {
		return sqlSessionTemplate.selectList("sales_detail.selectSales_detail", salesCode);
	}

	@Override
	public int updateSales_detail(Sales_detailVo sales_detailVo) {
		return sqlSessionTemplate.update("sales_detail.updateSales_detail", sales_detailVo);
	}

	@Override
	public int deleteSales_detail(String salesCode) {
		return sqlSessionTemplate.delete("sales_detail.deleteSales_detail", salesCode);
	}

}

