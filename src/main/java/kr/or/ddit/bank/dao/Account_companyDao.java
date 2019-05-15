package kr.or.ddit.bank.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.bank.model.Account_companyVo;

@Repository("account_companyDao")
public class Account_companyDao implements IAccount_companyDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<Account_companyVo> getAllAccount_company() {
		return sqlSessionTemplate.selectList("account_company.getAllAccount_company");
	}

	@Override
	public Account_companyVo getAccount_company(Map<String, String> map) {
		return sqlSessionTemplate.selectOne("account_company.getAccount_company",map);
	}

	@Override
	public int insertAccount_company(Map<String, String> map) {
		return sqlSessionTemplate.insert("account_company.insertAccount_company", map);
	}

	@Override
	public int deleteAccount_company(Map<String, String> map) {
		return sqlSessionTemplate.delete("account_company.deleteAccount_company", map);
	}
	
	
}
