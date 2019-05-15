package kr.or.ddit.slip.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.slip.dao.ISlipDao;
import kr.or.ddit.slip.model.SlipVo;
import kr.or.ddit.util.model.PageVo;

@Service("slipService")
public class SlipService implements ISlipService {

	@Resource(name = "slipDao")
	private ISlipDao slipDao;

	/**
	 * Method : selectSlipPagingList 작성자 : sanghoyun 변경이력 :
	 * 
	 * @param pageVo
	 * @return Method 설명 : 페이징처리를 위한 쿼리 실행
	 */
	@Override
	public Map<String, Object> selectSlipPagingList(PageVo pageVo) {
		Map<String, Object> resultMap = new HashMap<String, Object>();

		resultMap.put("slipList", slipDao.selectSlipPagingList(pageVo));
		resultMap.put("slipCnt", slipDao.getSlipCount(pageVo.getBoardTypeCode()));
		return resultMap;
	}

	/**
	 * Method : getSlipCnt 작성자 : sanghoyun 변경이력 :
	 * 
	 * @return Method 설명 : 전표 수량 확인
	 */
	@Override
	public int getSlipCnt(String status) {
		return slipDao.getSlipCount(status);
	}

	@Override
	public int updateSlip(String status) {
		return slipDao.updateSlip(status);
	}

	@Override
	public int updateSlip_paaprovuar(String status) {
		return slipDao.updateSlip_paaprovuar(status);
	}

	/**
	 * Method : insertSlip 작성자 : sanghoyun 변경이력 :
	 * 
	 * @param slipVo
	 * @return Method 설명 : 전표 추가 메서드
	 */
	@Override
	public int insertSlip(SlipVo slipVo) {
		return slipDao.insertSlip(slipVo);

	}

	@Override
	public String currvalSeq() {
		return slipDao.currvalSeq();
	}

	/**
	 * Method : deleteSlip 작성자 : sanghoyun 변경이력 :
	 * 
	 * @param slipNumber
	 * @return Method 설명 : 전표 삭제
	 */
	@Override
	public int deleteSlip(String slipNumber) {
		return slipDao.deleteSlip(slipNumber);
	}

	public int finalSaveSlip(SlipVo slipVo) {
		return slipDao.finalSaveSlip(slipVo);
	}
	

	@Override
	public List<SlipVo> getBetweenSlip(String pre_date, String post_date) {
		return slipDao.getBetweenSlip(pre_date, post_date);
	}

	@Override
	public List<SlipVo> getBetweenSlip_zero(String pre_date, String post_date) {
		return slipDao.getBetweenSlip_zero(pre_date, post_date);

	}

	@Override
	public int getSlipMax() {
		return slipDao.getSlipMax();
	}


}
