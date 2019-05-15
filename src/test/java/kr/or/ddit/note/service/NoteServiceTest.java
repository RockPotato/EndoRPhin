package kr.or.ddit.note.service;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.handler.model.NoteVo;
import kr.or.ddit.handler.service.INoteService;
import kr.or.ddit.set.LogicConfig;

public class NoteServiceTest extends LogicConfig{
	private Logger logger = LoggerFactory.getLogger(NoteServiceTest.class);

	@Resource(name="noteService")
	INoteService noteService;
	
	@Test
	public void noteInsertTest() {
		NoteVo vo = new NoteVo();
		vo.setSendid("1");
		vo.setReceiveid("2");
		vo.setContent("3");
		
		noteService.insertNote(vo);
		
	}
	
	
	@Test
	public void noteselectTest() {
		NoteVo vo = new NoteVo();
		vo.setReceiveid("P4134");
		
	 List<NoteVo> selectNote = noteService.selectNote(vo);
	 
		System.out.println("selectNote :" + selectNote);
		
		
	}
	
	@Test
	public void noteupdateTest() {
		
	 noteService.receivedateUpdate("50");
	 
		
		
	}
	
	

}
