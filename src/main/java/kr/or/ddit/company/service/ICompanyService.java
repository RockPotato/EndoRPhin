package kr.or.ddit.company.service;

import java.util.List;

import kr.or.ddit.company.model.CompanyVo;
import kr.or.ddit.company.model.DeptVo;

public interface ICompanyService {
	
	List<CompanyVo> getAllcompany();
	
	CompanyVo selectCompany(String companycode);
	
	int insertCompany(CompanyVo companyVo);
	
	int deleteCompany(String companycode);
	
	List<CompanyVo> serachCompany(String companyName);
}
