package kr.or.ddit.employee.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.employee.model.EmployeeVo;
import kr.or.ddit.employee.model.Employee_detailVo;
import kr.or.ddit.employee.model.PositionVo;
import kr.or.ddit.employee.service.IEmployeeDetailService;
import kr.or.ddit.employee.service.IEmployeeService;
import kr.or.ddit.employee.service.IPositionService;

@RequestMapping("/emplPosition")
@Controller
public class PositionController {
	private Logger logger = LoggerFactory.getLogger(PositionController.class);
	
	
	@Resource(name = "positionService")
	private IPositionService positionService;
	
	
	@RequestMapping(path = "/getAllemplPosition", method = RequestMethod.GET)
	public String getAllemplPosition(Model model) {
		
		
		List<PositionVo> allPosition = positionService.getAllPosition();
		
		logger.debug("포지션 : {}",allPosition);
		model.addAttribute("allPosition",allPosition);
		
		
		return "positionListTiles";
	}
	
	
	
	
	@RequestMapping(path = "/insertemplPosition", method = RequestMethod.POST)
	public String insertEmployee_POST(Model model, PositionVo vo,RedirectAttributes ra) throws IllegalStateException, IOException {
		
		int insertPosition = positionService.insertPosition(vo);
							 
		
		
		ra.addFlashAttribute("msg", "정상 등록 되었습니다");
		return "redirect:/emplPosition/getAllemplPosition";
	}
	
	
	
	
	
	
	
	@RequestMapping(path="/emplIdAjax", method=RequestMethod.POST)
	@ResponseBody
	public String emplIdAjax(@RequestParam(name="userId", defaultValue="WS")String userId) {
		
		
		List<PositionVo> allPosition = positionService.getAllPosition();
		
		
		String userIdCode = "1";
		
		for(int i = 0; i < allPosition.size(); i++) {
			// Duplicate Code = 0
			if(userId.equals(allPosition.get(i).getPositionCode())){
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
	
	@RequestMapping(path = "/delteEmplPosition", method = RequestMethod.GET)
	public String deleteEmployee(Model model, EmployeeVo vo,RedirectAttributes ra,
			@RequestParam String delete_no) {
		
		
		String[] index = delete_no.split(",");
		
		for (int i = 0; i < index.length; i++) {
			positionService.deletePosition(index[i]);
			
		}
		
		ra.addFlashAttribute("msg", "정상 삭제 되었습니다");
		
		return "redirect:/emplPosition/getAllemplPosition";
	}
	
	

	
	@RequestMapping(path = "/updatePosition", method = RequestMethod.GET)
	@ResponseBody
	public PositionVo updatePosition_GET(String userId,RedirectAttributes ra) throws IllegalStateException, IOException {
		
		
		PositionVo selectPosition = positionService.selectPosition(userId);
		
		return selectPosition;
	}
	
	
	
	
	
	
	
	@RequestMapping(path = "/updatePosition", method = RequestMethod.POST)
	public String updatePosition_POST(PositionVo vo,RedirectAttributes ra){
		ra.addFlashAttribute("msg", "정상 수정 되었습니다");
		positionService.updatePosition(vo);
		
		return "redirect:/emplPosition/getAllemplPosition";
		
	}
	
	
	
	
	
	
	
	/*@RequestMapping(path = "/insertEmployee", method = RequestMethod.GET)
	public String insertEmployee_GET(Model model) {
		
		return "insertEmployeeTiles";
	}
	
	@RequestMapping(path = "/insertEmployee", method = RequestMethod.POST)
	public String insertEmployee_POST(Model model, EmployeeVo vo,RedirectAttributes ra,
			MultipartRequest multparts) throws IllegalStateException, IOException {
		employeeService.insertEmployee(vo);
		
		MultipartFile file = multparts.getFile("realFilename");
		Employee_detailVo detailVo = new Employee_detailVo();
		
		String file_name = "";
		String file_path = "";
		
		
		if (file.getSize() > 0) {
			file_name = file.getOriginalFilename();
			file_path = ("c:\\picture\\" + UUID.randomUUID().toString());
			file.transferTo(new File(file_path));
			
			detailVo.setUserId(vo.getUserId());
			detailVo.setImg_name(file_name);
			detailVo.setImg_path(file_path);

		}
		
							 
		                     employeeDetailService.insertEmployeeDetail(detailVo);
		
		ra.addFlashAttribute("msg", "정상 등록 되었습니다");
		return "redirect:/employee/getAllEmployee";
	}
	
	@RequestMapping(path = "/deleteEmployee", method = RequestMethod.GET)
	public String deleteEmployee(Model model, EmployeeVo vo,RedirectAttributes ra,
			@RequestParam String delete_no) {
		logger.debug("감자 : {}",delete_no);
		
		
		ra.addFlashAttribute("msg", "정상 삭제 되었습니다");
		employeeService.deleteEmployee(delete_no);
		
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
			@RequestParam("userId") String userId) throws IOException {

		response.setHeader("content-Disposition", "attachment; filename=profile.png");
		response.setContentType("image.png");
		logger.debug("이미지서브릿 : {}",userId);
		Employee_detailVo vo = employeeDetailService.selectEmployeeDetail(userId);

		FileInputStream fis;
		if (vo != null && vo.getImg_name() != null) {
			fis = new FileInputStream(new File(vo.getImg_path()));
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

	}*/
	

	
	
	







}
