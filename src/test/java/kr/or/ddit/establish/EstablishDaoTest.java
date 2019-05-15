package kr.or.ddit.establish;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.set.LogicConfig;
import kr.or.ddit.tax_cal.dao.IEstablishDao;

public class EstablishDaoTest extends LogicConfig{
	
	private Logger logger = LoggerFactory.getLogger(EstablishDaoTest.class);
	
	@Resource(name="establishDao")
	private IEstablishDao establishDao;

	
	@Test
	public void getCountTest() {
		/***Given***/

		/***When***/
		int cnt = establishDao.getEstablishCount();
		logger.debug("Establish Count : {}", cnt);

		/***Then***/
	}
	
	
	

}
