package kr.or.ddit.product.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.product.dao.IProductDao;
import kr.or.ddit.product.model.ProductVo;

@Service("productService")
public class ProductService implements IProductService{

	@Resource(name="productDao")
	IProductDao productDao;
	
	@Override
	public int insertProduct(ProductVo productVo) {
		return productDao.insertProduct(productVo);
	}

	@Override
	public List<ProductVo> getAllProduct() {
		return productDao.getAllProduct();
	}

	@Override
	public ProductVo selectProduct(String productCode) {
		return productDao.selectProduct(productCode);
	}

	@Override
	public int deleteProduct(String productCode) {
		return productDao.deleteProduct(productCode);
	}

	@Override
	public List<ProductVo> searchByName(String productName) {
		return productDao.searchByName(productName);
	}

	@Override
	public int updateProduct(ProductVo productVo) {
		return productDao.updateProduct(productVo);
	}

}
