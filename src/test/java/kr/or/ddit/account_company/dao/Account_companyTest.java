package kr.or.ddit.account_company.dao;

import static org.junit.Assert.assertEquals;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.bank.dao.IAccount_companyDao;
import kr.or.ddit.bank.model.Account_companyVo;
import kr.or.ddit.set.LogicConfig;


public class Account_companyTest extends LogicConfig {

	@Resource(name="account_companyDao")
	private IAccount_companyDao account_companyDao;
	
	//사내계좌 전체 불러오기 
	@Test
	public void testgetAllAccount_company() {
		
		List<Account_companyVo> accountList = account_companyDao.getAllAccount_company();
		
		assertEquals(1, accountList.size());
		
	}
	@Test
	public void testgetAccount_company(){
	
	}
}
