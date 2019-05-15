package kr.or.ddit.employee.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.employee.model.EmployeeVo;
import kr.or.ddit.util.model.PageVo;

@Repository("employeeDao")
public class EmployeeDao implements IEmployeeDao{

	@Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public EmployeeVo selectEmployee(String user) {
		return sqlSessionTemplate.selectOne("employee.selectEmployee", user);
	}

	@Override
	public int insertEmployee(EmployeeVo vo) {
		return sqlSessionTemplate.insert("employee.insertEmployee", vo);
	}

	@Override
	public int deleteEmployee(String userId) {
		return sqlSessionTemplate.delete("employee.deleteEmployee", userId);
	}
	


	@Override
	public List<EmployeeVo> getAllEmployee() {
		List<EmployeeVo> selectList = sqlSessionTemplate.selectList("employee.getAllEmployee");
		return selectList;
	}

	@Override
	public int updateEmployee(EmployeeVo employeeVo) {
		return sqlSessionTemplate.update("employee.updateEmployee",employeeVo);
		
	}

	@Override
	public List<EmployeeVo> SearchEmployee(EmployeeVo userNm) {
		return sqlSessionTemplate.selectList("employee.SearchEmployee",userNm);
	}

	@Override
	public List<EmployeeVo> selectUserByNm(String usernm) {
		return sqlSessionTemplate.selectList("employee.selectUserByNm", usernm);
	}

	@Override
	public List<EmployeeVo> selectMoreEmployee(String positionCode) {
		return sqlSessionTemplate.selectList("employee.selectMoreEmployee",positionCode);
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
		return sqlSessionTemplate.selectOne("employee.findInfoOne",employeeVo);
	}
	@Override
	public List<EmployeeVo> selectDeptCode() {
		return sqlSessionTemplate.selectList("employee.selectDeptCode");
	}

	@Override
	public List<EmployeeVo> selectDeptDistribution() {
		return sqlSessionTemplate.selectList("employee.selectDeptDistribution");
	}

	@Override
	public List<EmployeeVo> searchEmpolyee(EmployeeVo employeeVo) {
		return sqlSessionTemplate.selectList("employee.searchEmpolyee",employeeVo);
	}
	
	@Override
	public List<EmployeeVo> searchDistribution(EmployeeVo employeeVo) {
		return sqlSessionTemplate.selectList("employee.searchDistribution",employeeVo);
	}
	/**
	 * 
	* Method : update_userPwd
	* 작성자 : macbook
	* 변경이력 :
	* @param employeeVo
	* @return
	* Method 설명 : 사원 정보 수정(비밀번호)
	 */
	@Override
	public int update_userPwd(EmployeeVo employeeVo) {
		return sqlSessionTemplate.update("employee.update_userPwd",employeeVo);
	}

	@Override
	public List<EmployeeVo> emplPagingList(PageVo pagevo) {
		return sqlSessionTemplate.selectList("employee.emplPagingList",pagevo);
	}

	@Override
	public int emplCnt() {
		return sqlSessionTemplate.selectOne("employee.emplCnt");
	}

}
