package kr.or.ddit.employee.dao;

import java.util.List;

import kr.or.ddit.employee.model.EmployeeVo;
import kr.or.ddit.util.model.PageVo;

public interface IEmployeeDao {
	/**
	* Method : selectEmployee
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param userId
	* @return
	* Method 설명 : 사원 선택하여 가져오기
	*/
	public EmployeeVo selectEmployee(String userId);
	List<EmployeeVo> emplPagingList(PageVo pagevo);
	int emplCnt();
	
	/**
	* Method : selectUserByNm
	* 작성자 : PC04
	* 변경이력 :
	* @param usernm
	* @return
	* Method 설명 : 사원이름으로 검색
	*/
	public List<EmployeeVo> selectUserByNm(String usernm);
	/**
	* Method : insertEmployee
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param employeeVo
	* @return
	* Method 설명 : 사원 신규등록
	*/
	int insertEmployee(EmployeeVo employeeVo);
	/**
	* Method : deleteEmployee
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param userId
	* @return
	* Method 설명 : 사원 삭제
	*/
	int deleteEmployee(String userId);
	/**
	* Method : getAllEmployee
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @return
	* Method 설명 : 사원 전체불러오기
	*/
	List<EmployeeVo> getAllEmployee();
	/**
	* Method : updateEmployee
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param employeeVo
	* @return
	* Method 설명 : 사원 업데이트
	*/
	int updateEmployee(EmployeeVo employeeVo);
	
	/**
	* Method : SearchEmployee
	* 작성자 : leemjaewoo
	* 변경이력 :
	* @param userId
	* @return
	* Method 설명 : 사원 검색
	*/
	public List<EmployeeVo> SearchEmployee(EmployeeVo userNm);
	
	/**
	* Method : selectMoreEmployee
	* 작성자 : pc05
	* 변경이력 :
	* @param userId
	* @return
	* Method 설명 : 입력받은 직책보다 높은 직책 출력
	*/
	public List<EmployeeVo> selectMoreEmployee(String positionCode);
	
	/**
	 * 
	* Method : findInfoOne
	* 작성자 : macbook
	* 변경이력 :
	* @param employeeVo
	* @return
	* Method 설명 : 특정 사원 정보 가져오기 (userId, userNm, email, birthdate)
	 */
	public EmployeeVo findInfoOne(EmployeeVo employeeVo);
	
	public List<EmployeeVo> selectDeptCode();
	
	
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
	* Method 설명 : 사원 정보 수정 (비밀번호)
	 */
	public int update_userPwd(EmployeeVo employeeVo);
}
