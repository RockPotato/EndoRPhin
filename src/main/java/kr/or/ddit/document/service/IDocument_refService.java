package kr.or.ddit.document.service;

import java.util.List;

import kr.or.ddit.document.model.Document_refVo;

public interface IDocument_refService {

	public int insertDocument_ref(Document_refVo document_refVo);
	
	/**
	* Method : getAllDocument_ref
	* 작성자 : PC05
	* 변경이력 :
	* @return
	* Method 설명 : 결재지정한사람 출력
	*/
	public List<Document_refVo> getAllDocument_ref(); 
	
	public List<Document_refVo> selectDocument_ref(Document_refVo document_refVo);

	public int updateDocument_ref(Document_refVo document_refVo);
	
	public int deleteDocument_ref(String documentNumber);
	
	public List<Document_refVo > selectDocument_refNumber(String documentNumber);
}
