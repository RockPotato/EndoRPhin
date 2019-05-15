package kr.or.ddit.handler.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.handler.model.NoteVo;

@Repository("noteDao")
public class NoteDao implements INoteDao{
	
	@Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;

	
	
	@Override
	public List<NoteVo> selectNote(NoteVo note) {
		return sqlSessionTemplate.selectList("note.receiveNewNote", note);
	}
	
	@Override
	public int insertNote(NoteVo vo) {
		return sqlSessionTemplate.insert("note.insertNote", vo);
	}

	@Override
	public int deleteNote(String note) {
		return sqlSessionTemplate.insert("note.deleteNote", note);
	}

	
	
	@Override
	public int receivedateUpdate(String note) {
		return sqlSessionTemplate.update("note.receivedateUpdate", note);
	}

}
