package kr.or.ddit.board_detail.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.attitude.service.AttitudeServiceTest;
import kr.or.ddit.board.model.Board_detailVo;
import kr.or.ddit.board.service.IBoard_detailService;
import kr.or.ddit.set.LogicConfig;
import kr.or.ddit.util.model.PageVo;

public class Board_detailServiceTest extends LogicConfig{

	private Logger logger = LoggerFactory.getLogger(AttitudeServiceTest.class);
	
	@Resource(name="board_detailService")
	private IBoard_detailService board_detailService;
	
	@Test
	public void SearchPost() {
		
		
		Board_detailVo vo = new Board_detailVo();
		vo.setTitle("cxzv");
		//vo.setContents("e");
		//vo.setUserId("1");
		vo.setStartDate("2019-04-16");
		vo.setEndDate("2019-04-20");
		
		
		List<Board_detailVo> searchPostList = board_detailService.SearchPostList(vo);
		
		System.out.println("검색 :" + searchPostList);
		
	}
	
//	@Test
	public void boardListTest(){
		PageVo pageVo = new PageVo();
		Map<String, Object> resultMap = board_detailService.selectPostList(pageVo);
		List<Board_detailVo> boardList = (List<Board_detailVo>) resultMap.get("postList");
		for(Board_detailVo vo : boardList){
			System.out.println(vo);
			System.out.println("userCnt : " + boardList);
		}
		
	}

}
