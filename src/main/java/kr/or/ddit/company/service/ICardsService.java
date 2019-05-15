package kr.or.ddit.company.service;

import java.util.List;

import kr.or.ddit.company.model.CardsVo;

public interface ICardsService {
	
	List<CardsVo> getAllCards();
	
	CardsVo selectCards(String cardCode);
	
	List<CardsVo> serachCards(String cardNumber, String cardName);
	
	int insertCards(CardsVo cardVo);
	
	int updateCards(CardsVo cardVo);
	
	int deleteCards(String cardCode);
	
	int upateStatusCards(CardsVo cardVo);
}
