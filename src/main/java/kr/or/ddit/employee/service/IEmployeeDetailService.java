package kr.or.ddit.employee.service;

import java.util.List;

import kr.or.ddit.employee.model.EmployeeVo;
import kr.or.ddit.employee.model.Employee_detailVo;

public interface IEmployeeDetailService {
	
	//�����ü ��������
	List<Employee_detailVo> getAllEmployeeDetail();
	
	//��� �����Ͽ� ��������
	Employee_detailVo selectEmployeeDetail(String user);

	//��� ���
	int insertEmployeeDetail(Employee_detailVo vo);
	
	
	//��� ����
	int deleteEmployeeDetail(String userId);
	
	int updateEmployeeDetail(Employee_detailVo vo);
	
	int selectEmployee_detailCnt(String userid);
}