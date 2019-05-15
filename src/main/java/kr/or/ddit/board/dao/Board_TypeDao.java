package kr.or.ddit.board.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.board.model.Board_TypeVo;

@Repository("board_TypeDao")
public class Board_TypeDao implements IBoard_TypeDao{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 
	* Method : boardAllList
	* 작성자 : macbook
	* 변경이력 :
	* @return
	* Method 설명 : 전체 게시판 전체 조회
	 */
	@Override
	public List<Board_TypeVo> boardAllList() {
		List<Board_TypeVo> boardList = sqlSession.selectList("board_type.boardAllList");
		return boardList;
	}

	/**
	 * 
	* Method : insertBoard
	* 작성자 : macbook
	* 변경이력 :
	* @param board_TypeVo
	* @return
	* Method 설명 : 게시판 생성
	 */
	@Override
	public int insertBoard(String boardTypeName) {
		int insertBoard = sqlSession.insert("board_type.boardInsert", boardTypeName);
		return insertBoard;
	}

	/**
	 * 
	* Method : updateBoard
	* 작성자 : macbook
	* 변경이력 :
	* @param board_TypeVo
	* @return
	* Method 설명 : 게시글 수정
	 */
	@Override
	public int updateBoard(Board_TypeVo board_TypeVo) {
		int updateBoard = sqlSession.update("board_type.boardUpdate", board_TypeVo);
		return updateBoard;
	}

	@Override
	public int deleteBoard(String boardTypeCode) {
		int deleteBoard = sqlSession.delete("board_type.boardDelete", boardTypeCode);
		return deleteBoard;
	}

	/**
	 * 
	* Method : select_BoardName
	* 작성자 : macbook
	* 변경이력 :
	* @param board_name
	* @return
	* Method 설명 : 게시판 조회
	 */
	@Override
	public Board_TypeVo select_BoardType(String board_name) {
		Board_TypeVo select_BoardType = sqlSession.selectOne("board_type.boardUpdate", board_name);
		return select_BoardType;
	}

	


}
