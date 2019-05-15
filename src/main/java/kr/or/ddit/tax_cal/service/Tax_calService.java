package kr.or.ddit.tax_cal.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.tax_cal.dao.ITax_calDao;
import kr.or.ddit.tax_cal.model.Tax_calVo;
import kr.or.ddit.util.model.PageVo;

@Service("tax_calService")
public class Tax_calService implements ITax_calService {

	@Resource(name = "tax_calDao")
	private ITax_calDao tax_calDao;

	@Override
	public Map<String, Object> selecTax_calPagingList(PageVo pageVo) {

		Map<String, Object> resultMap = new HashMap<String, Object>();

		resultMap.put("tax_calList", tax_calDao.selecTax_calPagingList(pageVo));
		resultMap.put("tax_calCnt", tax_calDao.getTax_calCnt());

		return resultMap;
	}

	@Override
	public int insertTax_cal(Tax_calVo tax_calVo) {
		return tax_calDao.insertTax_cal(tax_calVo);
	}

	@Override
	public String getTax_seqNextval() {
		return tax_calDao.getTax_seqNextval();
	}

	@Override
	public int updateTax_cal(Tax_calVo tax_calVo) {
		return tax_calDao.updateTax_cal(tax_calVo);
	}

	@Override
	public Map<String, Object> selecTax_calPagingList_search(PageVo pageVo) {

		Map<String, Object> resultMap = new HashMap<String, Object>();

		resultMap.put("tax_calList", tax_calDao.selecTax_calPagingList(pageVo));
		resultMap.put("tax_calCnt", tax_calDao.getTax_calCnt());

		return resultMap;
	}

	@Override
	public int deleteTax_cal(String salesCode) {
		return tax_calDao.deleteTax_cal(salesCode);
	}

	@Override
	public List<Tax_calVo> searchAllByType(Map<String, Object> map) {
		return tax_calDao.searchAllByType(map);
	}

	@Override
	public List<Tax_calVo> searchAllByType2(Map<String, Object> map) {
		return tax_calDao.searchAllByType2(map);
	}

	@Override
	public List<Tax_calVo> searchAllByType51(Map<String, Object> map) {
		return tax_calDao.searchAllByType51(map);
	}

	@Override
	public List<Map<String, String>> selectBy51(String startDate, String endDate) {
		return tax_calDao.selectBy51(startDate, endDate);
	}

	@Override
	public List<Tax_calVo> sumCheckSearchAllByType(String today) {
		Map<String, Object> map = new HashMap<>();
		
		List<Tax_calVo> list = new ArrayList<>();
		int start, end = 0;
		String[] split = today.split("-");
		if (Integer.parseInt(split[1]) <= 6) {
			start = 1;
			end = 6;
		} else {
			start = 6;
			end = 12;
		}
		map.put("sumCheck", 0);
		for (int i = start; i <= end; i++) {
			if (i < 10)
				map.put("searchMonth", split[0] + "0" + i);
			else
				map.put("searchMonth", split[0] + i);
			list.add(tax_calDao.searchAllByType(map).get(0));
			list.add(tax_calDao.searchAllByType2(map).get(0));
		}
		return list;
	}

}
