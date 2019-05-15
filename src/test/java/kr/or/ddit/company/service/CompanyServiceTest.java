package kr.or.ddit.company.service;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.company.model.CompanyVo;
import kr.or.ddit.set.LogicConfig;

public class CompanyServiceTest extends LogicConfig{

	@Resource(name="companyService")
	ICompanyService companyService;
	
	@Test
	public void getAllcompanyTest() {
		List<CompanyVo> allcompany = companyService.getAllcompany();
		assertTrue(allcompany.size()>0);
	}
	@Test
	public void selectCompanyTest() {
		CompanyVo selectCompany = companyService.selectCompany("1");
		assertEquals("준호물산", selectCompany.getCompanyName());
	}
	@Test
	public void insertCompanyTest() {
		CompanyVo vo = new CompanyVo();
		vo.setCompanyName("재우물산");
		vo.setCeoNumber("01012341234");
		vo.setCompanyCode("2");
		int insertCompany = companyService.insertCompany(vo);
		assertTrue(insertCompany==1);
	}
	@Test
	public void deleteCompanyTest() {
		int deleteCompany = companyService.deleteCompany("2");
		assertEquals(1, deleteCompany);
	}

}
