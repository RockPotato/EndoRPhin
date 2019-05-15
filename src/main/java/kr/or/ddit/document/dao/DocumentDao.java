package kr.or.ddit.document.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.document.model.DocumentVo;

@Repository("documentDao")
public class DocumentDao implements IDocumentDao{

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int insertDocument(DocumentVo documentVo) {
		return sqlSessionTemplate.insert("document.insertDocument",documentVo);
	}

	@Override
	public List<DocumentVo> getAllDocument() {
		return sqlSessionTemplate.selectList("document.getAllDocument");
	}

	@Override
	public List<DocumentVo> selectDocument(String documentnumber) {
		return sqlSessionTemplate.selectList("document.selectDocument",documentnumber);
	}

	@Override
	public int updateDocument(DocumentVo documentVo) {
		return sqlSessionTemplate.update("document.updateDocument",documentVo);
	}

	@Override
	public  List<DocumentVo>  getAllTemporarily() {
		return sqlSessionTemplate.selectList("document.getAllTemporarily");
	}

	@Override
	public int deleteDocument(String documentnumber) {
		return sqlSessionTemplate.delete("document.deleteDocument",documentnumber);
	}

	@Override
	public List<DocumentVo> selectDocumentbyUser(DocumentVo documentVo) {
		return sqlSessionTemplate.selectList("document.selectDocumentbyUser",documentVo);
	}

	@Override
	public List<DocumentVo> getAllReturnDocument(String userId) {
		return sqlSessionTemplate.selectList("document.getAllReturnDocument",userId);
	}

	/**
	 * 
	* Method : searchDocument
	* 작성자 : macbook
	* 변경이력 :
	* @param documentVo
	* @return
	* Method 설명 : 기안함 검색
	 */
	@Override
	public List<DocumentVo> searchDocument(DocumentVo documentVo) {
		return sqlSessionTemplate.selectList("document.searchDocument",documentVo);
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
		return sqlSessionTemplate.selectList("document.searchTemporarily",documentVo);
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
		return sqlSessionTemplate.selectList("document.searchUndecided",documentVo);
	}

	@Override
	public List<DocumentVo> searchReturn(DocumentVo documentVo) {
		return sqlSessionTemplate.selectList("document.searchReturn",documentVo);
	}

	@Override
	public List<DocumentVo> getAllUndecided(String userId) {
		return sqlSessionTemplate.selectList("document.getAllUndecided",userId);
	}

	@Override
	public List<DocumentVo> getAllComplete(String presentUser) {
		return sqlSessionTemplate.selectList("document.getAllComplete",presentUser);
	}

	@Override
	public List<DocumentVo> searchComplete(DocumentVo documentVo) {
		return sqlSessionTemplate.selectList("document.searchComplete",documentVo);
	}
	
}
