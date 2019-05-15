package kr.or.ddit.board.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.board.model.CommentsVo;

@Repository("commentsDao")
public class CommentsDao implements ICommentsDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

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
		List<CommentsVo> selectComments_boardNo = sqlSession.selectList("comments.selectComments_boardNo", boardNo);
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
		sqlSession.insert("comments.insertComments", commentsVo);
		return 0;
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
		int deleteComments = sqlSession.delete("comments.deleteComments", boardNo);
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
		int updateComments = sqlSession.update("comments.updateComments", commentsVo);
		return updateComments;
	}


}
