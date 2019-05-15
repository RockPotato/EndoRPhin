package kr.or.ddit.company.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.company.model.DeptVo;
import kr.or.ddit.set.LogicConfig;

public class DeptServiceTest extends LogicConfig{

	@Resource(name="deptService")
	IDeptService deptService;
	
	@Test
	public void getAllDeptTest() {
		List<DeptVo> allDept = deptService.getAllDept();
		
		assertTrue(allDept.size()>0);
	}
	
	@Test
	public void selectDeptTest() {
		DeptVo selectDept = deptService.selectDept("1");
		assertEquals("총무부", selectDept.getDeptName());
	}
	@Test
	public void insertDeptTest() {
		DeptVo vo = new DeptVo();
		vo.setDeptCode("311");
		vo.setDeptName("전산팀");
		vo.setUseStatus("1");
		vo.setCompanyCode("1");
		int insertDept = deptService.insertDept(vo);
		assertEquals(1,insertDept);
		assertNotNull(insertDept);
	}
	@Test
	public void updDeptTest() {
		DeptVo vo = new DeptVo();
		vo.setDeptCode("2");
		vo.setDeptName("전산팀");
		vo.setCompanyCode("1");
		int updDept = deptService.updateDept(vo);
		assertEquals(1,updDept);
		assertNotNull(updDept);
	}
	
	@Test
	public void useDeptTest() {
		DeptVo vo = new DeptVo();
		vo.setDeptCode("6");
		vo.setUseStatus("0");
		int updDept = deptService.upateStatusDept(vo);
		assertEquals(1,updDept);
		assertNotNull(updDept);
	}
	@Test
	public void deleteDeptTest(){
		int deleteDept = deptService.deleteDept("3");
		assertEquals(1, deleteDept);
	}

}
