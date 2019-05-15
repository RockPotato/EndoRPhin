package kr.or.ddit.company.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.company.model.CompanyVo;
import kr.or.ddit.set.LogicConfig;

public class CompanyDaoTest extends LogicConfig{

	@Resource(name="companyDao")
	ICompanyDao companyDao;
	
	@Test
	public void getAllcompanyTest() {
		List<CompanyVo> allcompany = companyDao.getAllcompany();
		assertEquals(3, allcompany.size());
	}
	
	@Test
	public void selectCompanyTest() {
		String companyCode = "1";
		CompanyVo selectCompany = companyDao.selectCompany(companyCode);
		assertEquals("준호물산", selectCompany.getCompanyName());
	}
	@Test
	public void insertCompanyTest() {
		CompanyVo vo = new CompanyVo();
		vo.setCeo("재우물산");
		vo.setCeoNumber("01012341234");
		vo.setCompanyCode("4");
		int insertCompany = companyDao.insertCompany(vo);
		assertEquals(1,insertCompany);
	}

}
