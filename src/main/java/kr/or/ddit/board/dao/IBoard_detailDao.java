package kr.or.ddit.board.dao;

import java.util.List;

import kr.or.ddit.board.model.Attach_boardVo;
import kr.or.ddit.board.model.Board_detailVo;
import kr.or.ddit.board.model.CommentsVo;
import kr.or.ddit.slip.model.SlipVo;
import kr.or.ddit.util.model.PageVo;

public interface IBoard_detailDao {

	/**
	 * 
	* Method : postDetail
	* 작성자 : macbook
	* 변경이력 :
	* @param boardNo
	* @return
	* Method 설명 : 게시글 상세 조회
	 */
	Board_detailVo postDetail(String boardNo);
	
	/**
	 * 
	* Method : postCnt
	* 작성자 : macbook
	* 변경이력 :
	* @param boardNo
	* @return
	* Method 설명 : 게시판 별 게시글 수 조회
	 */
	int postCnt(String boardTypeCode);
	
	/**
	 * 
	* Method : postInsert
	* 작성자 : macbook
	* 변경이력 :
	* @param board_detailVo
	* @return
	* Method 설명 : 게시글 등록
	 */
	int postInsert(Board_detailVo board_detailVo);
	
	/**
	 * 
	* Method : postUpdate
	* 작성자 : macbook
	* 변경이력 :
	* @param board_detailVo
	* @return
	* Method 설명 : 게시글 수정
	 */
	int postUpdate(Board_detailVo board_detailVo);
	
	/**
	 * 
	* Method : postDelete
	* 작성자 : macbook
	* 변경이력 :
	* @param boardno
	* @return
	* Method 설명 : 게시글 삭제
	 */
	int postDelete(String boardno);
	
	/**
	 * 
	* Method : selectPostList
	* 작성자 : macbook
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : 게시글 목록 조회
	 */ 
	List<Board_detailVo> selectPostList(PageVo pageVo);
	
	/**
	 * 
	* Method : select_boardPost
	* 작성자 : macbook
	* 변경이력 :
	* @param boardTypeCode
	* @return
	* Method 설명 : 게시판 별 최신 게시글 조회
	 */
	Board_detailVo select_boardPost(String boardTypeCode);

	//===================테스트==========================
	/**
	 * 
	* Method : selectBoardList
	* 작성자 : macbook
	* 변경이력 :
	* @return
	* Method 설명 : 게시글 리스트 조회
	 */
	List<Board_detailVo> selectBoardList(PageVo param);
	
	/**
	 * 
	* Method : insertBoard
	* 작성자 : macbook
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 게시글 등록 & 게시글 수정
	 */
	int insertBoard(Board_detailVo param);
	
	/**
	 * 
	* Method : selectBoardOne
	* 작성자 : macbook
	* 변경이력 :
	* @param boardNo
	* @return
	* Method 설명 : 게시글 상세조회
	 */
	Board_detailVo selectBoardOne(String boardNo); 
	
	/**
	 * 
	* Method : updateBoard
	* 작성자 : macbook
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 게시글 수정
	 */
	int updateBoard(Board_detailVo param);
	
	/**
	 * 
	* Method : deleteBoardOne
	* 작성자 : macbook
	* 변경이력 :
	* @param boardNo
	* @return
	* Method 설명 : 게시글 삭제
	 */
	int deleteBoardOne(String boardNo);
	
	/**
	 * 
	* Method : selectBoardCount
	* 작성자 : macbook
	* 변경이력 :
	* @param boardTypeCode
	* @return
	* Method 설명 : 게시판 별 게시글 전체 갯수
	 */
	Integer selectBoardCount(String boardTypeCode);
	
	/**
	 * 
	* Method : insertBoardReply
	* 작성자 : macbook
	* 변경이력 :
	* @param param
	* Method 설명 : 댓글 등록
	 */
	public void insertBoardReply(CommentsVo param);
	
	/**
	 * 
	* Method : updateBoardReply
	* 작성자 : macbook
	* 변경이력 :
	* @param param
	* Method 설명 : 댓글 수정
	 */
	public void updateBoardReply(CommentsVo param);
	
	/**
	 * 
	* Method : selectBoard5ReplyList
	* 작성자 : macbook
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 댓글 리스트 조회
	 */
	public List<CommentsVo> selectBoardReplyList(String param);
	
	/**
	 * 
	* Method : deleteBoardOne
	* 작성자 : macbook
	* 변경이력 :
	* @param boardNo
	* @return
	* Method 설명 : 댓글 삭제
	 */
	public int deleteBoardReply(String commentNo);
	
	/**
	 * 
	* Method : selectBoardFileList
	* 작성자 : macbook
	* 변경이력 :
	* @param boardNo
	* @return
	* Method 설명 : 첨부파일 리스트 조회
	 */
	public List<Attach_boardVo> selectBoardFileList(String boardNo);

	/**
	 * 
	* Method : selectBoardFileList
	* 작성자 : macbook
	* 변경이력 :
	* @param boardNo
	* @return
	* Method 설명 : 글 검색
	 */
	public List<Board_detailVo> SearchPostList(Board_detailVo vo);
	
	/**
	 * 
	* Method : updateViewsRead
	* 작성자 : macbook
	* 변경이력 :
	* @param boardNo
	* Method 설명 : 조회수 증가
	 */ 
	public void updateViewsRead(String boardNo);
	
}
