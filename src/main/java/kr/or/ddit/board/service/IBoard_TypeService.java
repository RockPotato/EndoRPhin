package kr.or.ddit.board.service;

import java.util.List;

import kr.or.ddit.board.model.Board_TypeVo;

public interface IBoard_TypeService {
	
	/**
	 * 
	* Method : boardAllList
	* 작성자 : macbook
	* 변경이력 :
	* @return
	* Method 설명 : 전체 게시판 전체 조회
	 */
	List<Board_TypeVo> boardAllList();
	
	/**
	 * 
	* Method : insertBoard
	* 작성자 : macbook
	* 변경이력 :
	* @param board_TypeVo
	* @return
	* Method 설명 : 게시판 생성
	 */
	int insertBoard(String boardTypeName);
	
	/**
	 * 
	* Method : updateBoard
	* 작성자 : macbook
	* 변경이력 :
	* @return
	* Method 설명 : 게시판 수정
	 */
	int updateBoard(Board_TypeVo board_TypeVo);
	
	/**
	 * 
	* Method : deleteBoard
	* 작성자 : macbook
	* 변경이력 :
	* @param boardTypeCode
	* @return
	* Method 설명 : 게시판 삭제
	 */
	int deleteBoard(String boardTypeCode);
	
	/**
	 * 
	* Method : select_BoardName
	* 작성자 : macbook
	* 변경이력 :
	* @param board_name
	* @return
	* Method 설명 : 게시판 조회
	 */
	Board_TypeVo select_BoardType(String board_name);

}
