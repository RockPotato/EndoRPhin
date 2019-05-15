package kr.or.ddit.company.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.company.model.CompanyVo;
import kr.or.ddit.company.model.DeptVo;
import kr.or.ddit.set.LogicConfig;

public class DeptDaoTest extends LogicConfig{

	@Resource(name="deptDao")
	IDeptDao deptDao;
	
	@Test
	public void getAllDeptTest() {
		List<DeptVo> allDept = deptDao.getAllDept();
		assertTrue(allDept.size()>0);
	}
	
	@Test
	public void selectDeptTest() {
		DeptVo selectDept = deptDao.selectDept("1");
		assertEquals("총무부", selectDept.getDeptName());
	}
	@Test
	public void insertDeptTest() {
		DeptVo vo = new DeptVo();
		vo.setDeptCode("300");
		vo.setDeptName("전산팀");
		vo.setUseStatus("1");
		vo.setCompanyCode("1");
		int insertDept = deptDao.insertDept(vo);
		assertEquals(1,insertDept);
	}
	@Test
	public void deleteDeptTest(){
		int deleteDept = deptDao.deleteDept("3");
		assertEquals(1, deleteDept);
	}

}
