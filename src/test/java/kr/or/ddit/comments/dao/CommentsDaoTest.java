package kr.or.ddit.comments.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.board.dao.ICommentsDao;
import kr.or.ddit.board.model.CommentsVo;
import kr.or.ddit.set.LogicConfig;

public class CommentsDaoTest extends LogicConfig{

	@Resource(name="commentsDao")
	private ICommentsDao commentsDao;
	
	/**
	 * 
	* Method : selectComments_boardNo
	* 작성자 : macbook
	* 변경이력 :
	* Method 설명 : 게시글 번호로 조회
	 */
	@Test
	public void selectComments_boardNoTest() {
		/***Given***/
		String boardNo = "6";

		/***When***/
		List<CommentsVo> selectComments_boardNo = commentsDao.selectComments_boardNo(boardNo);
		/***Then***/
		assertEquals("댓글 테스트", selectComments_boardNo);
	}
	
	/**
	 * 
	* Method : insertCommentsTest
	* 작성자 : macbook
	* 변경이력 :
	* Method 설명 : 댓글 등록
	 */
	@Test
	public void insertCommentsTest() {
		/***Given***/
		CommentsVo commentsVo = new CommentsVo(); 
		commentsVo.setBoardNo("17");
		commentsVo.setCommentContents("댓글 테스트");
		commentsVo.setBoardNo("6");
		commentsVo.setCommentUser("1");
		/***When***/
		int insertComments = commentsDao.insertComments(commentsVo);
		/***Then***/
		assertEquals(1, insertComments);

	}
	
	/**
	 * 
	* Method : deleteCommentsTest
	* 작성자 : macbook
	* 변경이력 :
	* Method 설명 : 댓글 삭제
	 */
	@Test
	public void deleteCommentsTest() {
		/***Given***/
		String commentNo = "2";

		/***When***/
		int deleteComments = commentsDao.deleteComments(commentNo);
		/***Then***/
		assertEquals(1, deleteComments);
	}

}
