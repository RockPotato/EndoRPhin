package kr.or.ddit.board.service;

import java.util.List;

import kr.or.ddit.board.model.Attach_boardVo;

public interface IAttach_boardService {

	/**
	 * 
	* Method : attachBoardNoSelect
	* 작성자 : macbook
	* 변경이력 :
	* @param boarno
	* @return
	* Method 설명 : 게시글 번호 별 첨부파일 조회
	 */
	List<Attach_boardVo> attachBoardNoSelect(String boardno);
	
	/**
	 * 
	* Method : attachCodeSelectOne
	* 작성자 : macbook
	* 변경이력 :
	* @param attachcode
	* @return
	* Method 설명 : 첨부파일 번호 조회
	 */
	Attach_boardVo attachCodeSelectOne(String attachcode);
	
	/**
	 * 
	* Method : attach_boardDelete
	* 작성자 : macbook
	* 변경이력 :
	* @param boardno
	* @return
	* Method 설명 : 첨부파일 삭제
	 */
	int attach_boardDelete(String attachCode);
}
