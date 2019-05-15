package kr.or.ddit.employee.service;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartRequest;

import kr.or.ddit.employee.model.EmployeeVo;
import kr.or.ddit.employee.model.Employee_detailVo;
import kr.or.ddit.image.service.IImagesService;
import kr.or.ddit.set.LogicConfig;

public class EmployeeServiceTest extends LogicConfig{
	private Logger logger = LoggerFactory.getLogger(EmployeeServiceTest.class);

	@Resource(name="employeeService")
	IEmployeeService employeeService;
	
	@Resource(name = "employeeDetailService")
	private IEmployeeDetailService employeeDetailService;
	
	@Resource(name="imagesService")
	private IImagesService imagesService;
	
	@Test
	public void selectEmployeeTest() {
		EmployeeVo selectEmployee = employeeService.selectEmployee("1022");
		System.out.println("선택사원 :" + selectEmployee);
		
	}
	@Test
	public void insertEmployeeTest() {
		EmployeeVo employeeVo = new EmployeeVo();
		employeeVo.setUserId("1452");
		employeeVo.setUserNm("칸타타");
		employeeVo.setDeptCode("100");
		employeeVo.setPositionCode("30");
		employeeVo.setRankCode("1");
		employeeVo.setBirthDate("20180101");
		int insertEmployee = employeeService.insertEmployee(employeeVo);
		
		assertEquals(1, insertEmployee);
	
	
	}
	@Test
	public void deleteEmployeeTest() {
		int deleteEmployee = employeeService.deleteEmployee("5");
		assertEquals(1, deleteEmployee);
	}
	@Test
	public void getAllEmployeeTest() {
		List<EmployeeVo> allEmployee = employeeService.getAllEmployee();
		logger.debug("보리차 : {}",allEmployee);
		assertTrue(allEmployee.size()>0);
	}
	
	@Test
	public void selectUserByNmtest() {
		List<EmployeeVo> selectUserByNm = employeeService.selectUserByNm("호");
		assertNotNull(selectUserByNm);
	}	
	
	@Test
	public void getAllEmployeeDetailTest() {
		EmployeeVo employeeVo = new EmployeeVo();
		employeeVo.setUserId("756");
		employeeVo.setUserNm("부서");
		/*employeeVo.setDeptCode("100");
		employeeVo.setPositionCode("1");
		employeeVo.setRankCode("1");*/
		employeeVo.setBirthDate("20180101");
		
		int insertEmployee = employeeService.insertEmployee(employeeVo);
		
		/*Employee_detailVo detailVo = new Employee_detailVo();
		detailVo.setUserId("75");
		detailVo.setImg_name("1");
		detailVo.setImg_path("1");
		int insertEmployeeDetail = employeeDetailService.insertEmployeeDetail(detailVo);
		assertNotNull(insertEmployeeDetail);*/
		
	}
	
	/*@Test
	public void getAllEmployeeDetailImage() {
		Employee_detailVo selectEmployeeDetail = employeeDetailService.selectEmployeeDetail("1005");
		logger.debug("이미지 : {}", selectEmployeeDetail.getImg_path());
	}*/
	
	
	@Test
	public void getAllEmployeeDateTest() {
		 EmployeeVo selectEmployee = employeeService.selectEmployee("60");
		logger.debug("이미지 : {}", selectEmployee.getBirthDate());
	}
	
	
	@Test
	public void UpdateEmployeeTest() {
		EmployeeVo employeeVo = new EmployeeVo();
		employeeVo.setUserId("3");
		employeeVo.setUserNm("윤상호");
		employeeVo.setDeptCode("100");
		employeeVo.setPositionCode("30");
		employeeVo.setRankCode("5");
		//employeeVo.setContinuousYear("2");
		//employeeVo.setJoinCompany("20181111");
		employeeVo.setBirthDate("2018-11-15");
		
		
		employeeService.updateEmployee(employeeVo);
		
	}
	
	
	@Test
	public void searchEmployeeTest() {
		EmployeeVo vo = new EmployeeVo();
		//vo.setUserNm("임");
		vo.setDeptCode("");
		
		List<EmployeeVo> allEmployee = employeeService.SearchEmployee(vo);
		
		System.out.println(allEmployee);
	}
	
	@Test
	public void selectEmployee_detailTest() {
		
		Employee_detailVo selectEmployeeDetail = employeeDetailService.selectEmployeeDetail("1022");
		
		System.out.println("과자 :" + selectEmployeeDetail);
		
	}
	@Test
	public void updateEmplDetailTest() {
		Employee_detailVo detailVo = new Employee_detailVo();
		
		
		detailVo.setUserId("1002");
		detailVo.setAddress("서울");	
		detailVo.setFinalSchool("고려대");
		detailVo.setEmail("1234@naver.com");
		detailVo.setPhoneNumber("01012341234");
		detailVo.setMarryStatus("1");
		detailVo.setImagecode("5");
		
		int updateEmployeeDetail = employeeDetailService.updateEmployeeDetail(detailVo);

	}
	
	@Test
	public void selectMoreEmpolyee(){
		List<EmployeeVo> list = employeeService.selectMoreEmployee("30");
		assertNotNull(list);
		System.out.println("list----------"+list);
	}	
	
	
	@Test
	public void findId(){
		EmployeeVo employeeVo = new EmployeeVo();
		employeeVo.setUserNm("강현욱");
		employeeVo.setBirthDate("890613");

//		employeeVo.setUserId("P100");
//		employeeVo.setEmail("g");
		EmployeeVo findInfoOne = employeeService.findInfoOne(employeeVo);
		System.out.println("123123123"+findInfoOne);
		
		assertEquals("gusdnr1348@gmail.com", findInfoOne.getEmail());
		
	}
	
	@Test
	public void updatepwd(){
		EmployeeVo vo = new EmployeeVo();
		vo.setUserId("P100");
		vo.setPassword("2");
		int update_userPwd = employeeService.update_userPwd(vo);
		
		assertEquals(1, update_userPwd);
	}
	

}
