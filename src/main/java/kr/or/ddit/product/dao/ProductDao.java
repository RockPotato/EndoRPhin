package kr.or.ddit.product.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.product.model.ProductVo;

@Repository("productDao")
public class ProductDao implements IProductDao{

	@Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int insertProduct(ProductVo productVo) {
		return sqlSessionTemplate.insert("product.insertProduct",productVo);
	}

	@Override
	public List<ProductVo> getAllProduct() {
		return sqlSessionTemplate.selectList("product.getAllProduct");
	}

	@Override
	public ProductVo selectProduct(String productCode) {
		return sqlSessionTemplate.selectOne("product.selectProduct",productCode);
	}

	@Override
	public int deleteProduct(String productCode) {
		return sqlSessionTemplate.delete("product.deleteProduct",productCode);
	}

	@Override
	public List<ProductVo> searchByName(String productName) {
		return sqlSessionTemplate.selectList("product.searchByName",productName);
	}

	@Override
	public int updateProduct(ProductVo productVo) {
		return sqlSessionTemplate.update("product.updateProduct",productVo);
	}

}
