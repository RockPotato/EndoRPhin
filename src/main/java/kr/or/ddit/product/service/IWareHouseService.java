package kr.or.ddit.product.service;

import java.util.List;

import kr.or.ddit.product.model.WareHouseVo;

public interface IWareHouseService {
	List<WareHouseVo> getAllWarehouse();
	WareHouseVo selectWarehouse(String wareHouseCode);
	int deleteWarehouse(String wareHouseCode);
	int insertWarehouse(WareHouseVo wareHouseVo);
	int updateWarehouse(WareHouseVo wareHouseVo);
}
