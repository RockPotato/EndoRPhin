package kr.or.ddit.board_type.service;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.board.model.Board_TypeVo;
import kr.or.ddit.board.service.IBoard_TypeService;
import kr.or.ddit.set.LogicConfig;

public class Board_TypeServiceTest extends LogicConfig{

	@Resource(name="board_TypeService")
	private IBoard_TypeService board_TypeService;
	
	/**
	 * 
	* Method : boardAllListTest
	* 작성자 : macbook
	* 변경이력 :
	* Method 설명 : 게시판 전체 조회
	 */
	@Test
	public void boardAllListTest() {
		/***Given***/
		List<Board_TypeVo> boardAllList = board_TypeService.boardAllList();

		/***When***/
		System.out.println(boardAllList);
		/***Then***/
		assertNotNull(boardAllList);

	}
	
	/**
	 * 
	* Method : insertBoardTest
	* 작성자 : macbook
	* 변경이력 :
	* Method 설명 : 게시판 생성
	 */
	@Test
	public void insertBoardTest(){
		/***Given***/
		String boardTypeName = "공지사항";
		
		/***When***/
		int insertBoard = board_TypeService.insertBoard(boardTypeName);

		/***Then***/
		assertEquals(1, insertBoard);
	}
	
	/**
	 * 
	* Method : updateBoardTest
	* 작성자 : macbook
	* 변경이력 :
	* Method 설명 : 게시판 수정
	 */
	@Test
	public void updateBoardTest(){
		/***Given***/
		Board_TypeVo board_TypeVo = new Board_TypeVo();
		board_TypeVo.setBoardTypeCode("6");
		board_TypeVo.setBoardTypeName("ㅇ러마ㅣㅓ일");
		board_TypeVo.setUseStatus("1");

		/***When***/
		
		int updateBoard = board_TypeService.updateBoard(board_TypeVo);
		/***Then***/
		assertEquals(1, updateBoard);

	}
	
	/**
	 * 
	* Method : deleteBoardTest
	* 작성자 : macbook
	* 변경이력 :
	* Method 설명 : 게시판 삭제
	 */
	@Test
	public void deleteBoardTest(){
		/***Given***/
		String boardTypeCode = "6";

		/***When***/
		int deleteBoard = board_TypeService.deleteBoard(boardTypeCode);
		/***Then***/
		assertEquals(1, deleteBoard);
	}

}
