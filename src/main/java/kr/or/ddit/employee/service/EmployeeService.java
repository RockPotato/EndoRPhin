package kr.or.ddit.employee.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.employee.dao.IEmployeeDao;
import kr.or.ddit.employee.model.EmployeeVo;
import kr.or.ddit.util.model.PageVo;


@Service("employeeService")
public class EmployeeService implements IEmployeeService{
	
	@Resource(name="employeeDao")
	private IEmployeeDao employeeDao;

	@Override
	public List<EmployeeVo> getAllEmployee() {
		List<EmployeeVo> allEmployee = employeeDao.getAllEmployee();
		return allEmployee;
		
	}

	@Override
	public EmployeeVo selectEmployee(String user) {
		return employeeDao.selectEmployee(user);
	}

	@Override
	public int insertEmployee(EmployeeVo vo) {
		return employeeDao.insertEmployee(vo);
	}

	@Override
	public int deleteEmployee(String userId) {
		return employeeDao.deleteEmployee(userId);
	}

	@Override
	public int updateEmployee(EmployeeVo vo) {
		return employeeDao.updateEmployee(vo);
	}

	@Override
	public List<EmployeeVo> SearchEmployee(EmployeeVo userNm) {
		return employeeDao.SearchEmployee(userNm);
		
	}

	@Override
	public List<EmployeeVo> selectUserByNm(String usernm) {
		return employeeDao.selectUserByNm(usernm);
	}

	@Override
	public List<EmployeeVo> selectMoreEmployee(String positionCode) {
		return employeeDao.selectMoreEmployee(positionCode);
	}

	/**
	 * 
	* Method : findInfoOne
	* 작성자 : macbook
	* 변경이력 :
	* @param employeeVo
	* @return
	* Method 설명 : 특정 사원 정보 가져오기 (userId, userNm, email, birthdate)
	 */
	@Override
	public EmployeeVo findInfoOne(EmployeeVo employeeVo) {
		return employeeDao.findInfoOne(employeeVo);
	}
	
	
	@Override
	public List<EmployeeVo> selectDeptCode() {
		return employeeDao.selectDeptCode();
	}

	@Override
	public List<EmployeeVo> selectDeptDistribution() {
		return employeeDao.selectDeptDistribution();
	}

	@Override
	public List<EmployeeVo> searchEmpolyee(EmployeeVo employeeVo) {
		return employeeDao.searchEmpolyee(employeeVo);
	}

	@Override
	public List<EmployeeVo> searchDistribution(EmployeeVo employeeVo) {
		return employeeDao.searchDistribution(employeeVo);
	}
	/**
	* Method : update_userPwd
	* 작성자 : macbook
	* 변경이력 :
	* @param employeeVo
	* @return
	* Method 설명 : 사원 정보 수정 (비밀번호)
	 */
	@Override
	public int update_userPwd(EmployeeVo employeeVo) {
		return employeeDao.update_userPwd(employeeVo);
	}

	@Override
	public Map<String, Object> emplPagingList(PageVo pagevo) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("allEmployee", employeeDao.emplPagingList(pagevo));
		resultMap.put("emplCnt", employeeDao.emplCnt());

		return resultMap;
	}
	
	
	
}