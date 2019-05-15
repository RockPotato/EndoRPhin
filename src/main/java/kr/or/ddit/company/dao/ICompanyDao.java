package kr.or.ddit.company.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.company.model.CompanyVo;
import kr.or.ddit.company.model.DeptVo;

@Repository("companyDao")
public interface ICompanyDao {
	
	List<CompanyVo> getAllcompany();
	
	CompanyVo selectCompany(String companycode);
	
	int insertCompany(CompanyVo companyVo);

	int deleteCompany(String companycode);
	
	List<CompanyVo> serachCompany(String companyName);
}
