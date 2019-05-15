package kr.or.ddit.document.dao;

import java.util.List;

import kr.or.ddit.document.model.DocumentVo;
import kr.or.ddit.document.model.Document_refVo;

public interface IDocument_refDao {

	public int insertDocument_ref(Document_refVo document_refVo);
	
	public List<Document_refVo> getAllDocument_ref(); 
	
	public List<Document_refVo> selectDocument_ref(Document_refVo document_refVo);

	public int updateDocument_ref(Document_refVo document_refVo);
	
	public int deleteDocument_ref(String documentNumber);
	
	public List<Document_refVo > selectDocument_refNumber(String documentNumber);
}
