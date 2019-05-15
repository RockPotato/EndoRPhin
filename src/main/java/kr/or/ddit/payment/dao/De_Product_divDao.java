package kr.or.ddit.payment.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.payment.model.De_product_divVo;

@Repository("de_product_divDao")
public class De_Product_divDao implements IDe_Product_divDao{

	@Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<De_product_divVo> getAllDe_product_div() {
		return sqlSessionTemplate.selectList("de_product_div.getAllDe_product_div");
	}

	@Override
	public De_product_divVo selectDe_product_div(String deductCode) {
		return sqlSessionTemplate.selectOne("de_product_div.selectDe_product_div",deductCode);
	}

	@Override
	public int insertDe_product_div(De_product_divVo de_product_divVo) {
		return sqlSessionTemplate.insert("de_product_div.insertDe_product_div",de_product_divVo);
	}

	@Override
	public int deleteDe_product_div(String deductCode) {
		return sqlSessionTemplate.delete("de_product_div.deleteDe_product_div",deductCode);
	}

	@Override
	public List<De_product_divVo> selectDeproductByNm(De_product_divVo de_product_divVo) {
		return sqlSessionTemplate.selectList("de_product_div.selectDeproductByNm",de_product_divVo);
	}

	@Override
	public int updateDe_product_div(De_product_divVo de_product_divVo) {
		return sqlSessionTemplate.update("de_product_div.updateDe_product_div",de_product_divVo);
	}

	@Override
	public List<De_product_divVo> getDe_product_div(String deprostatus) {
		return sqlSessionTemplate.selectList("de_product_div.getDe_product_div",deprostatus);
	}

}
