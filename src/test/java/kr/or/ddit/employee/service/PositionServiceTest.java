package kr.or.ddit.employee.service;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.employee.model.EmployeeVo;
import kr.or.ddit.employee.model.Employee_detailVo;
import kr.or.ddit.employee.model.PositionVo;
import kr.or.ddit.set.LogicConfig;

public class PositionServiceTest extends LogicConfig{
	private Logger logger = LoggerFactory.getLogger(PositionServiceTest.class);

	@Resource(name = "positionService")
	private IPositionService positionService;
	
	
	@Test
	public void selectEmployeeTest() {
		List<PositionVo> allPosition = positionService.getAllPosition();
		logger.debug("이클 : {}",allPosition);
	}
	
	@Test
	public void insertPositionTest() {
		PositionVo vo = new PositionVo();
		vo.setPositionCode("50");
		vo.setPositionName("1");
		vo.setRank("1");
		vo.setPositionStatus("직급");
		 positionService.insertPosition(vo);
	}
	
	@Test
	public void updatePositionTest() {
		PositionVo vo = new PositionVo();
		vo.setPositionCode("1");
		vo.setPositionName("대장");
		vo.setRank("99");
		vo.setUseStatus("사용");
		vo.setPositionStatus("직책");
		
		positionService.updatePosition(vo);
		
		
	}
	
	

}
