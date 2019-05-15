package kr.or.ddit.board_detail.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.board.dao.IBoard_detailDao;
import kr.or.ddit.board.model.Board_detailVo;
import kr.or.ddit.set.LogicConfig;

public class Board_detailDaoTest extends LogicConfig {

	@Resource(name="board_detailDao")
	private IBoard_detailDao board_datailDao;
	

	/**
	 * 
	* Method : postSelectOneTest
	* 작성자 : macbook
	* 변경이력 :
	* Method 설명 : 특정 게시글 조회
	 */
	@Test
	public void postSelectOneTest(){
		/***Given***/
		String boardNo = "1";

		/***When***/
		Board_detailVo postSelectOne = board_datailDao.postDetail(boardNo);
		/***Then***/
		assertEquals(null, postSelectOne);

	}
	
	/**
	 * 
	* Method : postCnt
	* 작성자 : macbook
	* 변경이력 :
	* Method 설명 : 게시글 수 조회
	 */
	@Test
	public void postCntTest(){
		/***Given***/
		Board_detailVo board_detailVo = new Board_detailVo();
		board_detailVo.setBoardTypeCode("7");
		
//		List<Board_detailVo> postCnt = board_datailDao.postCnt(boardTypeCode);

		/***When***/
		
		/***Then***/
//		assertEquals(null, postCnt);
	}
	
	/**
	 * 
	* Method : postInsertTest
	* 작성자 : macbook
	* 변경이력 :
	* Method 설명 : 게시글 등록
	 */
	@Test
	public void postInsertTest(){
		/***Given***/
		Board_detailVo board_detailVo = new Board_detailVo();
		
		board_detailVo.setBoardTypeCode("5");
		board_detailVo.setContents("안녕");
		board_detailVo.setTitle("제목");
		board_detailVo.setUserId("1");
		/***When***/
		int postInsert = board_datailDao.postInsert(board_detailVo);

		/***Then***/
		assertEquals(1, postInsert);

		
	}
	
	/**
	 * 
	* Method : postUpdateTest
	* 작성자 : macbook
	* 변경이력 :
	* Method 설명 : 게시글 수정
	 */
	@Test
	public void postUpdateTest(){
		/***Given***/
		Board_detailVo board_detailVo = new Board_detailVo();
		board_detailVo.setBoardTypeCode("5");
		board_detailVo.setContents("됫니");
		board_detailVo.setTitle("수정");
		board_detailVo.setUserId("1");
		board_detailVo.setBoardNo("5");
		
		/***When***/
		int postUpdate = board_datailDao.postUpdate(board_detailVo);

		/***Then***/
		assertEquals(1, postUpdate);

	}
	
	/**
	 * 
	* Method : postDeleteTest
	* 작성자 : macbook
	* 변경이력 :
	* Method 설명 : 게시글 삭제
	 */
	@Test
	public void postDeleteTest(){
		/***Given***/
		String boardno = "5";

		/***When***/
		int postDelete = board_datailDao.postDelete(boardno);

		/***Then***/
		assertEquals(1, postDelete);
	}

}
