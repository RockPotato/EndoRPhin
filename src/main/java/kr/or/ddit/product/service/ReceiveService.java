package kr.or.ddit.product.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.product.dao.IReceiveDao;
import kr.or.ddit.product.dao.IReceive_detailDao;
import kr.or.ddit.product.model.ReceiveVo;
import kr.or.ddit.product.model.Receive_detailVo;
import kr.or.ddit.tax_cal.model.Tax_calVo;

@Service("receiveService")
public class ReceiveService implements IReceiveService{

	@Resource(name="receiveDao")
	IReceiveDao receiveDao;
	
	@Resource(name="receive_detailDao")
	IReceive_detailDao receive_detailDao;
	
	@Override
	public int insertReceive(ReceiveVo receiveVo) {
		return receiveDao.insertReceive(receiveVo);
	}

	@Override
	public int deleteReceive(String receiveCode) {
		return receiveDao.deleteReceive(receiveCode);
	}

	@Override
	public int updateReceive(ReceiveVo receiveVo) {
		return receiveDao.updateReceive(receiveVo);
	}


	@Override
	public List<ReceiveVo> getAllReceive(Map<String, Object> map) {
		return receiveDao.getAllReceive(map);
	}


	@Override
	public List<ReceiveVo> selectReceive(Map<String,Object> map) {
		return receiveDao.selectReceive(map);
	}

	@Override
	public Map<String, Object> selectReceiveNdetail(String orderCode) {
		Map<String,Object> map = new HashMap<>();
		map.put("orderCode",orderCode);
		List<ReceiveVo> allReceive = receiveDao.selectReceive(map);
		List<List<Receive_detailVo>> allList = new ArrayList<>();
		for (ReceiveVo receiveVo : allReceive) {
			if(receiveVo.getSortation().equals("0"))
				allList.add(receive_detailDao.getReceive_detail(receiveVo.getReceiveCode()));
		}
		map.put("allReceive", allReceive);
		map.put("allReceiveDetail", allList);
		return map;
	}

	@Override
	public List<ReceiveVo> groupSelectReceiveWhileThisYear(String today) {
		Map<String, Object> map = new HashMap<>();
		
		List<ReceiveVo> list = new ArrayList<>();
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
			List<ReceiveVo> tempList;
			String rdate;
			if (i < 10){
				rdate=split[0] + "0" + i;
				tempList=receiveDao.groupSelectReceiveWhileThisYear(rdate);
			}
			else{
				rdate=split[0] + i;
				tempList=receiveDao.groupSelectReceiveWhileThisYear(rdate);
			}
			
			if(tempList.isEmpty()){
				list.add(new ReceiveVo(rdate,"0","0",null));
				list.add(new ReceiveVo(rdate,"1","0",null));
			}else if(tempList.size()==1){
				list.add(tempList.get(0));
				if(tempList.get(0).getSortation().equals("0"))
					list.add(new ReceiveVo(rdate,"1","0",null));
				else
					list.add(new ReceiveVo(rdate,"0","0",null));
			}else{
				list.addAll(tempList);
			}
		}
		return list;
	}



}
