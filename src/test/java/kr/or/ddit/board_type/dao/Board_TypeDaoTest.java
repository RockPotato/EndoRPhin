package kr.or.ddit.board_type.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.fail;

import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.board.dao.IBoard_TypeDao;
import kr.or.ddit.board.model.Board_TypeVo;
import kr.or.ddit.set.LogicConfig;


public class Board_TypeDaoTest extends LogicConfig{
	private static final Logger logger = LoggerFactory.getLogger(Board_TypeDaoTest.class);
	
	@Resource(name="board_TypeDao")
	private IBoard_TypeDao board_TypeDao;
	
	/**
	 * 
	* Method : boardAllListTest
	* 작성자 : macbook
	* 변경이력 :
	* Method 설명 : 전체 게시판 조회
	 */
	@Test
	public void boardAllListTest() {
		/***Given***/
		List<Board_TypeVo> boardList = board_TypeDao.boardAllList();
		/***When***/
		
		/***Then***/
		assertNotNull(boardList);
	}
	
	/**
	 * 
	* Method : boardInsertTest
	* 작성자 : macbook
	* 변경이력 :
	* Method 설명 : 게시판 등록
	 */
	@Test
	public void boardInsertTest(){
		/***Given***/
		Board_TypeVo board_TypeVo = new Board_TypeVo();
		
		String boardTypeName = "방명록";

		/***When***/
		int boardInsert = board_TypeDao.insertBoard(boardTypeName);
		/***Then***/
		assertEquals(1, boardInsert);

	}
	
	/**
	 * 
	* Method : boardUpdateTest
	* 작성자 : macbook
	* 변경이력 :
	* Method 설명 : 게시판 수정
	 */
	@Test
	public void boardUpdateTest(){
		/***Given***/
		Board_TypeVo board_TypeVo = new Board_TypeVo();

		board_TypeVo.setBoardTypeCode("4");
		board_TypeVo.setBoardTypeName("ㅇ러마ㅣㅓ일");
		board_TypeVo.setUseStatus("1");
		/***When***/
		int boardUpdate = board_TypeDao.updateBoard(board_TypeVo);
		/***Then***/
		assertNotNull(boardUpdate);

	}
	
	@Test
	public void deleteBoardTest(){
		/***Given***/
		String boardTypeCode = "4";

		/***When***/
		int deleteBoard = board_TypeDao.deleteBoard(boardTypeCode);

		/***Then***/
		assertEquals(1, deleteBoard);

	}
	

}
