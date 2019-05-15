package kr.or.ddit.board.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.board.model.Attach_boardVo;
import kr.or.ddit.board.model.Board_detailVo;
import kr.or.ddit.board.model.CommentsVo;
import kr.or.ddit.util.model.PageVo;

public interface IBoard_detailService {

	/**
	 * 
	* Method : postDetail
	* 작성자 : macbook
	* 변경이력 :
	* @param boardNo
	* @return
	* Method 설명 : 게시글 상세 조회
	 */
	Map<String, Object>postDetail(String boardNo);
	
	/**
	 * 
	* Method : postInsert
	* 작성자 : macbook
	* 변경이력 :
	* @param board_detailVo
	* @return
	* Method 설명 : 게시글 등록
	 */
	int postInsert(Board_detailVo board_detailVo, List<Attach_boardVo> attachList);
	
	/**
	 * 
	* Method : postUpdate
	* 작성자 : macbook
	* 변경이력 :
	* @param board_detailVo
	* @return
	* Method 설명 : 게시글 수정
	 */
	int postUpdate(Board_detailVo board_detailVo, List<Attach_boardVo> attachList);
	
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
	Map<String, Object> selectPostList(PageVo pageVo);
	
	/**
	 * 
	* Method : select_latelyPost
	* 작성자 : macbook
	* 변경이력 :
	* @param boardno
	* @return
	* Method 설명 : 작성한 게시글의 최신글번호 조회
	 */
	Board_detailVo select_latelyPost(String boardTypeCode);
	
	
	//=====================테스트=========================
	/**
	 * 
	* Method : selectBoardList
	* 작성자 : macbook
	* 변경이력 :
	* @return
	* Method 설명 : 게시글 리스트 조회
	 */
	Map<String, Object> selectBoardList(PageVo pageVo);
	
	/**
	 * 
	* Method : insertBoard
	* 작성자 : macbook
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 게시글 등록
	 */
	int insertBoard(Board_detailVo param, List<Attach_boardVo> attachList);
	
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
	int updateBoard(Board_detailVo param, List<Attach_boardVo> attachList, String[] removeList);
	
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
	* Method : updateBoardReply
	* 작성자 : macbook
	* 변경이력 :
	* @param param
	* Method 설명 : 댓글 수정
	 */
	public void updateBoardReply(CommentsVo param);
	
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
	* Method : selectBoardReplyList
	* 작성자 : macbook
	* 변경이력 :
	* @param param
	* @return
	* Method 설명 : 댓글 리스트 조회
	 */
	public List<CommentsVo> selectBoardReplyList(String param);
	
	/**
	 * 
	* Method : deleteCommnetOne
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
	
	public void updateViewsRead(String boardNo);
	
}
