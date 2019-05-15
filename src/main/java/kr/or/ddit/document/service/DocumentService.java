package kr.or.ddit.document.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.document.dao.IDocumentDao;
import kr.or.ddit.document.model.DocumentVo;

@Service("documentService")
public class DocumentService implements IDocumentService{

	@Resource(name="documentDao")
	private IDocumentDao documentDao;
	
	@Override
	public int insertDocument(DocumentVo documentVo) {
		return documentDao.insertDocument(documentVo);
	}

	@Override
	public List<DocumentVo> getAllDocument() {
		return documentDao.getAllDocument();
	}

	@Override
	public List<DocumentVo> selectDocument(String documentnumber) {
		return documentDao.selectDocument(documentnumber);
	}

	@Override
	public int updateDocument(DocumentVo documentVo) {
		return documentDao.updateDocument(documentVo);
	}

	@Override
	public List<DocumentVo> getAllTemporarily() {
		return documentDao.getAllTemporarily();
	}

	@Override
	public int deleteDocument(String documentnumber) {
		return documentDao.deleteDocument(documentnumber);
	}

	@Override
	public List<DocumentVo> selectDocumentbyUser(DocumentVo documentVo) {
		return documentDao.selectDocumentbyUser(documentVo);
	}

	@Override
	public List<DocumentVo> getAllReturnDocument(String userId) {
		return documentDao.getAllReturnDocument(userId);
	}

	/**
	 * 
	* Method : searchdocument
	* 작성자 : macbook
	* 변경이력 :
	* @param documentVo
	* @return
	* Method 설명 : 기안함 검색
	 */
	@Override
	public List<DocumentVo> searchDocument(DocumentVo documentVo) {
		return documentDao.searchDocument(documentVo);
	}

	/**
	 * 
	* Method : searchTemporarily
	* 작성자 : macbook
	* 변경이력 :
	* @param documentVo
	* @return
	* Method 설명 : 임시 보관함 검색 
	 */
	@Override
	public List<DocumentVo> searchTemporarily(DocumentVo documentVo) {
		return documentDao.searchTemporarily(documentVo);
	}

	/**
	 * 
	* Method : searchUndecided
	* 작성자 : macbook
	* 변경이력 :
	* @param documentVo
	* @return
	* Method 설명 : 미결함 검색
	 */
	@Override
	public List<DocumentVo> searchUndecided(DocumentVo documentVo) {
		return documentDao.searchUndecided(documentVo);
	}

	/**
	 * 
	* Method : searchReturn
	* 작성자 : macbook
	* 변경이력 :
	* @param documentVo
	* @return
	* Method 설명 : 반려함 검색
	 */
	@Override
	public List<DocumentVo> searchReturn(DocumentVo documentVo) {
		return documentDao.searchReturn(documentVo);
	}

	@Override
	public List<DocumentVo> getAllUndecided(String userId) {
		return documentDao.getAllUndecided(userId);
	}

	@Override
	public List<DocumentVo> getAllComplete(String presentUser) {
		return documentDao.getAllComplete(presentUser);
	}

	@Override
	public List<DocumentVo> searchComplete(DocumentVo documentVo) {
		return documentDao.searchComplete(documentVo);
	}
	
}
