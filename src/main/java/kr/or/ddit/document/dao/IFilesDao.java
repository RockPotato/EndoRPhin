package kr.or.ddit.document.dao;

import java.util.List;

import kr.or.ddit.document.model.FilesVo;

public interface IFilesDao {

	public int insertFiles(FilesVo filesVo);
	
	/**
	* Method : selectFiles
	* 작성자 : PC05
	* 변경이력 :
	* @param filecode
	* @return
	* Method 설명 : 첨부파일선택 시 다운
	*/
	FilesVo selectFiles(String filecode);
	
	
	/**
	* Method : updateFiles
	* 작성자 : PC05
	* 변경이력 :
	* @param filesVo
	* @return
	* Method 설명 : 첨부파일 수정
	*/
	int updateFiles(FilesVo filesVo);
	
	/**
	* Method : documentFileList
	* 작성자 : PC05
	* 변경이력 :
	* @param documentNumber
	* @return
	* Method 설명 : 게시글마다 첨부파일 조회 
	*/
	List<FilesVo> documentFileList(String documentNumber);
	
	
	/**
	* Method : deleteFiles
	* 작성자 : PC05
	* 변경이력 :
	* @param filecode
	* @return
	* Method 설명 : 첨부파일 삭제 
	*/
	int deleteFiles(String filecode);
}
