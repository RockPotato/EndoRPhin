package kr.or.ddit.company.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.company.dao.ICardsDao;
import kr.or.ddit.company.model.CardsVo;

@Service("cardsService")
public class CardsService implements ICardsService{

	@Resource(name="cardsDao")
	private ICardsDao cardsDao;
	
	public CardsService() {
	
	}
	@Override
	public List<CardsVo> getAllCards() {
		return cardsDao.getAllCards();
	}

	public CardsVo selectCards(String cardCode) {
		return cardsDao.selectCards(cardCode);
	}
	@Override
	public int insertCards(CardsVo cardVo) {
		return cardsDao.insertCards(cardVo);
	}

	@Override
	public int updateCards(CardsVo cardVo) {
		return cardsDao.updateCards(cardVo);
	}

	@Override
	public int deleteCards(String cardCode) {
		return cardsDao.deleteCards(cardCode);
	}
	
	@Override
	public int upateStatusCards(CardsVo cardVo) {
		return cardsDao.upateStatusCards(cardVo);
	}
	@Override
	public List<CardsVo> serachCards(String cardNumber, String cardName) {
		return cardsDao.serachCards(cardNumber,cardName);
	}

}
