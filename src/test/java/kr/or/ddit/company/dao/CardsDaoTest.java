package kr.or.ddit.company.dao;

import static org.junit.Assert.assertNotNull;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.company.model.CardsVo;
import kr.or.ddit.set.LogicConfig;

public class CardsDaoTest extends LogicConfig{

	@Resource(name="cardsDao")
	ICardsDao cardsDao;
	
	@Test
	public void updateCardsTest() {
	    CardsVo cardsVo = new CardsVo();
	    cardsVo.setCardCode("1");
	    cardsVo.setCardName("농협카드");
	    cardsVo.setCardNumber("45454");
	    cardsVo.setCardSortation("1");
	    cardsVo.setMemo("55");
	    cardsVo.setCompanyCode("1");
	    cardsVo.setStatus("1");
	    
	    int updCnt = cardsDao.updateCards(cardsVo);
		assertNotNull(updCnt);
	    
	}
	
	@Test
	public void updateUseTest() {
	    CardsVo cardsVo = new CardsVo();
	    cardsVo.setCardCode("1");
	    cardsVo.setStatus("1");
	    
	    int updCnt = cardsDao.upateStatusCards(cardsVo);
		assertNotNull(updCnt);
	    
	}
		
}
