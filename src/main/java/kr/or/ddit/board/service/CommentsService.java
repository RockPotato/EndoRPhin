package kr.or.ddit.board.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.board.dao.ICommentsDao;
import kr.or.ddit.board.model.CommentsVo;

@Service("commentsService")
public class CommentsService implements ICommentsService{

	@Resource(name="commentsDao")
	private ICommentsDao commentsDao;

	public CommentsService(){
		
	}
	
	/**
	 * 
	* Method : selectComments_boardNo
	* 작성자 : macbook
	* 변경이력 :
	* @param boardNo
	* @return
	* Method 설명 : 게시글 별 댓글 조회
	 */
	@Override
	public List<CommentsVo> selectComments_boardNo(String boardNo) {
		List<CommentsVo> selectComments_boardNo = commentsDao.selectComments_boardNo(boardNo);
		return selectComments_boardNo;
	}

	/**
	 * 
	* Method : insertComments
	* 작성자 : macbook
	* 변경이력 :
	* @param commentsVo
	* @return
	* Method 설명 : 댓글 등록
	 */
	@Override
	public int insertComments(CommentsVo commentsVo) {
		int insertComments = commentsDao.insertComments(commentsVo);
		return insertComments;
	}

	/**
	 * 
	* Method : deleteComments
	* 작성자 : macbook
	* 변경이력 :
	* @param commentNo
	* @return
	* Method 설명 : 댓글 삭제
	 */
	@Override
	public int deleteComments(String boardNo) {
		int deleteComments = commentsDao.deleteComments(boardNo);
		return deleteComments;
	}

	/**
	 * 
	* Method : updateComments
	* 작성자 : macbook
	* 변경이력 :
	* @param commentsVo
	* @return
	* Method 설명 : 댓글 수정
	 */
	@Override
	public int updateComments(CommentsVo commentsVo) {
		int updateComments = commentsDao.updateComments(commentsVo);
		return updateComments;
	}

}
