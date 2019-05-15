package kr.or.ddit.product.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.product.dao.IWareHouseDao;
import kr.or.ddit.product.model.WareHouseVo;

@Service("wareHouseService")
public class WareHouseService implements IWareHouseService {

	@Resource(name="wareHouseDao")
	IWareHouseDao wareHouseDao;
	
	@Override
	public List<WareHouseVo> getAllWarehouse() {
		return wareHouseDao.getAllWarehouse();
	}

	@Override
	public WareHouseVo selectWarehouse(String wareHouseCode) {
		return wareHouseDao.selectWarehouse(wareHouseCode);
	}

	@Override
	public int deleteWarehouse(String wareHouseCode) {
		return wareHouseDao.deleteWarehouse(wareHouseCode);
	}

	@Override
	public int insertWarehouse(WareHouseVo wareHouseVo) {
		return wareHouseDao.insertWarehouse(wareHouseVo);
	}

	@Override
	public int updateWarehouse(WareHouseVo wareHouseVo) {
		return wareHouseDao.updateWarehouse(wareHouseVo);
	}

}
