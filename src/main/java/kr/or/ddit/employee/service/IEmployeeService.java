package kr.or.ddit.employee.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.employee.model.EmployeeVo;
import kr.or.ddit.util.model.PageVo;

public interface IEmployeeService {
	
	/**
	* Method : getAllEmployee
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @return
	* Method 설명 :
	*/
	List<EmployeeVo> getAllEmployee();
	Map<String, Object> emplPagingList(PageVo pagevo);
	
	
	/**
	* Method : selectEmployee
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param user
	* @return
	* Method 설명 :
	*/
	EmployeeVo selectEmployee(String user);
	
	/**
	* Method : selectUserByNm
	* 작성자 : PC04
	* 변경이력 :
	* @param usernm
	* @return
	* Method 설명 : 사원이름으로 검색
	*/
	List<EmployeeVo> selectUserByNm(String usernm);

	
	
	/**
	* Method : insertEmployee
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param vo
	* @return
	* Method 설명 :
	*/
	int insertEmployee(EmployeeVo vo);
	
	
	
	/**
	* Method : updateEmployee
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param vo
	* @return
	* Method 설명 :
	*/
	int updateEmployee(EmployeeVo vo);
	
	
	
	/**
	* Method : deleteEmployee
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param userId
	* @return
	* Method 설명 :
	*/
	int deleteEmployee(String userId);
	
	
	
	/**
	* Method : selectEmployee
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param user
	* @return
	* Method 설명 : 사원 검색
	*/
	List<EmployeeVo> SearchEmployee(EmployeeVo userNm);
	
	/**
	* Method : selectMoreEmployee
	* 작성자 : pc05
	* 변경이력 :
	* @param userId
	* @return
	* Method 설명 : 모든 직책 출력
	*/
	List<EmployeeVo>  selectMoreEmployee(String positionCode);

	/**
	* Method : selectDeptCode
	* 작성자 : PC05
	* 변경이력 :
	* @return 
	* Method 설명 : 인사만 출력
	*/
	public List<EmployeeVo> selectDeptCode();
	
	/**
	 * 
	* Method : findInfoOne
	* 작성자 : macbook
	* 변경이력 :
	* @param employeeVo
	* @return
	* Method 설명 : 특정 사원 정보 가져오기 (userId, userNm, email, birthdate)
	 */
	EmployeeVo findInfoOne(EmployeeVo employeeVo);
	
	
	/**
	* Method : selectDeptDistribution
	* 작성자 : PC05
	* 변경이력 :
	* @return
	* Method 설명 : 물류만 출력
	*/
	public List<EmployeeVo> selectDeptDistribution();
	
	public List<EmployeeVo>  searchEmpolyee(EmployeeVo employeeVo);
	
	public List<EmployeeVo>  searchDistribution(EmployeeVo employeeVo);
	/**
	 * 
	* Method : update_userPwd
	* 작성자 : macbook
	* 변경이력 :
	* @param employeeVo
	* @return
	* Method 설명 : 사원 정보 수정(비밀번호)
	 */
	public int update_userPwd(EmployeeVo employeeVo);
}