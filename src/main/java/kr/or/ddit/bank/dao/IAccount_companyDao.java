package kr.or.ddit.bank.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.or.ddit.bank.model.Account_companyVo;

@Repository("account_companyDao")
public interface IAccount_companyDao {
	
	List<Account_companyVo> getAllAccount_company();
	
	Account_companyVo getAccount_company(Map<String, String> map);

	int insertAccount_company(Map<String, String> map);
	
	int deleteAccount_company(Map<String, String> map);
	
	
}
