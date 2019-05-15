package kr.or.ddit.employee.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.employee.model.EmployeeVo;
import kr.or.ddit.employee.model.Employee_detailVo;

@Repository("employeeDetailDao")
public class EmployeeDetailDao implements IEmployee_DetailDao{

	@Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public Employee_detailVo selectEmployeeDetail(String user) {
		return sqlSessionTemplate.selectOne("employee_detail.selectEmployee_detail", user);
	}

	@Override
	public int insertEmployeeDetail(Employee_detailVo vo) {
		return sqlSessionTemplate.insert("employee_detail.insertEmployee_detail", vo);
	}

	@Override
	public int deleteEmployeeDetail(String userId) {
		return sqlSessionTemplate.delete("employee_detail.deleteEmployee_detail", userId);
	}
	


	@Override
	public List<Employee_detailVo> getAllEmployeeDetail() {
		List<Employee_detailVo> selectList = sqlSessionTemplate.selectList("employee_detail.getAllEmployee_detail");
		return selectList;
	}

	@Override
	public int updateEmployeeDetail(Employee_detailVo vo) {
		return sqlSessionTemplate.update("employee_detail.updateEmployee_detail", vo);
	}

	@Override
	public int selectEmployee_detailCnt(String userid) {
		return sqlSessionTemplate.selectOne("employee_detail.selectEmployee_detailCnt", userid);
	}
}
