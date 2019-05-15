package kr.or.ddit.company.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.company.dao.IDeptDao;
import kr.or.ddit.company.model.DeptVo;

@Service("deptService")
public class DeptService implements IDeptService{

	@Resource(name="deptDao")
	private IDeptDao deptDao;
	
	public DeptService(){
		
	}
	@Override
	public List<DeptVo> getAllDept() {
		return deptDao.getAllDept();
	}
	@Override
	public int insertDept(DeptVo deptVo) {
		return deptDao.insertDept(deptVo);
	}
	@Override
	public int deleteDept(String deptcode) {
		return deptDao.deleteDept(deptcode);
	}

	@Override
	public DeptVo selectDept(String deptcode) {
		return deptDao.selectDept(deptcode);
	}
	@Override
	public int updateDept(DeptVo deptVo) {
		return deptDao.updateDept(deptVo);
	}
	@Override
	public List<DeptVo> serachDept_Both(String deptCode, String deptName) {
		return deptDao.serachDept_Both(deptCode, deptName);
	}
	@Override
	public List<DeptVo> serachDept_code(String deptCode) {
		return deptDao.serachDept_code(deptCode);
	}
	@Override
	public List<DeptVo> serachDept_name(String deptName) {
		return deptDao.serachDept_name(deptName);
	}
	@Override
	public int upateStatusDept(DeptVo deptVo) {
		return deptDao.upateStatusDept(deptVo);
	}
	
}
