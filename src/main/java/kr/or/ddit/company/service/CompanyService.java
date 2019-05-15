package kr.or.ddit.company.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.company.dao.ICompanyDao;
import kr.or.ddit.company.model.CompanyVo;
import kr.or.ddit.company.model.DeptVo;

@Service("companyService")
public class CompanyService implements ICompanyService{

	@Resource(name="companyDao")
	private ICompanyDao companyDao;
	
	public CompanyService() {
	
	}
	@Override
	public List<CompanyVo> getAllcompany() {
		return companyDao.getAllcompany();
	}

	@Override
	public CompanyVo selectCompany(String companycode) {
		return companyDao.selectCompany(companycode);
	}

	@Override
	public int insertCompany(CompanyVo companyVo) {
		return companyDao.insertCompany(companyVo);
	}

	@Override
	public int deleteCompany(String companycode) {
		return companyDao.deleteCompany(companycode);
	}
	@Override
	public List<CompanyVo> serachCompany(String companyName) {
		return companyDao.serachCompany(companyName);
	}

}
