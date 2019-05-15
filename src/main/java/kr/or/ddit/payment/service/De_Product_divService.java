package kr.or.ddit.payment.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.payment.dao.IDe_Product_divDao;
import kr.or.ddit.payment.model.De_product_divVo;
import kr.or.ddit.tax_cal.dao.IEstablishDao;

@Service("de_product_divService")
public class De_Product_divService implements IDe_Product_divService{

	@Resource(name="de_product_divDao")
	IDe_Product_divDao de_product_divDao;
	
	@Resource(name="establishDao")
	IEstablishDao establishDao;
	
	
	@Override
	public List<De_product_divVo> getAllDe_product_div() {
		return de_product_divDao.getAllDe_product_div();
	}

	@Override
	public De_product_divVo selectDe_product_div(String deductCode) {
		return de_product_divDao.selectDe_product_div(deductCode);
	}

	@Override
	public int insertDe_product_div(De_product_divVo de_product_divVo) {
		return de_product_divDao.insertDe_product_div(de_product_divVo);
	}

	@Override
	public int deleteDe_product_div(String deductCode) {
		return de_product_divDao.deleteDe_product_div(deductCode);
	}

	@Override
	public List<De_product_divVo> selectDeproductByNm(De_product_divVo de_product_divVo) {
		List<De_product_divVo> selectDeproductByNm = de_product_divDao.selectDeproductByNm(de_product_divVo);
		for (De_product_divVo de_product_divVo2 : selectDeproductByNm) {
			if(de_product_divVo2.getEstablishcode()==null)
				continue;
			de_product_divVo2.setEstablishName(establishDao.selectEstablish(de_product_divVo2.getEstablishcode()).getEstablishNameKor());
		}
		return selectDeproductByNm;
	}

	@Override
	public int updateDe_product_div(De_product_divVo de_product_divVo) {
		return de_product_divDao.updateDe_product_div(de_product_divVo);
	}

	@Override
	public List<De_product_divVo> getDe_product_div(String deprostatus) {
		List<De_product_divVo> de_product_div = de_product_divDao.getDe_product_div(deprostatus);
		for (De_product_divVo de_product_divVo : de_product_div) {
			if(de_product_divVo.getEstablishcode()==null)
				continue;
			de_product_divVo.setEstablishName(establishDao.selectEstablish(de_product_divVo.getEstablishcode()).getEstablishNameKor());
		}
		return de_product_div;
	}

}
