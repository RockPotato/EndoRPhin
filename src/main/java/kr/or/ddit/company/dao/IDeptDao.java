package kr.or.ddit.company.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.company.model.CardsVo;
import kr.or.ddit.company.model.DeptVo;

@Repository("deptDao")
public interface IDeptDao {
	
	int insertDept(DeptVo deptVo);
	
	int deleteDept(String deptcode);
	
	List<DeptVo> getAllDept();
	
	DeptVo selectDept(String deptcode);
	
	int updateDept(DeptVo deptVo);
	
	List<DeptVo> serachDept_Both(String deptCode, String deptName);
	
	List<DeptVo> serachDept_code(String deptCode);
	
	List<DeptVo> serachDept_name(String deptName);
	
	int upateStatusDept(DeptVo deptVo);
	
	
}
