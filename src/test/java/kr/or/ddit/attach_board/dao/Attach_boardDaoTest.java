package kr.or.ddit.attach_board.dao;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.board.dao.Attach_boardDao;
import kr.or.ddit.board.model.Attach_boardVo;
import kr.or.ddit.set.LogicConfig;

public class Attach_boardDaoTest extends LogicConfig{

	@Resource(name="attach_boardDao")
	private Attach_boardDao attach_boardDao;
	
	/**
	 * 
	* Method : attach_boardSelectTest
	* 작성자 : macbook
	* 변경이력 :
	* Method 설명 : 첨부파일에 대한 게시글 조회
	 */
	@Test
	public void attach_boardSelectTest() {
		/***Given***/
		String boardno = "5";
		/***When***/
		attach_boardDao.attachBoardNoSelect(boardno);
		/***Then***/
		assertNotNull(boardno);
	}
	
	/**
	 * 
	* Method : attach_boardSelectOneTest
	* 작성자 : macbook
	* 변경이력 :
	* Method 설명 : 첨부파일 조회
	 */
	@Test
	public void attach_boardSelectOneTest(){
		/***Given***/
		String attachcode = "1";

		/***When***/
		Attach_boardVo attach_boardSelectOne = attach_boardDao.attachCodeSelectOne(attachcode);

		/***Then***/
		assertNotNull(attach_boardSelectOne);
	}
	
	/**
	 * 
	* Method : attach_boardInsertTest
	* 작성자 : macbook
	* 변경이력 :
	* Method 설명 : 첨부파일 등록
	 */
	@Test
	public void attach_boardInsertTest(){
		/***Given***/
		Attach_boardVo attach_boardVo = new Attach_boardVo();
		attach_boardVo.setAttachName("vkdkjfkajsdf");
		attach_boardVo.setAttachRealname("12431231");
		attach_boardVo.setAttachRealpath("1123123");
		attach_boardVo.setBoardNo("6");
		
		/***When***/
		int attach_boardInsert = attach_boardDao.attachInsert(attach_boardVo);
		
		/***Then***/
		assertEquals(1, attach_boardInsert);
	}
	
	/**
	 * 
	* Method : attach_boardDeleteTest
	* 작성자 : macbook
	* 변경이력 :
	* Method 설명 : 첨부파일 삭제
	 */
	@Test
	public void attach_boardDeleteTest(){
		/***Given***/
		String boardno = "6"; 

		/***When***/
		int attach_boardDelete = attach_boardDao.attach_boardDelete(boardno);
		
		/***Then***/
		assertEquals(2, attach_boardDelete);

	}
	

}
