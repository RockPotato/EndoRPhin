package kr.or.ddit.board.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.board.model.Attach_boardVo;
@Repository("attach_boardDao")
public class Attach_boardDao implements IAttach_boardDao{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 
	* Method : attachBoardNoSelect
	* 작성자 : macbook
	* 변경이력 :
	* @param boarno
	* @return
	* Method 설명 : 게시글 번호 별 첨부파일 조회
	 */
	@Override
	public List<Attach_boardVo> attachBoardNoSelect(String boardno) {
		List<Attach_boardVo> attachBoardNoSelect = sqlSession.selectList("attach_board.attachBoardNoSelect", boardno);
		return attachBoardNoSelect;
	}

	/**
	 * 
	* Method : attachCodeSelectOne
	* 작성자 : macbook
	* 변경이력 :
	* @param attachcode
	* @return
	* Method 설명 : 첨부파일 번호 조회
	 */
	@Override
	public Attach_boardVo attachCodeSelectOne(String attachcode) {
		Attach_boardVo attachCodeSelectOne = sqlSession.selectOne("attach_board.attachCodeSelectOne", attachcode);
		return attachCodeSelectOne;
	}

	/**
	 * 
	* Method : attachInsert
	* 작성자 : macbook
	* 변경이력 :
	* @param attach_boardVo
	* @return
	* Method 설명 : 첨부파일 등록
	 */
	@Override
	public int attachInsert(Attach_boardVo attach_boardVo) {
		int attachInsert = sqlSession.insert("attach_board.attachInsert", attach_boardVo);
		return attachInsert;
	}

	/**
	 * 
	* Method : attachUpdate
	* 작성자 : macbook
	* 변경이력 :
	* @param attach_boardVo
	* @return
	* Method 설명 : 첨부파일 수정
	 */
	@Override
	public int attachUpdate(Attach_boardVo attach_boardVo) {
		int attachUpdate = sqlSession.update("attach_board.attachUpdate", attach_boardVo);
		return attachUpdate;
	}

	/**
	 * 
	* Method : attach_boardDelete
	* 작성자 : macbook
	* 변경이력 :
	* @param boardno
	* @return
	* Method 설명 : 첨부파일 삭제
	 */
	@Override
	public int attach_boardDelete(String attachCode) {
		int attach_boardDelete = sqlSession.delete("attach_board.attach_boardDelete", attachCode);
		return attach_boardDelete;
	}
	

}
