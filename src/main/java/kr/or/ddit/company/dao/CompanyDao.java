package kr.or.ddit.company.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.company.model.CompanyVo;
import kr.or.ddit.company.model.DeptVo;

@Repository("companyDao")
public class CompanyDao implements ICompanyDao{
	
	@Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<CompanyVo> getAllcompany() {
		List<CompanyVo> selectList = sqlSessionTemplate.selectList("company.getAllcompany");
		return selectList;
	}

	@Override
	public CompanyVo selectCompany(String companycode) {
		CompanyVo selectOne = sqlSessionTemplate.selectOne("company.selectCompany",companycode);
		return selectOne;
	}

	@Override
	public int insertCompany(CompanyVo companyVo) {
		int insert = sqlSessionTemplate.insert("company.insertCompany",companyVo);
		return insert;
	}

	@Override
	public int deleteCompany(String companycode) {
		int delete = sqlSessionTemplate.delete("company.deleteCompany",companycode);
		return delete;
	}
	
	@Override
	public List<CompanyVo> serachCompany(String companyName) {
		return sqlSessionTemplate.selectList("company.serachCompany", companyName);
	}


}
