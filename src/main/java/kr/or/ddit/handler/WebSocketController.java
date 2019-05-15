package kr.or.ddit.handler;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.employee.model.EmployeeVo;
import kr.or.ddit.employee.service.IEmployeeService;
import kr.or.ddit.handler.model.NoteVo;
import kr.or.ddit.handler.service.INoteService;

@Controller
public class WebSocketController {
	
	@Resource(name = "employeeService")
	private IEmployeeService employeeService;
	
	@Resource(name = "noteService")
	private INoteService noteService;
	
	
	
	@RequestMapping(path = "/webSocketView", method = RequestMethod.GET)
	public ModelAndView webSocketView(ModelAndView mv) {
		
		mv.setViewName("websocket/websocket");
		
		return mv;
	}
	
	@RequestMapping(path = "/emplView", method = RequestMethod.GET)
	@ResponseBody
	public List<EmployeeVo> emplView() {
		
		List<EmployeeVo> allEmployee = employeeService.getAllEmployee();
		
		
		return allEmployee;
	}
	
	@RequestMapping(path = "/messageSending", method = RequestMethod.GET)
	@ResponseBody
	public void messageSend(NoteVo vo) {
		noteService.insertNote(vo);
	}
	
	
	@RequestMapping(path = "/newHAM", method = RequestMethod.GET)
	@ResponseBody
	public List<NoteVo> newHAM(HttpServletRequest req) {
		EmployeeVo attribute = (EmployeeVo) req.getSession().getAttribute("employeeVo");
		
		
		
		NoteVo tempvo = new NoteVo();	
		tempvo.setReceiveid(attribute.getUserId());
		
		List<NoteVo> tempNote = new ArrayList<>();
		List<NoteVo> selectNote = noteService.selectNote(tempvo);
		
		for (int i = 0; i < selectNote.size(); i++) {
			if(selectNote.get(i).getReceivedate() == null){
				tempvo = new NoteVo();	
				tempvo.setReceiveid(attribute.getUserId());
				tempvo.setSendid(selectNote.get(i).getSendid());
				tempvo.setUsernm(selectNote.get(i).getUsernm());
				tempvo.setNoteno(selectNote.get(i).getNoteno());
				tempvo.setContent(selectNote.get(i).getContent());
				tempvo.setSenddate(selectNote.get(i).getSenddate());
				tempNote.add(tempvo);
			}
			
			
		}
		
		
		return tempNote;
		
	}
	
	@RequestMapping(path = "/receivedateUpdate", method = RequestMethod.GET)
	@ResponseBody
	public void receivedateUpdate(String noteno) {
		
		noteService.receivedateUpdate(noteno);
		
	}
	
	
	@RequestMapping(path = "/receiveHAM", method = RequestMethod.GET)
	@ResponseBody
	public List<NoteVo> receiveHAM(HttpServletRequest req) {
	EmployeeVo attribute = (EmployeeVo) req.getSession().getAttribute("employeeVo");
		
	NoteVo tempvo = new NoteVo();
	tempvo.setReceiveid(attribute.getUserId());	
		List<NoteVo> tempNote = new ArrayList<>();
		List<NoteVo> selectNote = noteService.selectNote(tempvo);
		for (int i = 0; i < selectNote.size(); i++) {
			tempvo = new NoteVo();	
			
			if(selectNote.get(i).getReceivedate() != null){
				tempvo.setSendid(selectNote.get(i).getSendid());
				tempvo.setUsernm(selectNote.get(i).getUsernm());
				tempvo.setNoteno(selectNote.get(i).getNoteno());
				tempvo.setContent(selectNote.get(i).getContent());
				tempvo.setSenddate(selectNote.get(i).getSenddate());
				tempNote.add(tempvo);
			}
		}
		
		return tempNote;
		
	}
	
	@RequestMapping(path = "/sendHAM", method = RequestMethod.GET)
	@ResponseBody
	public List<NoteVo> sendHAM(HttpServletRequest req) {
	EmployeeVo attribute = (EmployeeVo) req.getSession().getAttribute("employeeVo");
		
		
		NoteVo tempvo = new NoteVo();	
		tempvo.setSendid(attribute.getUserId());
		List<NoteVo> selectNote = noteService.selectNote(tempvo);
		
		return selectNote;
		
	}
	
	
	@RequestMapping(path = "/deleteNoteNo", method = RequestMethod.GET)
	@ResponseBody
	public int deleteNoteNo(String deleteNo) {
		int deleteNote = noteService.deleteNote(deleteNo);
		
		return deleteNote ;
		
	}
	
	
	
	
	
	
	

}
