package kr.or.ddit.board.dao;

import java.util.List;

import kr.or.ddit.board.model.CommentsVo;

public interface ICommentsDao {

	
	/**
	 * 
	* Method : selectComments_boardNo
	* 작성자 : macbook
	* 변경이력 :
	* @param boardNo
	* @return
	* Method 설명 : 게시글 별 댓글 조회
	 */
	List<CommentsVo> selectComments_boardNo(String boardNo);
	
	/**
	 * 
	* Method : insertComments
	* 작성자 : macbook
	* 변경이력 :
	* @param commentsVo
	* @return
	* Method 설명 : 댓글 등록
	 */
	int insertComments(CommentsVo commentsVo);
	
	/**
	 * 
	* Method : deleteComments
	* 작성자 : macbook
	* 변경이력 :
	* @param commentNo
	* @return
	* Method 설명 : 댓글 삭제
	 */
	int deleteComments(String boardNo);
	
	/**
	 * 
	* Method : updateComments
	* 작성자 : macbook
	* 변경이력 :
	* @param commentsVo
	* @return
	* Method 설명 : 댓글 수정
	 */
	int updateComments(CommentsVo commentsVo);
}
