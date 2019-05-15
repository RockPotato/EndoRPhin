package kr.or.ddit.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.board.model.Attach_boardVo;
import kr.or.ddit.board.model.Board_detailVo;
import kr.or.ddit.board.model.CommentsVo;
import kr.or.ddit.util.model.PageVo;

@Repository("board_detailDao")
public class Board_detailDao implements IBoard_detailDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	/**
	 * 
	* Method : postDetail
	* 작성자 : macbook
	* 변경이력 :
	* @param boardNo
	* @return
	* Method 설명 : 게시글 상세 조회
	 */
	@Override
	public Board_detailVo postDetail(String boardNo) {
		Board_detailVo Board_detailVo = sqlSession.selectOne("board_detail.postDetail", boardNo);
		return Board_detailVo;
	}

	/**
	 * 
	* Method : postCnt
	* 작성자 : macbook
	* 변경이력 :
	* @param boardNo
	* @return
	* Method 설명 : 게시판 별 게시글 수 조회
	 */
	@Override
	public int postCnt(String boardTypeCode) {
		int postCnt = sqlSession.selectOne("board_detail.postCnt", boardTypeCode);
		return postCnt;
	}

	/**
	 * 
	* Method : postInsert
	* 작성자 : macbook
	* 변경이력 :
	* @param board_detailVo
	* @return
	* Method 설명 : 게시글 등록
	 */
	@Override
	public int postInsert(Board_detailVo board_detailVo) {
		int postInsert = sqlSession.insert("board_detail.postInsert", board_detailVo);
		return postInsert;
	}

	/**
	 * 
	* Method : postUpdate
	* 작성자 : macbook
	* 변경이력 :
	* @param board_detailVo
	* @return
	* Method 설명 : 게시글 수정
	 */
	@Override
	public int postUpdate(Board_detailVo board_detailVo) {
		int postUpdate = sqlSession.update("board_detail.postUpdate", board_detailVo);
		return postUpdate;
	}

	/**
	 * 
	* Method : postDelete
	* 작성자 : macbook
	* 변경이력 :
	* @param boardno
	* @return
	* Method 설명 : 게시글 삭제
	 */
	@Override
	public int postDelete(String boardno) {
		int postDelete = sqlSession.update("board_detail.postDelete", boardno);
		return postDelete;
	}

	/**
	 * 
	* Method : selectPostList
	* 작성자 : macbook
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : 게시글 목록 조회
	 */ 
	@Override
	public List<Board_detailVo> selectPostList(PageVo pageVo) {
		List<Board_detailVo> selectPostList = sqlSession.selectList("board_detail.selectPostList", pageVo);
		return selectPostList;
	}

	/**
	 * 
	* Method : select_boardPost
	* 작성자 : macbook
	* 변경이력 :
	* @param boardTypeCode
	* @return
	* Method 설명 : 게시판 별 최신 게시글 조회
	 */
	@Override
	public Board_detailVo select_boardPost(String boardTypeCode) {
		Board_detailVo select_boardPost = sqlSession.selectOne("board_detail.selectPostList", boardTypeCode);
		return select_boardPost;
	}

	//====================테스트======================
	/**
	 * 
	* Method : selectBoardList
	* 작성자 : macbook
	* 변경이력 :
	* @return
	* Method 설명 : 게시글 리스트 조회
	 */
	@Override
	public List<Board_detailVo> selectBoardList(PageVo param) {
		List<Board_detailVo> selectList = sqlSession.selectList("board_detail.selectBoardList", param);
		 return selectList;

	}

	/**
	 * 
	* Method : insertBoard
	* 작성자 : macbook
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 게시글 등록
	 */
	public int insertBoard(Board_detailVo param) {
        int insertBoard = sqlSession.insert("board_detail.insertBoard", param);
        return insertBoard;
	}

	/**
	 * 
	* Method : selectBoardOne
	* 작성자 : macbook
	* 변경이력 :
	* @param boardNo
	* @return
	* Method 설명 : 게시글 상세조회
	 */
	@Override
	public Board_detailVo selectBoardOne(String boardNo) {
		Board_detailVo selectBoardOne = sqlSession.selectOne("board_detail.selectBoardOne", boardNo);
		return selectBoardOne;
	}

	/**
	 * 
	* Method : updateBoard
	* 작성자 : macbook
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 게시글 수정
	 */
	@Override
	public int updateBoard(Board_detailVo param) {
		int updateBoard = sqlSession.update("board_detail.updateBoard", param);
		return updateBoard;
	}

	/**
	 * 
	* Method : deleteBoardOne
	* 작성자 : macbook
	* 변경이력 :
	* @param boardNo
	* @return
	* Method 설명 : 게시글 삭제
	 */
	@Override
	public int deleteBoardOne(String boardNo) {
		int deleteBoardOne = sqlSession.delete("board_detail.deleteBoardOne", boardNo);
		return deleteBoardOne;
	}

	/**
	 * 
	* Method : selectBoardCount
	* 작성자 : macbook
	* 변경이력 :
	* @param boardTypeCode
	* @return
	* Method 설명 : 게시판 별 게시글 전체 갯수
	 */
	@Override
	public Integer selectBoardCount(String boardTypeCode) {
		Integer selectBoardCount = sqlSession.selectOne("board_detail.selectBoardCount", boardTypeCode);
		return selectBoardCount;
	}

	/**
	 * 
	* Method : insertBoardReply
	* 작성자 : macbook
	* 변경이력 :
	* @param param
	* Method 설명 : 댓글 등록
	 */
	@Override
	public void insertBoardReply(CommentsVo param) {
		sqlSession.insert("comments.insertBoardReply", param);
		
	}

	/**
	 * 
	* Method : updateBoardReply
	* 작성자 : macbook
	* 변경이력 :
	* @param param
	* Method 설명 : 댓글 수정
	 */
	@Override
	public void updateBoardReply(CommentsVo param) {
		sqlSession.update("comments.updateBoardReply", param);
		
	}

	/**
	 * 
	* Method : selectBoardReplyList
	* 작성자 : macbook
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 댓글 리스트 조회
	 */
	@Override
	public List<CommentsVo> selectBoardReplyList(String param) {
		return sqlSession.selectList("comments.selectBoardReplyList", param);
	}

	/**
	 * 
	* Method : deleteCommnetOne
	* 작성자 : macbook
	* 변경이력 :
	* @param boardNo
	* @return
	* Method 설명 : 댓글 삭제
	 */
	@Override
	public int deleteBoardReply(String commentNo) {
		
		return sqlSession.delete("comments.deleteBoardReply", commentNo);
	}

	/**
	 * 
	* Method : selectBoardFileList
	* 작성자 : macbook
	* 변경이력 :
	* @param boardNo
	* @return
	* Method 설명 : 첨부파일 리스트 조회
	 */
	@Override
	public List<Attach_boardVo> selectBoardFileList(String boardNo) {
		return sqlSession.selectList("attach_board.attachBoardFileList", boardNo);
	}

	@Override
	public List<Board_detailVo> SearchPostList(Board_detailVo vo) {
		return sqlSession.selectList("board_detail.postSearch", vo);
	}

	/**
	 * 
	* Method : updateViewsRead
	* 작성자 : macbook
	* 변경이력 :
	* @param boardNo
	* Method 설명 : 조회수 증가
	 */
	@Override
	public void updateViewsRead(String boardNo) {
		sqlSession.update("board_detail.updateViewsRead", boardNo);
	}
}
