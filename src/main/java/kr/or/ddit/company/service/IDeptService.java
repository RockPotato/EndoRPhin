package kr.or.ddit.company.service;

import java.util.List;

import kr.or.ddit.company.model.DeptVo;

public interface IDeptService {

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
