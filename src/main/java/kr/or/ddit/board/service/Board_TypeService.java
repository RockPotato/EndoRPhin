package kr.or.ddit.board.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.board.dao.IBoard_TypeDao;
import kr.or.ddit.board.model.Board_TypeVo;

@Service("board_TypeService")
public class Board_TypeService implements IBoard_TypeService{

	@Resource(name="board_TypeDao")
	private IBoard_TypeDao board_TypeDao;

	public Board_TypeService(){
		
	}
	
	/**
	 * 
	* Method : boardAllList
	* 작성자 : macbook
	* 변경이력 :
	* @return
	* Method 설명 : 게시판 조회
	 */
	@Override
	public List<Board_TypeVo> boardAllList() {
		
		List<Board_TypeVo> boardAllList = board_TypeDao.boardAllList();
		return boardAllList;
	}

	/**
	 * 
	* Method : insertBoard
	* 작성자 : macbook
	* 변경이력 :
	* @param board_TypeVo
	* @return
	* Method 설명 : 게시판 생성
	 */
	@Override
	public int insertBoard(String boardTypeName) {
		
		int insertBoard = board_TypeDao.insertBoard(boardTypeName);
		return insertBoard;
	}

	/**
	 * 
	* Method : updateBoard
	* 작성자 : macbook
	* 변경이력 :
	* @param board_TypeVo
	* @return
	* Method 설명 : 게시판 수정
	 */
	@Override
	public int updateBoard(Board_TypeVo board_TypeVo) {
		int updateBoard = board_TypeDao.updateBoard(board_TypeVo);
		return updateBoard;
	}

	/**
	 * 
	* Method : deleteBoard
	* 작성자 : macbook
	* 변경이력 :
	* @param boardTypeCode
	* @return
	* Method 설명 : 게시판 삭제
	 */
	@Override
	public int deleteBoard(String boardTypeCode) {
		int deleteBoard = board_TypeDao.deleteBoard(boardTypeCode);
		return deleteBoard;
	}

	/**
	 * 
	* Method : select_BoardType
	* 작성자 : macbook
	* 변경이력 :
	* @param board_name
	* @return
	* Method 설명 : 게시판 조회
	 */
	@Override
	public Board_TypeVo select_BoardType(String board_name) {
		Board_TypeVo select_BoardType = board_TypeDao.select_BoardType(board_name);
		return select_BoardType;
	}
}
