package kr.or.ddit.annual.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.annual.dao.IAnnualDao;
import kr.or.ddit.annual.model.AnnualVo;
@Service("annualService")
public class AnnualService implements IAnnualService{
	
	@Resource(name="annualDao")
	private IAnnualDao annualDao;

	@Override
	public List<AnnualVo> getAllAnnual() {
		return annualDao.getAllAnnual();
	}

	@Override
	public int insertAnnual(AnnualVo vo) {
		return annualDao.insertAnnual(vo);
	}

	@Override
	public int deleteAnnual(AnnualVo code) {
		return annualDao.deleteAnnual(code);
	}

	@Override
	public int updateAnnual(AnnualVo Vo) {
		return annualDao.updateAnnual(Vo);
	}

	@Override
	public List<AnnualVo> SearchAnnual(AnnualVo code) {
		return annualDao.SearchAnnual(code);
	}

	@Override
	public AnnualVo selectAllAnnual(AnnualVo code) {
		return annualDao.selectAllAnnual(code);
	}

	
	@Override
	public AnnualVo selectAnnual(String code) {
		return annualDao.selectAnnual(code);
	}


	
}
