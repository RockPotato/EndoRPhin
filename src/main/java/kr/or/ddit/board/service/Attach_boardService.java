package kr.or.ddit.board.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.board.dao.IAttach_boardDao;
import kr.or.ddit.board.model.Attach_boardVo;

@Service("attach_boardService")
public class Attach_boardService implements IAttach_boardService{
	
	@Resource(name="attach_boardDao")
	private IAttach_boardDao attach_boardDao;

	public Attach_boardService(){
		
	}

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
		List<Attach_boardVo> attachBoardNoSelect = attach_boardDao.attachBoardNoSelect(boardno);
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
		Attach_boardVo attachCodeSelectOne = attach_boardDao.attachCodeSelectOne(attachcode);
		return attachCodeSelectOne;
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
		int attach_boardDelete = attach_boardDao.attach_boardDelete(attachCode);
		return attach_boardDelete;
	}

	
}
