package kr.or.ddit.product.dao;

import java.util.List;

import kr.or.ddit.product.model.ProductVo;

public interface IProductDao {
	int insertProduct(ProductVo productVo);
	int updateProduct(ProductVo productVo);
	List<ProductVo> getAllProduct();
	List<ProductVo> searchByName(String productName);
	ProductVo selectProduct(String productCode);
	int deleteProduct(String productCode);
}
