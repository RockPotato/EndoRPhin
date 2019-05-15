package kr.or.ddit.employee.dao;

import java.util.List;

import kr.or.ddit.employee.model.EmployeeVo;
import kr.or.ddit.employee.model.Employee_detailVo;

public interface IEmployee_DetailDao {
	public Employee_detailVo selectEmployeeDetail(String userId);
	int insertEmployeeDetail(Employee_detailVo employeeVo);
	int deleteEmployeeDetail(String userId);
	List<Employee_detailVo> getAllEmployeeDetail();
	int selectEmployee_detailCnt(String userid);
	int updateEmployeeDetail(Employee_detailVo vo);

}
