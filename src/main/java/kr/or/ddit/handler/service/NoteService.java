package kr.or.ddit.handler.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.handler.dao.INoteDao;
import kr.or.ddit.handler.model.NoteVo;

@Service("noteService")
public class NoteService implements INoteService{
	
	@Resource(name="noteDao")
	private INoteDao noteDao;
	
	
	
	@Override
	public List<NoteVo> selectNote(NoteVo note) {
		return noteDao.selectNote(note);
		
	}

	@Override
	public int insertNote(NoteVo vo) {
		return noteDao.insertNote(vo);
	}

	@Override
	public int deleteNote(String note) {
		return noteDao.deleteNote(note);
		
	}
	

	@Override
	public int receivedateUpdate(String note) {
		
		return noteDao.receivedateUpdate(note);
	}

}
