package kr.or.ddit.employee.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.company.model.DeptVo;
import kr.or.ddit.company.service.IDeptService;
import kr.or.ddit.employee.model.EmployeeVo;
import kr.or.ddit.employee.model.Employee_detailVo;
import kr.or.ddit.employee.model.PositionVo;
import kr.or.ddit.employee.service.IEmployeeDetailService;
import kr.or.ddit.employee.service.IEmployeeService;
import kr.or.ddit.employee.service.IPositionService;
import kr.or.ddit.image.model.ImagesVo;
import kr.or.ddit.image.service.IImagesService;
import kr.or.ddit.util.model.PageVo;

@RequestMapping("/employee")
@Controller
public class EmployeeController {
	private Logger logger = LoggerFactory.getLogger(EmployeeController.class);
	
	
	@Resource(name = "employeeService")
	private IEmployeeService employeeService;
	
	@Resource(name = "employeeDetailService")
	private IEmployeeDetailService employeeDetailService;
	
	@Resource(name="imagesService")
	private IImagesService imagesService;
	
	//   직급/직책
	@Resource(name = "positionService")
	private IPositionService positionService;
	
	//  부서정보
	@Resource(name="deptService")
	private IDeptService deptService;
	
	
	@RequestMapping(path = "/getAllEmployee", method = RequestMethod.GET)
	public String getAllEmployee(Model model) {
		
		
		List<EmployeeVo> allEmployee = employeeService.getAllEmployee();
		model.addAttribute("allEmployee",allEmployee);
		
		
		return "employeeListTiles";
	}
	
	
	@RequestMapping("/emplPagingList")
	public String emplPagingList(PageVo pageVo, Model model) {


		Map<String, Object> emplPagingList = employeeService.emplPagingList(pageVo);
		model.addAllAttributes(emplPagingList);
		
		model.addAttribute("pageSize", pageVo.getPageSize());
		model.addAttribute("page", pageVo.getPage());
		return "employeeListTiles";

	}
	
	
	
	
	@RequestMapping(path = "/insertEmployee", method = RequestMethod.GET)
	public String insertEmployee_GET(Model model) {
		
		return "insertEmployeeTiles";
	}
	
	@RequestMapping(path = "/insertEmployee", method = RequestMethod.POST)
	public String insertEmployee_POST(Model model, EmployeeVo vo,RedirectAttributes ra,
			MultipartRequest multparts, Employee_detailVo detailVo) throws IllegalStateException, IOException {
		
		
		employeeService.insertEmployee(vo);
		
		ImagesVo imageVo = new ImagesVo();
		imageVo.setUserId("P"+vo.getUserId());
		
		detailVo.setAddress(detailVo.getAddress() + detailVo.getAddressDetail());	
		
		
		String imageCode = imagesService.updateOrInsertImages(imageVo, multparts);
		detailVo.setUserId("P"+vo.getUserId());
		detailVo.setImagecode(imageCode);
		employeeDetailService.insertEmployeeDetail(detailVo);
		
		ra.addFlashAttribute("msg", "정상 등록 되었습니다");
		return "redirect:/employee/emplPagingList";
	}
	
	@RequestMapping(path = "/deleteEmployee", method = RequestMethod.GET)
	public String deleteEmployee(Model model, EmployeeVo vo,RedirectAttributes ra,
			@RequestParam String delete_no) {
		
		
		String[] index = delete_no.split(",");
		
		for (int i = 0; i < index.length; i++) {
			employeeService.deleteEmployee(index[i]);
			
		}
		
		ra.addFlashAttribute("msg", "정상 삭제 되었습니다");
		
		return "redirect:/employee/getAllEmployee";
	}
	
	@RequestMapping(path = "/detailEmployee", method = RequestMethod.GET)
	public String detailEmployee(Model model, EmployeeVo vo,RedirectAttributes ra,
			@RequestParam String userId) {
		
		EmployeeVo selectEmployee = employeeService.selectEmployee(userId);
		Employee_detailVo selectEmployeeDetail = employeeDetailService.selectEmployeeDetail(userId);
		
		model.addAttribute("userVo",selectEmployee);
		model.addAttribute("img",selectEmployeeDetail);
		
		return "employeeDetailTiles";
	}
	
	
	@RequestMapping(path = "/test", method = RequestMethod.GET)
	public String test(Model model) {
		
		
		return "testTiles";
	}
	
	
	@RequestMapping(path="/emplIdAjax", method=RequestMethod.POST)
	@ResponseBody
	public String emplIdAjax(@RequestParam(name="userId", defaultValue="WS")String userId) {
		
		
		List<EmployeeVo> allEmployee = employeeService.getAllEmployee();
		String userIdCode = "1";
		
		for(int i = 0; i < allEmployee.size(); i++) {
			// Duplicate Code = 0
			if(userId.equals(allEmployee.get(i).getUserId())){
				userIdCode = "0";
				return userIdCode;
				
			// WhiteSpace Code = WS
			} else if(userId.equals("WS")) {
				userIdCode = "WS";
				return userIdCode;
			}
		}
		
		return userIdCode;
		
		
	}
	       
	
	@RequestMapping("/profileImg")
	public void profileImg(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("userId") String userId) throws Exception {
		
		System.out.println("유저아이디 :" + userId);

		response.setHeader("content-Disposition", "attachment; filename=profile.png");
		response.setContentType("image.png");
		String Img_path = "";
		
		
		Employee_detailVo  vo = employeeDetailService.selectEmployeeDetail(userId);

		if (vo != null && vo.getImagename() != null) {
			
		 Img_path = vo.getImagerealpath() + vo.getImagerealname();
		}
		
		FileInputStream fis;
		if (vo != null && vo.getImagename() != null) {
			fis = new FileInputStream(new File(Img_path));
		} else {

			ServletContext application = request.getServletContext();
			String noimgPath = application.getRealPath("/upload/noimage.jpg");
			fis = new FileInputStream(new File(noimgPath));
		}

		ServletOutputStream sos = response.getOutputStream();

		byte[] buff = new byte[512];
		int len = 0;
		while ((len = fis.read(buff)) > -1) {
			sos.write(buff);
		}

		sos.close();
		fis.close();

	}
	
	@RequestMapping(path = "/updateEmployee", method = RequestMethod.GET)
	@ResponseBody
	public EmployeeVo updateEmployee_GET(String userId,RedirectAttributes ra) throws IllegalStateException, IOException {
		
		EmployeeVo selectEmpl = employeeService.selectEmployee(userId);
		return selectEmpl;
	}
	
	
	
	@RequestMapping(path = "/updateEmployee_POST", method = RequestMethod.POST)
	public String updateEmployee_POST(EmployeeVo vo,RedirectAttributes ra,MultipartRequest multparts) throws IllegalStateException, IOException {
		Employee_detailVo detailVo = new Employee_detailVo();
		
		
		
		ImagesVo imageVo = new ImagesVo();
		imageVo.setUserId(vo.getUserId());
		imageVo.setImageCode(vo.getImagecode());
		String imageCode = imagesService.updateOrInsertImages(imageVo, multparts);
		
		detailVo.setUserId(vo.getUserId());
		detailVo.setAddress(vo.getAddress() + ","  + vo.getAddressDetail());	
		detailVo.setFinalSchool(vo.getFinalschool());
		detailVo.setEmail(vo.getEmail());
		detailVo.setPhoneNumber(vo.getPhonenumber());
		detailVo.setMarryStatus(vo.getMarryStatus());
		if(imageCode!=null){
			detailVo.setImagecode(imageCode);
		}else{
			detailVo.setImagecode(vo.getImagecode());
		}
		
		int selectEmployee_detailCnt = employeeDetailService.selectEmployee_detailCnt(vo.getUserId());
		if(selectEmployee_detailCnt>0){
			employeeDetailService.updateEmployeeDetail(detailVo);
		}else{
			employeeDetailService.insertEmployeeDetail(detailVo);
		}
		employeeService.updateEmployee(vo);
		
		ra.addFlashAttribute("msg", "정상 수정 되었습니다");
		return "redirect:/employee/getAllEmployee";
	}
	
	
	
	@RequestMapping(path = "/SearchEmployee", method = RequestMethod.GET)
	public String SearchEmployee(Model model, String searchName, String deptselect) {
		
		EmployeeVo vo = new EmployeeVo();
		
		
		if(searchName != null){
		vo.setUserNm(searchName);
		}
		if(deptselect != null){
		vo.setDeptname(deptselect);
		}
		
		List<EmployeeVo> allEmployee = employeeService.SearchEmployee(vo);
		
		
		System.out.println("사이즈 :" + allEmployee.size());
		model.addAttribute("allEmployee",allEmployee);
		
		return "employeeListTiles";
	}

	
	@RequestMapping(path="/getAllEmployeeAjax", method=RequestMethod.GET)
	@ResponseBody
	public List<EmployeeVo> getAllEmployeeAjax() {
		
		List<EmployeeVo> allEmployee = employeeService.getAllEmployee();
		
		return allEmployee;
		
	}
	
	
	
	@RequestMapping(path = "/SearchEmployeeAjax", method = RequestMethod.GET)
	@ResponseBody
	public List<EmployeeVo> SearchEmployeeAjax(Model model, String searchName, String deptselect,String deptcodeselect) {
		EmployeeVo vo = new EmployeeVo();
		
		System.out.println(deptcodeselect);
		
		if(deptcodeselect.equals("999")){
			getAllEmployeeAjax();
		}else{
			vo.setDeptCode(deptcodeselect);
		}
		
		vo.setUserId(searchName);
		vo.setDeptname(deptselect);
		List<EmployeeVo> allEmployee = employeeService.SearchEmployee(vo);
		
		return allEmployee;
	}
	
	
	
	
	@RequestMapping(path="/getSelectBox", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getSelectBox(Model model) {
		List<PositionVo> allPosition = positionService.getAllPosition();
		List<DeptVo> allDept = deptService.getAllDept();
		
		Map<String, Object> selectMap = new HashMap<>();
		
		selectMap.put("allPosition", allPosition);
		selectMap.put("allDept", allDept);
		
		return selectMap;
		
	}
	
	
	@RequestMapping(path = "/emplEditView", method = RequestMethod.GET)
	public String emplEditView(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.getAttribute("employeeVo");
		
		return "emplEditViewTiles";
	}
	
	@RequestMapping(path = "/emplEditViewSave", method = RequestMethod.POST)
	public String emplEditViewSave(EmployeeVo vo, MultipartRequest multparts, HttpServletRequest request) throws IllegalStateException, IOException {
		Employee_detailVo detailVo = new Employee_detailVo();
		System.out.println(vo.getImagecode());
		ImagesVo imageVo = new ImagesVo();
		imageVo.setUserId(vo.getUserId());
		imageVo.setImageCode(vo.getImagecode());
		String imageCode = imagesService.updateOrInsertImages(imageVo, multparts);
		
		detailVo.setUserId(vo.getUserId());
		detailVo.setAddress(vo.getAddress() + ","  + vo.getAddressDetail());	
		detailVo.setFinalSchool(vo.getFinalschool());
		detailVo.setEmail(vo.getEmail());
		detailVo.setPhoneNumber(vo.getPhonenumber());
		detailVo.setMarryStatus(vo.getMarryStatus());
		if(imageCode!=null){
			detailVo.setImagecode(imageCode);
		}else{
			detailVo.setImagecode(vo.getImagecode());
		}
		
		int selectEmployee_detailCnt = employeeDetailService.selectEmployee_detailCnt(vo.getUserId());
		if(selectEmployee_detailCnt>0){
			employeeDetailService.updateEmployeeDetail(detailVo);
		}else{
			employeeDetailService.insertEmployeeDetail(detailVo);
		}
		employeeService.updateEmployee(vo);
		
		return "redirect:/helloTiles";
	}
	
}
