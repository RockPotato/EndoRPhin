package kr.or.ddit.annual.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.annual.model.AnnualVo;

@Repository("annualDao")
public class AnnualDao implements IAnnualDao{
	
	@Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<AnnualVo> getAllAnnual() {
		return sqlSessionTemplate.selectList("annual.getAllAnnual");
	}

	@Override
	public int insertAnnual(AnnualVo vo) {
		return sqlSessionTemplate.insert("annual.insertAnnual",vo);
	}

	@Override
	public int deleteAnnual(AnnualVo code) {
		return sqlSessionTemplate.delete("annual.deleteAnnual",code);
	}
	
	@Override
	public int updateAnnual(AnnualVo Vo) {
		return sqlSessionTemplate.update("annual.updateAnnual",Vo);
	}

	@Override
	public List<AnnualVo> SearchAnnual(AnnualVo code) {
		return sqlSessionTemplate.selectList("annual.SearchAnnual",code);
	}

	@Override
	public AnnualVo selectAllAnnual(AnnualVo code) {
		return sqlSessionTemplate.selectOne("annual.selectAllAnnual",code);
	}

	
	@Override
	public AnnualVo selectAnnual(String code) {
		return sqlSessionTemplate.selectOne("annual.selectAnnual",code);
	}

}
