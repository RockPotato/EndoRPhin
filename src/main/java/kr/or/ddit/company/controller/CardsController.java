package kr.or.ddit.company.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.company.model.CardsVo;
import kr.or.ddit.company.service.ICardsService;

@Controller 
public class CardsController {

	private Logger logger = LoggerFactory.getLogger(CardsController.class);

	@Resource(name="cardsService")
	private ICardsService cardsService;
	
	
	//카드 목록 전체 출력
	@RequestMapping("/cardsList")
	public String getAllCards(Model model){
		
		List<CardsVo> cardsList = cardsService.getAllCards();
		model.addAttribute("cardsList",cardsList);
		
		return "cardsList";
	}
	
	//검색
	@RequestMapping(path="/serachCards", method=RequestMethod.GET)
	public String serachCards(CardsVo cardsVo, Model model, @RequestParam("card_num") String card_num,
										@RequestParam("card_name") String card_name){
		
		List<CardsVo> cardsList = cardsService.serachCards(card_num, card_name);
		model.addAttribute("cardsList",cardsList);
		
		return "cardsList";
	
	}
	
	//삭제 
	@RequestMapping(path="/deleteCards", method=RequestMethod.GET)
	public String deleteCards(Model model, @RequestParam("checkRow") String checkRow ){

		String[] arrIdx = checkRow.toString().split(",");
	
        for (int i=0; i<arrIdx.length; i++) {
		    int delCnt = cardsService.deleteCards(arrIdx[i]);
		}
		
		return "redirect:/cardsList";
	}
	
	//상세보기 
	@RequestMapping(path="/cardsDetail", method=RequestMethod.GET)
	public String cardsDetail(CardsVo cards, Model model, @RequestParam("cardCode") String cardCode ){
		
		
		cards = cardsService.selectCards(cardCode);
		
		model.addAttribute("cards", cards);
		model.addAttribute("cardCode",cardCode);
		
		return "cardsDetail";
	}
	
	//등록
	@RequestMapping(path="/insertCards", method=RequestMethod.GET)
	public String insertCards(CardsVo cardsVo, Model model, @RequestParam("frmcardCode") String frmcardCode 
															,@RequestParam("frmcardSortation") String frmcardSortation
															,@RequestParam("frmcardNumber") String frmcardNumber
															,@RequestParam("frmcardName") String frmcardName
															,@RequestParam(name="frmmemo", defaultValue="") String frmmemo){
		
		cardsVo.setCardCode(frmcardCode);
		cardsVo.setCardSortation(frmcardSortation);
		cardsVo.setCardNumber(frmcardNumber);
		cardsVo.setCardName(frmcardName);
		cardsVo.setMemo(frmmemo);
		cardsVo.setCompanyCode("1");
		cardsVo.setStatus("1");
		
		int insertCnt = cardsService.insertCards(cardsVo);
		if(insertCnt > 0){
			return "redirect:/cardsList";
		}else{
			return "redirect:/cardsList";
		}
	}
	
	//중복체크 
	@RequestMapping(path="/DupleCards", method=RequestMethod.POST)
	@ResponseBody
	public String DuplCards(@RequestParam(name="cardCode", defaultValue="empty") String cardCode){
		List<CardsVo> cardsList = cardsService.getAllCards();
		
		// |"0":중복 x |"1" : 중복  | "2": 중복체크 클릭 x|
		String dupleCode = "0"; // 중복안될 때  
		
		for(int i = 0; i < cardsList.size(); i++){
			
			if(cardCode.equals(cardsList.get(i).getCardCode())){
				dupleCode = "1";
				return dupleCode;
			}else if(cardCode.equals("empty")){
				dupleCode = "empty";
				return dupleCode;
			}
		}
		
		return dupleCode;
	}
	//수정
	@RequestMapping(path="/updateCards", method=RequestMethod.GET)
	public String updateCards(CardsVo selCards, Model model,@RequestParam("frmcardCode") String frmcardCode
															,@RequestParam("frmcardSortation") String frmcardSortation
															,@RequestParam("frmcardNumber") String frmcardNumber
															,@RequestParam("frmcardName") String frmcardName
															,@RequestParam("status") String status
															,@RequestParam(name="frmmemo", defaultValue="") String frmmemo){
		
		logger.debug("======================");
		logger.debug("frmcardCode : {}" , frmcardCode);
		logger.debug("status : {}" ,status);
		selCards.setCardCode(frmcardCode);
		selCards.setCardName(frmcardName);
		selCards.setCardNumber(frmcardNumber);
		selCards.setCardSortation(frmcardSortation);
		selCards.setMemo(frmmemo);
		selCards.setCompanyCode("1");
		selCards.setStatus(status);
		
//		model.addAttribute("selCards",selCards);
		
		int updateCnt = cardsService.updateCards(selCards);
		
		if(updateCnt > 0){
			return "redirect:/cardsDetail?cardCode="+frmcardCode;
		}else{
			return "redirect:/cardsDetail?cardCode="+frmcardCode;
		}
	}
	//사용, 미사용 여부 
	@RequestMapping(path="/UseCards", method=RequestMethod.GET)
	public String UseCards(CardsVo cardVo, Model model, @RequestParam("use_status") String use_status
														,@RequestParam("use_cardCode") String use_cardCode){
		
		cardVo.setCardCode(use_cardCode);
		cardVo.setStatus(use_status);
		int update = cardsService.upateStatusCards(cardVo);
		
		if(update > 0){
			return "redirect:/cardsList";
		}
		else{
			return "redirect:/cardsList";
		}
	}
}
