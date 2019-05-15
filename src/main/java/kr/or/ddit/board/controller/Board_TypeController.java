package kr.or.ddit.board.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.board.model.Board_TypeVo;
import kr.or.ddit.board.service.IBoard_TypeService;

@Controller
public class Board_TypeController {
	
	@Resource(name="board_TypeService")
	private IBoard_TypeService board_TypeService;
	
	@RequestMapping(path="/boardType", method=RequestMethod.GET)
	public String boardType(Model model){
		List<Board_TypeVo> boardAllList = board_TypeService.boardAllList();
		model.addAttribute("boardAllList", boardAllList);
		return "boardType";
	}
	@RequestMapping(path="/boardType", method=RequestMethod.POST)
	public String boardType(Board_TypeVo board_TypeVo, String boardTypeName, @RequestParam("type")String type){
		
		if(type.equals("create")){
			board_TypeService.insertBoard(boardTypeName);
			
		}else if(type.equals("update")){
			
			board_TypeService.updateBoard(board_TypeVo);
		}
		
		return "redirect:/boardType";
		
	}
	
}
