package kr.or.ddit.handler.service;

import java.util.List;

import kr.or.ddit.handler.model.NoteVo;

public interface INoteService {
	
	List<NoteVo> selectNote(NoteVo note);
	
	int insertNote(NoteVo vo);
	
	int deleteNote(String note);
	
	int receivedateUpdate(String note);

}
