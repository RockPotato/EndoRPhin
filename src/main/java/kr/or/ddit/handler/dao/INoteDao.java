package kr.or.ddit.handler.dao;

import java.util.List;

import kr.or.ddit.handler.model.NoteVo;

public interface INoteDao {
	
	
	
	List<NoteVo> selectNote(NoteVo note);
	
	
	
	int insertNote(NoteVo vo);
	
	int deleteNote(String note);
	
	int receivedateUpdate(String note);
	

}
