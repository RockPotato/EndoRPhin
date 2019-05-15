package kr.or.ddit.document.service;

import java.util.List;

import kr.or.ddit.document.model.DocumentVo;

public interface IDocumentService {
	
	/**
	* Method : getAllDocument
	* 작성자 : PC05
	* 변경이력 :
	* @return
	* Method 설명 : 모든 기안문서 조회
	*/
	List<DocumentVo> getAllDocument();
	
	/**
	* Method : insertDocument
	* 작성자 : PC05
	* 변경이력 :
	* @param documentVo
	* @return
	* Method 설명 : 기안등록
	*/
	int insertDocument(DocumentVo documentVo);
	
	
	List<DocumentVo> selectDocument(String documentnumber);
	
	int updateDocument(DocumentVo documentVo);
	
	
	/**
	* Method : getAllTemporarily
	* 작성자 : PC05
	* 변경이력 :
	* @param documentVo
	* @return
	* Method 설명 : 임시보관함 출력
	*/
	List<DocumentVo> getAllTemporarily();
	
	/**
	* Method : deleteDocument
	* 작성자 : PC05
	* 변경이력 :
	* @param documentnumber
	* @return
	* Method 설명 : 임시보관함 삭제 
	*/
	int deleteDocument(String documentnumber);
	
	List<DocumentVo> selectDocumentbyUser(DocumentVo documentVo);
	
	List<DocumentVo> getAllReturnDocument(String userId);
	
	/**
	 * 
	* Method : searchdocument
	* 작성자 : macbook
	* 변경이력 :
	* @return
	* Method 설명 : 기안함 검색
	 */
	List<DocumentVo> searchDocument(DocumentVo documentVo);
	
	/**
	 * 
	* Method : searchTemporarily
	* 작성자 : macbook
	* 변경이력 :
	* @param documentVo
	* @return
	* Method 설명 : 임시 보관함 검색
	 */
	List<DocumentVo> searchTemporarily(DocumentVo documentVo);
	
	/**
	 * 
	* Method : searchUndecided
	* 작성자 : macbook
	* 변경이력 :
	* @param documentVo
	* @return
	* Method 설명 : 미결함 검색
	 */
	List<DocumentVo> searchUndecided(DocumentVo documentVo);
	
	/**
	 * 
	* Method : searchReturn
	* 작성자 : macbook
	* 변경이력 :
	* @param documentVo
	* @return
	* Method 설명 : 반려함 검색
	 */
	List<DocumentVo> searchReturn(DocumentVo documentVo);

	/**
	* Method : searchComplete
	* 작성자 : PC05
	* 변경이력 :
	* @param documentVo
	* @return
	* Method 설명 : 완료함 검색
	*/
	List<DocumentVo> searchComplete(DocumentVo documentVo);
	
	
	List<DocumentVo> getAllUndecided(String userId);
	
	List<DocumentVo> getAllComplete(String presentUser);
}
