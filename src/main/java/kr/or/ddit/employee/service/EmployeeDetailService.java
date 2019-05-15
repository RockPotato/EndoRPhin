package kr.or.ddit.employee.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.employee.dao.IEmployeeDao;
import kr.or.ddit.employee.dao.IEmployee_DetailDao;
import kr.or.ddit.employee.model.EmployeeVo;
import kr.or.ddit.employee.model.Employee_detailVo;


@Service("employeeDetailService")
public class EmployeeDetailService implements IEmployeeDetailService{
	
	@Resource(name="employeeDetailDao")
	private IEmployee_DetailDao employeeDetailDao;

	@Override
	public List<Employee_detailVo> getAllEmployeeDetail() {
		return employeeDetailDao.getAllEmployeeDetail();
		
	}

	@Override
	public Employee_detailVo selectEmployeeDetail(String user) {
		return employeeDetailDao.selectEmployeeDetail(user);
	}

	@Override
	public int insertEmployeeDetail(Employee_detailVo vo) {
		return employeeDetailDao.insertEmployeeDetail(vo);
	}

	@Override
	public int deleteEmployeeDetail(String userId) {
		return employeeDetailDao.deleteEmployeeDetail(userId);
	}

	@Override
	public int updateEmployeeDetail(Employee_detailVo vo) {
		
		return employeeDetailDao.updateEmployeeDetail(vo);
	}

	@Override
	public int selectEmployee_detailCnt(String userid) {
		return employeeDetailDao.selectEmployee_detailCnt(userid);
	}
	
}